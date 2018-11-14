package app.controller.admin.role;

import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.Role;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Component
public class DeleteRoleController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);

        Role one = new Role();
        one.setId(id);

        sql.deleteObject(one);
        doLog(OperateLogType.deleteRole, String.format("id: %s", id));
        return jsonResultSuccess();
    }
}