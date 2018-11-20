package app.controller.admin.department;

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
public class ListDepartmentController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        PageQuery<Department> query = new CustomPageQuery<>(superParam);
        query.setPara("pid", superParam.needParam("pid", String.class));
        query.setPara("name", superParam.getParam("name", String.class));
        PageQuery<Department> pageData = sql.pageQuery("departmentEx.listPageData", Department.class, query);
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count", pageData.getTotalRow());
        ArrayNode data = rst.putArray("data");
        for (Department one : pageData.getList()) {
            ObjectNode o = data.addObject();

            o.putPOJO("address", one.getAddress());
            o.putPOJO("createTime", DateTimeTool.toFullString(one.getCreateTime()));
            o.putPOJO("description", one.getDescription());
            o.putPOJO("id", one.getId());
            o.putPOJO("latitude", one.getLatitude());
            o.putPOJO("longitude", one.getLongitude());
            o.putPOJO("name", one.getName());
            o.putPOJO("pid", one.getPid());
            o.putPOJO("pname", one.get("pname"));
            o.putPOJO("updateTime", DateTimeTool.toFullString(one.getUpdateTime()));
        }
        return jsonResult(rst);
    }
}

