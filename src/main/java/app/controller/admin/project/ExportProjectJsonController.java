package app.controller.admin.project;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.Project;
import gen.TableColumn;
import gen.TableInfo;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

import java.util.function.Consumer;

@Component
public class ExportProjectJsonController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);

        Project out = sql.single(Project.class, id);
        ObjectNode exp = QuickJson.newObject();
        QuickJson.fillFromPojo(exp, out);
        extraTables(id, exp);
        return jsonResult(exp);
    }

    private void extraTables(String id, ObjectNode exp) {
        ArrayNode tables = exp.putArray("tables");
        sql.query(TableInfo.class).andEq("project_id",id).select().forEach(new Consumer<TableInfo>() {
            @Override
            public void accept(TableInfo t) {
                ObjectNode o = tables.addObject();
                QuickJson.fillFromPojo(o, t);
                extraTableColumns(t, o);
            }
        });
    }

    private void extraTableColumns(TableInfo t, ObjectNode o) {
        ArrayNode columns = o.putArray("columns");
        sql.query(TableColumn.class).andEq("table_id",t.getId()).select().forEach(new Consumer<TableColumn>() {
            @Override
            public void accept(TableColumn c) {
                ObjectNode objectNode = columns.addObject();
                QuickJson.fillFromPojo(objectNode, c);
            }
        });
    }
}

