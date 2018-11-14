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
import org.springframework.web.servlet.ModelAndView;

@Component
public class AddTableInfoController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String code=superParam.needParam("code",String.class);
        String projectId=superParam.needParam("projectId",String.class);
        String name=superParam.needParam("name",String.class);
        String description=superParam.getParam("description",String.class);
        Date createTime = DateTimeTool.now();

        TableInfo one=new TableInfo();
        one.setId(Texts.uuidLong());
        one.setCode(code);
        one.setProjectId(projectId);
        one.setName(name);
        one.setDescription(description);
        one.setCreateTime(createTime);

        sql.insertTemplate(one);
        return jsonResultSuccess();
    }
}

