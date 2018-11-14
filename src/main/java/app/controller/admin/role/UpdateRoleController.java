package app.controller.admin.role;

import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.Role;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Component
public class UpdateRoleController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);
        String name = superParam.needParam("name", String.class);
        Date createTime = superParam.needParam("createTime", Date.class);

        Role one = new Role();
        one.setId(id);
        one.setName(name);
        one.setCreateTime(createTime);

        int i = sql.updateTemplateById(one);
        Assert.isTrue(i > 0, "无效更新");
        doLog(OperateLogType.updateRole, String.format("id: %s, name: %s", id, name));
        return jsonResultSuccess();
    }
}
