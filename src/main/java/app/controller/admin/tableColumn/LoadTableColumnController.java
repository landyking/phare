package app.controller.admin.tableColumn;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.Texts;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.*;

import java.util.*;

import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

@Component
public class LoadTableColumnController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);

        TableColumn one = new TableColumn();
        one.setId(id);

        TableColumn out = sql.templateOne(one);
        Assert.notNull(out, "数据不存在");
        ObjectNode data = QuickJson.newObject();
        data.putPOJO("id", out.getId());
        data.putPOJO("code", out.getCode());
        data.putPOJO("tableId", out.getTableId());
        data.putPOJO("tableCode", Optional.ofNullable(sql.single(TableInfo.class, out.getTableId())).map(TableInfo::getCode).orElse(""));
        data.putPOJO("name", out.getName());
        data.putPOJO("description", out.getDescription());
        data.putPOJO("nullableFlag", out.getNullableFlag());
        data.putPOJO("pkFlag", out.getPkFlag());
        data.putPOJO("fkId", out.getFkId());
        data.putPOJO("defVal", out.getDefVal());
        data.putPOJO("dataType", out.getDataType());
        data.putPOJO("dbType", out.getDbType());
        data.putPOJO("typeLength", out.getTypeLength());
        data.putPOJO("typePrecision", out.getTypePrecision());
        data.putPOJO("constantId", out.getConstantId());
        data.putPOJO("createTime", DateTimeTool.toFullString(out.getCreateTime()));
        return jsonResultSuccess("data", data);
    }
}

