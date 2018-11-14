package app.controller.admin.account;

import app.common.PasswordGen;
import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.Account;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

@Component
public class ChangePasswordController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);
        String password = superParam.needParam("password", String.class);

        Account one = new Account();
        one.setId(id);
        one.setPassword(PasswordGen.genPass(password));

        int i = sql.updateTemplateById(one);
        Assert.isTrue(i > 0, "无效更新");
        doLog(OperateLogType.changeAccountPass, String.format("id: %s", id));
        return jsonResultSuccess();
    }
}
