package app.controller.admin.tableInfo;

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
public class UpdateTableInfoController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id=superParam.needParam("id",String.class);
        String code=superParam.needParam("code",String.class);
        String projectId=superParam.needParam("projectId",String.class);
        String name=superParam.needParam("name",String.class);
        String description=superParam.getParam("description",String.class);

        TableInfo one=new TableInfo();
        one.setId(id);
        one.setCode(code);
        one.setProjectId(projectId);
        one.setName(name);
        one.setDescription(description);

        int i=sql.updateTemplateById(one);
        Assert.isTrue(i > 0, "无效更新");
        return jsonResultSuccess();
    }
}

