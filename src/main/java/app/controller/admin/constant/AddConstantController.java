package app.controller.admin.constant;

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
public class AddConstantController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id=superParam.needParam("id",String.class);
        String projectId=superParam.needParam("projectId",String.class);
        String name=superParam.needParam("name",String.class);
        String description=superParam.needParam("description",String.class);
        Date createTime = DateTimeTool.now();

        Constant one=new Constant();
        one.setId(id);
        one.setProjectId(projectId);
        one.setName(name);
        one.setDescription(description);
        one.setCreateTime(createTime);

        sql.insertTemplate(one);
        return jsonResultSuccess();
    }
}

