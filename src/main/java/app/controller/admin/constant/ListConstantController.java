package app.controller.admin.constant;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.QuickMap;
import app.common.Texts;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.*;
import gen.*;

import java.util.*;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.beetl.sql.core.engine.PageQuery;

@Component
public class ListConstantController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        Integer page = superParam.getParam("page", Integer.class, 1);
        Integer limit = superParam.getParam("limit", Integer.class, 10);
        QuickMap<String> collect = QuickMap.strMap();
        superParam.getParam(collect, "id", String.class);
        superParam.getParam(collect, "name", String.class);
        PageQuery<Constant> query = new PageQuery<>(page.longValue(), limit.longValue());
        fillQuery(query, collect);
        PageQuery<Constant> pageData = sql.pageQuery("constantEx.listPageData", Constant.class, query);
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count", pageData.getTotalRow());
        ArrayNode data = rst.putArray("data");
        for (Constant one : pageData.getList()) {
            ObjectNode o = data.addObject();

            o.putPOJO("id", one.getId());
            o.putPOJO("projectId", one.getProjectId());
            o.putPOJO("projectName", one.get("projectName"));
            o.putPOJO("name", one.getName());
            o.putPOJO("description", one.getDescription());
            o.putPOJO("createTime", DateTimeTool.toFullString(one.getCreateTime()));
        }
        return jsonResult(rst);
    }
}

