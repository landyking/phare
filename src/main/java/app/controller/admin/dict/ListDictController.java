package app.controller.admin.dict;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.QuickMap;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.Dict;
import gen.DictItem;
import org.beetl.sql.core.engine.PageQuery;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Component
public class ListDictController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        Integer page = superParam.getParam("page", Integer.class, 1);
        Integer limit = superParam.getParam("limit", Integer.class, 10);
        QuickMap<String> collect = QuickMap.strMap();
        superParam.getParam(collect, "code", String.class);
        superParam.getParam(collect, "description", String.class);

        PageQuery<Dict> query = new PageQuery<>(page.longValue(), limit.longValue());
        fillQuery(query, collect);
        PageQuery<Dict> pageData = sql.pageQuery("dictEx.listDict", Dict.class, query);

        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count", pageData.getTotalRow());
        ArrayNode data = rst.putArray("data");
        for (Dict one : pageData.getList()) {
            ObjectNode o = data.addObject();

            o.putPOJO("id", one.getId());
            o.putPOJO("code", one.getCode());
            o.putPOJO("deleteFlag", one.getDeleteFlag());
            o.putPOJO("description", one.getDescription());
            o.putPOJO("createTime", DateTimeTool.toFullString(one.getCreateTime()));
            o.putPOJO("updateTime", DateTimeTool.toFullString(one.getUpdateTime()));
            long count = sql.query(DictItem.class).andEq("dict_id", one.getId()).count();
            o.putPOJO("itemCount",count);
        }
        return jsonResult(rst);
    }
}
