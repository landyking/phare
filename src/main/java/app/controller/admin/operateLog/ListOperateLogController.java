package app.controller.admin.operateLog;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.QuickMap;
import app.common.web.SuperParam;
import app.constant.DictKey;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.OperateLog;
import org.beetl.sql.core.engine.PageQuery;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Component
public class ListOperateLogController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        Integer page = superParam.getParam("page", Integer.class, 1);
        Integer limit = superParam.getParam("limit", Integer.class, 10);
        QuickMap<String> collect = QuickMap.strMap();
        superParam.getParam(collect, "type", Integer.class);
        superParam.getParam(collect, "description", Integer.class);
        superParam.getParam(collect, "name", Integer.class);
        superParam.getParam(collect, "dateMin", Date.class);
        superParam.getParam(collect, "dateMax", Date.class);
        PageQuery<OperateLog> query = new PageQuery<>(page.longValue(), limit.longValue());
        fillQuery(query, collect);
        PageQuery<OperateLog> pageData = sql.pageQuery("operateLogEx.listOperateLog", OperateLog.class, query);
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count", pageData.getTotalRow());
        ArrayNode data = rst.putArray("data");
        for (OperateLog one : pageData.getList()) {
            ObjectNode o = data.addObject();

            o.putPOJO("id", one.getId());
            o.putPOJO("description", one.getDescription());
            o.putPOJO("type", translator.translate(DictKey.operateLogType, one.getType()));
            o.putPOJO("username", one.get("username"));
            o.putPOJO("createTime", DateTimeTool.toFullString(one.getCreateTime()));
        }
        return jsonResult(rst);
    }
}
