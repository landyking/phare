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
import org.springframework.web.servlet.ModelAndView;

@Component
public class AddDepartmentControlController extends AdminController {

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

        sql.insertTemplate(one);
        return jsonResultSuccess();
    }
}

