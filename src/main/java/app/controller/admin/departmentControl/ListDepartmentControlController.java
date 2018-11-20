package app.controller.admin.departmentControl;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.Texts;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.*;
import gen.*;
import java.util.*;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.beetl.sql.core.engine.PageQuery;
import org.beetl.sql.core.engine.CustomPageQuery;

@Component
public class ListDepartmentControlController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        PageQuery<DepartmentControl> query = new CustomPageQuery<>(superParam);
        PageQuery<DepartmentControl> pageData = sql.pageQuery("departmentControlEx.listPageData", DepartmentControl.class, query);
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count",pageData.getTotalRow());
        ArrayNode data = rst.putArray("data");
        for (DepartmentControl one : pageData.getList()) {
            ObjectNode o = data.addObject();

            o.putPOJO("createTime",one.getCreateTime());
            o.putPOJO("depId",one.getDepId());
            o.putPOJO("id",one.getId());
            o.putPOJO("type",one.getType());
            o.putPOJO("userId",one.getUserId());
        }
        return jsonResult(rst);
    }
}

