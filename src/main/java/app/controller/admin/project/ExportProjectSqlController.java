package app.controller.admin.project;

import app.common.Tuple;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import app.service.sqlGen.SqlGenService;
import gen.TableColumn;
import gen.TableInfo;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.LinkedList;
import java.util.List;

@Component
public class ExportProjectSqlController extends AdminController {
    @Resource
    private SqlGenService sqlGenService;

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);
        String sql = sqlGenService.gen(extraTables(id));
        HttpServletResponse response = superParam.getResponse();
        response.setCharacterEncoding("utf8");
        response.setHeader("content-type","text/sql;charset=UTF-8");
        response.getWriter().print(sql);
        return null;
    }

    private List<Tuple<TableInfo, List<TableColumn>>> extraTables(String id) {
        List<Tuple<TableInfo, List<TableColumn>>> rst = new LinkedList<>();
        List<TableInfo> tables = sql.lambdaQuery(TableInfo.class).andEq(TableInfo::getProjectId, id).orderBy(TableInfo::getCode).select();
        tables.forEach(t -> {
            List<TableColumn> cols = sql.lambdaQuery(TableColumn.class).andEq(TableColumn::getTableId, t.getId()).orderBy(TableColumn::getCode).select();
            rst.add(Tuple.newOne(t, cols));
        });
        return rst;
    }
}

