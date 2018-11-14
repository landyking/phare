package app.controller.admin.tableColumn;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.QuickMap;
import app.common.Texts;
import app.common.web.SuperParam;
import app.constant.DictKey;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.*;
import gen.*;
import java.util.*;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.beetl.sql.core.engine.PageQuery;

@Component
public class ListTableColumnController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        Integer page = superParam.getParam("page", Integer.class, 1);
        Integer limit = superParam.getParam("limit", Integer.class, 10);
        QuickMap<String> collect = QuickMap.strMap();
        superParam.getParam(collect, "tableId", String.class);
        PageQuery<TableColumn> query = new PageQuery<>(page.longValue(), limit.longValue());
        fillQuery(query, collect);
        PageQuery<TableColumn> pageData = sql.pageQuery("tableColumnEx.listPageData", TableColumn.class, query);
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count",pageData.getTotalRow());
        ArrayNode data = rst.putArray("data");
        for (TableColumn one : pageData.getList()) {
            ObjectNode o = data.addObject();

            o.putPOJO("id",one.getId());
            o.putPOJO("code",one.getCode());
            o.putPOJO("tableId",one.getTableId());
            o.putPOJO("tableCode",one.get("tableCode"));
            o.putPOJO("name",one.getName());
            o.putPOJO("description",one.getDescription());
            o.putPOJO("nullableFlag",translator.translate(DictKey.yesOrNo,one.getNullableFlag()));
            o.putPOJO("pkFlag",translator.translate(DictKey.yesOrNo,one.getPkFlag()));
            o.putPOJO("fkId",one.getFkId());
            o.putPOJO("defVal",one.getDefVal());
            o.putPOJO("dataType",one.getDataType());
            o.putPOJO("dbType",one.getDbType());
            o.putPOJO("typeLength",one.getTypeLength());
            o.putPOJO("typePrecision",one.getTypePrecision());
            o.putPOJO("constantId",one.getConstantId());
            o.putPOJO("createTime",DateTimeTool.toFullString(one.getCreateTime()));
        }
        return jsonResult(rst);
    }
}

