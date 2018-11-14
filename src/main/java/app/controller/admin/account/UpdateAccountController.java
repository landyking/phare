package app.controller.admin.account;

import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.Account;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

@Component
public class UpdateAccountController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);
        String description = superParam.needParam("description", String.class);
        Long enableFlag = superParam.needParam("enableFlag", Long.class);
        String username = superParam.needParam("username", String.class);

        Account one = new Account();
        one.setId(id);
        one.setDescription(description);
        one.setEnableFlag(enableFlag);
        one.setUsername(username);

        int i = sql.updateTemplateById(one);
        Assert.isTrue(i > 0, "无效更新");
        doLog(OperateLogType.updateAccount, String.format("id: %s, username: %s", id, username));
        return jsonResultSuccess();
    }
}
