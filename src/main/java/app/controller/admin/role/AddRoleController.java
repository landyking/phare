package app.controller.admin.role;

import app.common.DateTimeTool;
import app.common.Texts;
import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.Role;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Component
public class AddRoleController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String name = superParam.needParam("name", String.class);

        String id = Texts.uuidLong();
        Date createTime = DateTimeTool.now();

        Role one = new Role();
        one.setId(id);
        one.setName(name);
        one.setCreateTime(createTime);

        sql.insertTemplate(one);
        doLog(OperateLogType.addRole, String.format("id: %s, name: %s", id, name));
        return jsonResultSuccess();
    }
}

