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
public class UpdateDepartmentControlController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        Long createTime=superParam.needParam("createTime",Long.class);
        String depId=superParam.needParam("depId",String.class);
        String id=superParam.needParam("id",String.class);
        Integer type=superParam.needParam("type",Integer.class);
        String userId=superParam.needParam("userId",String.class);

        DepartmentControl one=new DepartmentControl();
        one.setCreateTime(createTime);
        one.setDepId(depId);
        one.setId(id);
        one.setType(type);
        one.setUserId(userId);

        int i=sql.updateTemplateById(one);
        Assert.isTrue(i > 0, "无效更新");
        return jsonResultSuccess();
    }
}

