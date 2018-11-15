package app.service.sqlGen;

import app.common.Texts;
import app.common.Tuple;
import com.google.common.collect.LinkedHashMultimap;
import com.google.common.collect.Sets;
import gen.TableColumn;
import gen.TableInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

/**
 * Created by landy on 2018/11/15.
 */
@Service
public class SqlGenService {
    private Logger log = LoggerFactory.getLogger(getClass());
    private SqlGen sqlGen = new OracleSqlGen();

    public String gen(List<Tuple<TableInfo, List<TableColumn>>> tables) throws Exception {

        log.info("检测到" + tables.size() + "张表");
        log.info("#######################");
        for (Tuple<TableInfo, List<TableColumn>> tb : tables) {
            log.info(tb.getFirst().getCode() + " : " + tb.getFirst().getName());
        }
        log.info("#######################");
        log.info("开始生成" + sqlGen.databaseName() + "建表语句");
        StringBuilder sb = new StringBuilder();
        for (Tuple<TableInfo, List<TableColumn>> one : tables) {
            TableInfo tb = one.getFirst();
            String tableName = tb.getCode();
            String tableDesc = tb.getName();
            sb.append("\r\n");
            sqlGen.genDropTableSql(sb, tableName);
            sb.append("create table ");
            sb.append(tableName);
            sb.append(" (\r\n");
            List<TableColumn> columns = one.getSecond();
            int flag = 0;
            Set<String> primaryKeyNames = Sets.newHashSet();
            LinkedHashMultimap<String, String> uniqueCols = LinkedHashMultimap.create();
            for (TableColumn col : columns) {
                flag++;
                sb.append("    ");
                String colName = col.getCode();
                String dbType = col.getDbType();
                String colType = col.getDataType();
                Integer colLen = col.getTypeLength();
                String colDesc = col.getName();
                String colDictCode = col.getConstantId();
                String colForeignKey = col.getFkId();
                String uniqueName = "";
                Integer decimalLen = col.getTypePrecision();
                String defaultValue = col.getDefVal();
                boolean colNullable = col.getNullableFlag() == 1;
                boolean colPrimaryKey = col.getPkFlag() == 1;
                sb.append(colName);
                sb.append(" " + sqlGen.getColumnType(dbType, colType, colLen, decimalLen));
                if (Texts.hasText(defaultValue)) {
                    sb.append(" default " + sqlGen.genDefaultValue(defaultValue));
                }
                sb.append(" " + (colNullable ? "NULL" : "NOT NULL"));
                if (colPrimaryKey) {
                    primaryKeyNames.add(colName);
                }
                if (Texts.hasText(uniqueName)) {
                    uniqueCols.put(uniqueName, colName);
                }
                sb.append(sqlGen.genColumnCommentWhenCreate(tableName, colName, colDesc, colDictCode, colForeignKey));
                if (flag < columns.size()) {
                    sb.append(",");
                }
                sb.append("\r\n");
            }
            sb.append(");\r\n");
            sqlGen.genPrimaryKeySql(sb, tableName, primaryKeyNames);
            sqlGen.genUniqueKeySql(sb, tableName, uniqueCols);
            sqlGen.genTableComment(sb, tableName, tableDesc);
            for (TableColumn col : columns) {
                String colName = col.getCode();
                String colDesc = col.getName();
                String colDictCode = col.getConstantId();
                String colForeignKey = col.getFkId();
                sqlGen.genColumnCommentAfterCreate(sb, tableName, colName, colDesc, colDictCode, colForeignKey);
            }
        }
        log.info("生成结束!!!");
        return sb.toString();
    }
}
