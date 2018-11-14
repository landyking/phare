package app.controller.admin.dict;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.QuickMap;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.DictItem;
import org.beetl.sql.core.engine.PageQuery;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Component("adminListDictItemController")
public class ListDictItemController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        Integer page = superParam.getParam("page", Integer.class, 1);
        Integer limit = superParam.getParam("limit", Integer.class, 10);
        QuickMap<String> collect = QuickMap.strMap();
        superParam.getParam(collect, "id", String.class);
        superParam.getParam(collect, "code", String.class);
        superParam.getParam(collect, "content", String.class);

        PageQuery<DictItem> query = new PageQuery<>(page.longValue(), limit.longValue());
        fillQuery(query, collect);
        PageQuery<DictItem> pageData = sql.pageQuery("dictItemEx.listItemByDictId", DictItem.class, query);
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count", pageData.getTotalRow());
        ArrayNode data = rst.putArray("data");
        for (DictItem one : pageData.getList()) {
            ObjectNode o = data.addObject();

            o.putPOJO("id", one.getId());
            o.putPOJO("code", one.getCode());
            o.putPOJO("content", one.getContent());
            o.putPOJO("dictId", one.getDictId());
            o.putPOJO("createTime", one.getCreateTime());
            o.putPOJO("updateTime", DateTimeTool.toFullString(one.getUpdateTime()));
        }
        return jsonResult(rst);
    }
}
