package app.controller.admin.department;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.Texts;
import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.*;

import java.util.*;

import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

@Component
public class DeleteDepartmentController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);
        long sons = sql.lambdaQuery(Department.class).andEq(Department::getPid, id).count();
        Assert.isTrue(sons < 1, "包含下级单位，不能删除");
        Department one = sql.single(Department.class, id);
        if (one != null) {
            sql.deleteById(Department.class, id);
            doLog(OperateLogType.deleteDepartment, QuickJson.toJsonString(one));
        }
        return jsonResultSuccess();
    }
}

