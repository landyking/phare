package app.controller.admin.project;

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
public class LoadProjectController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id=superParam.needParam("id",String.class);

        Project one=new Project();
        one.setId(id);

        Project out = sql.templateOne(one);
        Assert.notNull(out, "数据不存在");
        ObjectNode data = QuickJson.newObject();
        data.putPOJO("id",out.getId());
        data.putPOJO("code",out.getCode());
        data.putPOJO("name",out.getName());
        data.putPOJO("description",out.getDescription());
        data.putPOJO("createTime",DateTimeTool.toFullString(out.getCreateTime()));
        return jsonResultSuccess("data",data);
    }
}

