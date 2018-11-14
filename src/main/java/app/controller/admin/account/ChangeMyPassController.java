package app.controller.admin.account;

import app.common.PasswordGen;
import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.Account;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by landy on 2018/9/29.
 */
@Component
public class ChangeMyPassController extends AdminController {
    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String userId = getAdminUser().getUserId();
        String oldPass = superParam.needParam("oldPass", String.class);
        String newPass = superParam.needParam("newPass", String.class);
        Account v = new Account();
        v.setPassword(PasswordGen.genPass(newPass));
        int i = sql.query(Account.class)
                .andEq("password", PasswordGen.genPass(oldPass))
                .andEq("id", userId)
                .updateSelective(v);
        if (i < 1) {
            return jsonResultFailure("旧密码不正确");
        }
        doLog(OperateLogType.changeSelfPass, null);
        return jsonResultSuccess();
    }
}
