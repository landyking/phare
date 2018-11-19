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
public class UpdateDepartmentController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String address=superParam.needParam("address",String.class);
        Long createTime=superParam.needParam("createTime",Long.class);
        String description=superParam.needParam("description",String.class);
        String id=superParam.needParam("id",String.class);
        String latitude=superParam.needParam("latitude",String.class);
        String longitude=superParam.needParam("longitude",String.class);
        String name=superParam.needParam("name",String.class);
        String pid=superParam.needParam("pid",String.class);
        Long updateTime=superParam.needParam("updateTime",Long.class);

        Department one=new Department();
        one.setAddress(address);
        one.setCreateTime(createTime);
        one.setDescription(description);
        one.setId(id);
        one.setLatitude(latitude);
        one.setLongitude(longitude);
        one.setName(name);
        one.setPid(pid);
        one.setUpdateTime(updateTime);

        int i=sql.updateTemplateById(one);
        Assert.isTrue(i > 0, "无效更新");
        return jsonResultSuccess();
    }
}

