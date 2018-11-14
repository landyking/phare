package app.controller.admin.permission;

import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.Permission;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

@Component
public class UpdatePermissionController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);
        String ico = superParam.getParam("ico", String.class);
        String name = superParam.needParam("name", String.class);
        Long orderFlag = superParam.needParam("orderFlag", Long.class);
        String pid = superParam.needParam("pid", String.class);
        Integer type = superParam.needParam("type", Integer.class);
        String url = superParam.getParam("url", String.class);
        Integer useFlag = superParam.needParam("useFlag", Integer.class);

        Permission one = new Permission();
        one.setId(id);
        one.setIco(ico);
        one.setName(name);
        one.setOrderFlag(orderFlag);
        one.setPid(pid);
        one.setType(type);
        one.setUrl(url);
        one.setUseFlag(useFlag);

        int i = sql.updateTemplateById(one);
        Assert.isTrue(i > 0, "无效更新");
        doLog(OperateLogType.updatePermission, String.format("id: %s, name: %s, url: %s", id, name, url));
        return jsonResultSuccess();
    }
}