package app.controller.admin.project;

import app.common.QuickJson;
import app.common.Texts;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.JsonNode;
import com.google.common.base.Throwables;
import com.google.common.collect.Lists;
import gen.Project;
import gen.TableColumn;
import gen.TableInfo;
import org.springframework.stereotype.Component;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
import java.util.StringJoiner;
import java.util.stream.Collectors;

@Component
public class ImportProjectController extends AdminController {
    @Resource
    private TransactionTemplate transactionTemplate;

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String json = superParam.needParam("json", String.class);
        JsonNode root = QuickJson.JSON.readTree(json);
        Project project = QuickJson.JSON.readValue(root.traverse(), Project.class);
        if (!Texts.hasText(project.getId())) {
            project.setId(Texts.uuidLong());
        }
        List<TableInfo> tables = Lists.newLinkedList();
        List<TableColumn> columns = Lists.newLinkedList();
        root.get("tables").forEach(n -> {
            try {
                TableInfo tableInfo = QuickJson.JSON.readValue(n.traverse(), TableInfo.class);
                if (!Texts.hasText(tableInfo.getId())) {
                    tableInfo.setId(Texts.uuidLong());
                }
                tableInfo.setProjectId(project.getId());
                tables.add(tableInfo);
                columns.addAll(extraTableColumns(n, tableInfo));
            } catch (IOException e) {
                Throwables.propagate(e);
            }
        });
        transactionTemplate.execute(new TransactionCallbackWithoutResult() {
            @Override
            protected void doInTransactionWithoutResult(TransactionStatus transactionStatus) {
                sql.insert(project);
                logInfo("import project: {}:{}", project.getCode(), project.getName());
                sql.insertBatch(TableInfo.class, tables);
                logInfo("import table count: {}, names: {}", tables.size(), tables.stream().map(TableInfo::getCode).collect(Collectors.joining(",")));
                sql.insertBatch(TableColumn.class, columns);
                logInfo("import table column count: {}",columns.size());
            }
        });
        return jsonResultSuccess();
    }

    private List<TableColumn> extraTableColumns(JsonNode n, final TableInfo tableInfo) {
        List<TableColumn> tmpCols = Lists.newLinkedList();
        n.get("columns").forEach(c -> {
            try {
                TableColumn tableColumn = QuickJson.JSON.readValue(c.traverse(), TableColumn.class);
                if (!Texts.hasText(tableColumn.getId())) {
                    tableColumn.setId(Texts.uuidLong());
                }
                tableColumn.setTableId(tableInfo.getId());
                tmpCols.add(tableColumn);
            } catch (IOException e) {
                Throwables.propagate(e);
            }
        });
        return tmpCols;
    }
}

