package app.controller.admin.constantValue;

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

@Component
public class ListConstantValueController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        Integer page = superParam.getParam("page", Integer.class, 1);
        Integer limit = superParam.getParam("limit", Integer.class, 10);
        String constantId = superParam.getParam("constantId", String.class);
        PageQuery<ConstantValue> query = new PageQuery<>(page.longValue(), limit.longValue());
        query.setPara("constantId", constantId);
        PageQuery<ConstantValue> pageData = sql.pageQuery("constantValueEx.listPageData", ConstantValue.class, query);
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count", pageData.getTotalRow());
        ArrayNode data = rst.putArray("data");
        for (ConstantValue one : pageData.getList()) {
            ObjectNode o = data.addObject();

            o.putPOJO("id", one.getId());
            o.putPOJO("constantId", one.getConstantId());
            o.putPOJO("constantName", one.get("constantName"));
            o.putPOJO("name", one.getName());
            o.putPOJO("description", one.getDescription());
            o.putPOJO("createTime", DateTimeTool.toFullString(one.getCreateTime()));
        }
        return jsonResult(rst);
    }
}

