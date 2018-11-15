package app.controller.admin.tableInfo;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.Texts;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.*;
import gen.*;

import java.util.*;

import org.beetl.sql.core.engine.CustomPageQuery;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.beetl.sql.core.engine.PageQuery;

@Component
public class ListTableInfoController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        PageQuery<TableInfo> query = new CustomPageQuery<>(superParam);
        PageQuery<TableInfo> pageData = sql.pageQuery("tableInfoEx.listPageData", TableInfo.class, query);
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count", pageData.getTotalRow());
        ArrayNode data = rst.putArray("data");
        for (TableInfo one : pageData.getList()) {
            ObjectNode o = data.addObject();

            o.putPOJO("id", one.getId());
            o.putPOJO("code", one.getCode());
            o.putPOJO("projectId", one.getProjectId());
            o.putPOJO("projectName", one.get("projectName"));
            o.putPOJO("name", one.getName());
            o.putPOJO("description", one.getDescription());
            o.putPOJO("columnCount", one.get("columnCount"));
            o.putPOJO("createTime", DateTimeTool.toFullString(one.getCreateTime()));
        }
        return jsonResult(rst);
    }
}

