package app.controller.admin.tableColumn;

import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import gen.TableColumn;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

@Component
public class UpdateTableColumnController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);
//        String tableId = superParam.needParam("tableId", String.class);
        String name = superParam.needParam("name", String.class);
        String description = superParam.getParam("description", String.class);
        Integer nullableFlag = superParam.needParam("nullableFlag", Integer.class);
        Integer pkFlag = superParam.needParam("pkFlag", Integer.class);
        String fkId = superParam.getParam("fkId", String.class);
        String defVal = superParam.getParam("defVal", String.class);
        String dataType = superParam.getParam("dataType", String.class);
        String dbType = superParam.needParam("dbType", String.class);
        Integer typeLength = superParam.needParam("typeLength", Integer.class);
        Integer typePrecision = superParam.needParam("typePrecision", Integer.class);
        String constantId = superParam.getParam("constantId", String.class);

        TableColumn one = new TableColumn();
        one.setId(id);
//        one.setTableId(tableId);
        one.setName(name);
        one.setDescription(description);
        one.setNullableFlag(nullableFlag);
        one.setPkFlag(pkFlag);
        one.setFkId(fkId);
        one.setDefVal(defVal);
        one.setDataType(dataType);
        one.setDbType(dbType);
        one.setTypeLength(typeLength);
        one.setTypePrecision(typePrecision);
        one.setConstantId(constantId);

        int i = sql.updateTemplateById(one);
        Assert.isTrue(i > 0, "无效更新");
        return jsonResultSuccess();
    }
}

