package app.service.sqlGen;

import app.common.Texts;
import com.google.common.collect.LinkedHashMultimap;
import org.springframework.util.Assert;

import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * Created by landy on 2017/12/7.
 */
public class OracleSqlGen extends SqlGen {


    @Override
    protected void genUniqueKeySql(StringBuilder sb, String tableName, LinkedHashMultimap<String, String> uniqueCols) throws InterruptedException {
        for (String key : uniqueCols.keySet()) {
            Set<String> cols = uniqueCols.get(key);
            String label = "unique_" + key + "_" + Long.toHexString(System.currentTimeMillis());
            sb.append("alter table " + tableName + " add constraint " + label + " unique(" + Texts.joinCollection(cols) + ");\r\n");
            TimeUnit.MILLISECONDS.sleep(10);
        }

    }

    @Override
    protected String genColumnCommentWhenCreate(String tableName, String colName, String colDesc, String colDictCode, String colForeignKey) {
        return "";
    }

    @Override
    protected void genPrimaryKeySql(StringBuilder sb, String tableName, Set<String> primaryKeyNames) {
        String label = "pk_" + tableName + "_" + Long.toHexString(System.currentTimeMillis());
        String columns = Texts.joinCollection(primaryKeyNames);
        sb.append("alter table " + tableName + " add constraint " + label + " primary key (" + columns + ");\r\n");
    }

    @Override
    protected void genTableComment(StringBuilder sb, String tableName, String tableDesc) {
        sb.append("comment on table " + tableName + " is '" + tableDesc + "';\r\n");
    }

    @Override
    protected void genColumnCommentAfterCreate(StringBuilder sb, String tableName, String colName, String colDesc, String colDictCode, String colForeignKey) {
        StringBuilder comment = new StringBuilder("'");
        comment.append(colDesc);
        if (Texts.hasLength(colDictCode)) {
            comment.append("#对应字典" + colDictCode);
        }
        if (Texts.hasLength(colForeignKey)) {
            comment.append("#关联字段" + colForeignKey);
        }
        comment.append("'");
        sb.append("comment on column " + tableName + "." + colName + " is " + comment + ";\r\n");
    }

    @Override
    protected String getColumnType(String dbType, String colType, Integer colLen, Integer decimalLen) {
       /* if (Texts.hasText(dbType)) {
            return dbType;
        }*/
        if (Texts.hasText(dbType)) {
            return dbType+"("+colLen+")";
        }
        Assert.notNull(colType);
        if (colType.equalsIgnoreCase("long")) {
            return "NUMBER(20,0)";
        }
        if (colType.equalsIgnoreCase("text")) {
            Assert.notNull(colLen);
            return "NVARCHAR2(" + colLen + ")";
        }
        if (colType.equalsIgnoreCase("int")) {
            return "NUMBER(10,0)";
        }
        if (colType.equalsIgnoreCase("longtext")) {
            return "CLOB";
        }
        if (colType.equalsIgnoreCase("float")) {
            Assert.notNull(colLen);
            Assert.notNull(decimalLen);
            return "NUMBER(" + colLen + "," + decimalLen + ")";
        }
        throw new IllegalArgumentException("未知的列类型:" + colType);
    }

    @Override
    protected void genDropTableSql(StringBuilder sb, String tableName) {
        sb.append("drop table " + tableName + ";\r\n");
    }

    @Override
    protected String databaseName() {
        return "Oracle";
    }
}