package app.listener;

import app.common.Texts;
import com.alibaba.druid.pool.DruidDataSource;
import org.flywaydb.core.Flyway;
import org.springframework.util.Assert;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;


public class DatabaseInitListener implements ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
    }

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        String flywayDataSource = servletContextEvent.getServletContext().getInitParameter("flywayDataSource");
        Assert.hasText(flywayDataSource, "content-param [flywayDataSource] must not empty!");
        WebApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContextEvent.getServletContext());
        Assert.notNull(applicationContext, "spring容器不能为空");
        DataSource datasource = applicationContext.getBean(flywayDataSource, DataSource.class);
        Assert.notNull(datasource, "spring容器中无法找到id为" + flywayDataSource + "的数据源");
        doDatabaseFlyway(datasource, servletContextEvent.getServletContext());
        if (Texts.hasText(System.getProperty("dev.initTestData"))) {
            TestDataInit.init(applicationContext);
        }
    }

    public static void doDatabaseFlyway(DataSource datasource, ServletContext logger) {
        try {
            // Create the Flyway instance
            Flyway flyway = new Flyway();
            logger.log("App database migrate start ...");
            flyway.setTable("T_SCHEMA_VERSION");
            flyway.setLocations("db/migration/" + getDbType(datasource));
//            flyway.setBaselineOnMigrate(true);
            flyway.setDataSource(datasource);
            // Start the migration
            flyway.migrate();
            logger.log("App database migrate over");
        } catch (Exception e) {
            logger.log("Init app database failure : " + e.toString());
            throw new RuntimeException("Init app database failure", e);
        }
    }

    private static String getDbType(DataSource datasource) {
        String type = ((DruidDataSource) datasource).getDbType();
        return type;
    }
}
