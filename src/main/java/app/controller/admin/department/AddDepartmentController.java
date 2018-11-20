package app.controller.admin.department;

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
public class AddDepartmentController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);
        long count = sql.lambdaQuery(Department.class).andEq(Department::getId, id).count();
        Assert.isTrue(count < 1, "单位编号已存在");
        String address = superParam.getParam("address", String.class);
        Long createTime = DateTimeTool.nowLong();
        String description = superParam.getParam("description", String.class);
        String latitude = superParam.getParam("latitude", String.class);
        String longitude = superParam.getParam("longitude", String.class);
        String name = superParam.needParam("name", String.class);
        String pid = superParam.needParam("pid", String.class);
        Long updateTime = DateTimeTool.nowLong();

        Department one = new Department();
        one.setAddress(address);
        one.setCreateTime(createTime);
        one.setDescription(description);
        one.setId(id);
        one.setLatitude(latitude);
        one.setLongitude(longitude);
        one.setName(name);
        one.setPid(pid);
        one.setUpdateTime(updateTime);

        sql.insertTemplate(one);
        return jsonResultSuccess();
    }
}

