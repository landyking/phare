package app.controller.admin.account;

import app.common.ObjectDiff;
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
        Account old = sql.single(Account.class, id);
        Assert.notNull(old, "账户不存在");
        String description = superParam.getParam("description", String.class);
        String depId = superParam.needParam("depId", String.class);
        Long enableFlag = superParam.needParam("enableFlag", Long.class);
        String username = superParam.needParam("username", String.class);

        Account one = new Account();
        one.setId(id);
        one.setDescription(description);
        one.setEnableFlag(enableFlag);
        one.setUsername(username);
        one.setDepId(depId);

        int i = sql.updateTemplateById(one);
        Assert.isTrue(i > 0, "无效更新");
        doLog(OperateLogType.updateAccount, "更新后台账户: " + id + "#" + ObjectDiff.calcToJson(old, one, "id", "description", "depId", "enableFlag", "username"));
        return jsonResultSuccess();
    }
}
