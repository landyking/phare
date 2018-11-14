package app.controller.admin.account;

import app.common.PasswordGen;
import app.common.Texts;
import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.Account;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

@Component
public class AddAccountController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String username = superParam.needParam("username", String.class);
        Long enableFlag = superParam.needParam("enableFlag", Long.class);
        String password = superParam.needParam("password", String.class);
        String description = superParam.needParam("description", String.class);

        String id = Texts.uuidLong();
        Long deleteFlag = 0l;
        Account one = new Account();
        one.setId(id);
        one.setDeleteFlag(deleteFlag);
        one.setDescription(description);
        one.setEnableFlag(enableFlag);
        one.setPassword(PasswordGen.genPass(password));
        one.setUsername(username);

        long exist = sql.query(Account.class).andEq("username", username)
                .andEq("delete_flag", 0)
                .count();
        Assert.isTrue(exist < 1, "用户名" + username + "已存在");
        int i = sql.insertTemplate(one);
        Assert.isTrue(i > 0, "新增数据失败");
        doLog(OperateLogType.addAccount, "增加用户: " + username + ":" + id);
        return jsonResultSuccess();
    }
}
