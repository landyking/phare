package app.controller.admin.department;

import app.common.*;
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
public class UpdateDepartmentController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);
        Department old = sql.single(Department.class, id);
        Assert.notNull(old, "单位编号不存在");
        String name = superParam.needParam("name", String.class);
        String address = superParam.getParam("address", String.class);
        String description = superParam.getParam("description", String.class);
        Long updateTime = DateTimeTool.nowLong();

        Department one = new Department();
        one.setAddress(address);
        one.setDescription(description);
        one.setId(id);
        one.setName(name);
        one.setUpdateTime(updateTime);
        int i = sql.updateTemplateById(one);
        Assert.isTrue(i > 0, "无效更新");
        doLog(OperateLogType.updateDepartment, "更新单位信息: " + id + "#" + ObjectDiff.calcToJson(old, one, "id", "name", "address", "description"));
        return jsonResultSuccess();
    }
}

