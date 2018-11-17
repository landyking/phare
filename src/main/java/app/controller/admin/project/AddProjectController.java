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
public class AddProjectController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = Texts.uuidLong();
        String code = superParam.needParam("code", String.class);
        String name = superParam.needParam("name", String.class);
        String description = superParam.needParam("description", String.class);
        Date createTime = DateTimeTool.now();
        long exist = sql.lambdaQuery(Project.class).andEq(Project::getCode, code).count();
        Assert.isTrue(exist <= 0, "编码重复");
        Project one = new Project();
        one.setId(id);
        one.setCode(code);
        one.setName(name);
        one.setDescription(description);
        one.setCreateTime(createTime);

        sql.insertTemplate(one);
        return jsonResultSuccess();
    }
}

