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
public class LoadDepartmentController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id=superParam.needParam("id",String.class);

        Department one=new Department();
        one.setId(id);

        Department out = sql.templateOne(one);
        Assert.notNull(out, "数据不存在");
        ObjectNode data = QuickJson.newObject();
        data.putPOJO("address",out.getAddress());
        data.putPOJO("createTime",out.getCreateTime());
        data.putPOJO("description",out.getDescription());
        data.putPOJO("id",out.getId());
        data.putPOJO("latitude",out.getLatitude());
        data.putPOJO("longitude",out.getLongitude());
        data.putPOJO("name",out.getName());
        data.putPOJO("pid",out.getPid());
        data.putPOJO("updateTime",out.getUpdateTime());
        return jsonResultSuccess("data",data);
    }
}

