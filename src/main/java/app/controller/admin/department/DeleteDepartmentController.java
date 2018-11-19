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
import org.springframework.web.servlet.ModelAndView;

@Component
public class DeleteDepartmentController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id=superParam.needParam("id",String.class);

        Department one=new Department();
        one.setId(id);

        sql.deleteObject(one);
        return jsonResultSuccess();
    }
}

