package app.controller.admin.departmentControl;

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
public class LoadDepartmentControlController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id=superParam.needParam("id",String.class);

        DepartmentControl one=new DepartmentControl();
        one.setId(id);

        DepartmentControl out = sql.templateOne(one);
        Assert.notNull(out, "数据不存在");
        ObjectNode data = QuickJson.newObject();
        data.putPOJO("createTime",out.getCreateTime());
        data.putPOJO("depId",out.getDepId());
        data.putPOJO("id",out.getId());
        data.putPOJO("type",out.getType());
        data.putPOJO("userId",out.getUserId());
        return jsonResultSuccess("data",data);
    }
}

