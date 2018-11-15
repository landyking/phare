package app.service.sqlGen;

import com.google.common.collect.LinkedHashMultimap;

import java.util.Set;

/**
 * Created by landy on 2018/6/6.
 */
public abstract class SqlGen {

    protected String genDefaultValue(String defaultValue) {
        if (defaultValue.indexOf('(') > -1) {
            return defaultValue;
        } else {
            return "'" + defaultValue + "'";
        }
    }

    protected abstract void genUniqueKeySql(StringBuilder sb, String tableName, LinkedHashMultimap<String, String> uniqueCols) throws InterruptedException;

    protected abstract String genColumnCommentWhenCreate(String tableName, String colName, String colDesc, String colDictCode, String colForeignKey);

    protected abstract void genPrimaryKeySql(StringBuilder sb, String tableName, Set<String> primaryKeyNames);

    protected abstract void genTableComment(StringBuilder sb, String tableName, String tableDesc);

    protected abstract void genColumnCommentAfterCreate(StringBuilder sb, String tableName, String colName, String colDesc, String colDictCode, String colForeignKey);


    protected abstract String getColumnType(String dbType, String colType, Integer colLen, Integer decimalLen);

    protected abstract void genDropTableSql(StringBuilder sb, String tableName);

    protected abstract String databaseName();
}