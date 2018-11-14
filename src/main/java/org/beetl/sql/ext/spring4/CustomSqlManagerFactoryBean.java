package org.beetl.sql.ext.spring4;

import app.common.DBType;
import org.beetl.sql.core.SQLManager;
import org.beetl.sql.core.db.CustomH2Style;
import org.beetl.sql.core.db.MySqlStyle;
import org.beetl.sql.core.db.OracleStyle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by landy on 2018/11/14.
 */
public class CustomSqlManagerFactoryBean extends SqlManagerFactoryBean {
    private Logger logger = LoggerFactory.getLogger(getClass());

    public DBType getDBType() throws SQLException {
        try (Connection conn = this.cs.getMaster()) {
            String databaseProductName = conn.getMetaData().getDatabaseProductName();
            logger.info("auto detect database, name: {}", databaseProductName);
            if (databaseProductName.toUpperCase().contains("ORACLE")) {
                return DBType.Oracle;
            } else if (databaseProductName.toUpperCase().contains("HIVE")) {
                return DBType.ApacheHive;
            } else if (databaseProductName.toUpperCase().contains("H2")) {
                return DBType.H2Database;
            } else {
                throw new IllegalStateException("Unsupported database: " + databaseProductName);
            }
        }
    }

    @Override
    public SQLManager getObject() throws Exception {
        if (this.cs != null) {
            DBType dt = getDBType();
            if (this.dbStyle == null) {
                switch (dt) {
                    case Oracle:
                        this.dbStyle = new OracleStyle();
                        break;
                    case H2Database:
                        this.dbStyle = new CustomH2Style();
                        break;
                    case Mysql:
                        this.dbStyle = new MySqlStyle();
                        break;
                }
                if (this.dbStyle != null) {
                    logger.info("auto choose dbStyle: {}", this.dbStyle.getClass().getName());
                }
            }
            if (dt == DBType.H2Database) {
                logger.info("h2database, use OFFSET_START_ZERO = true");
                this.extProperties.put("OFFSET_START_ZERO", "true");
            }
        }
        return super.getObject();
    }
}
