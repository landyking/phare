package app.controller.admin.account;

import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.Account;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Component
public class DeleteAccountController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);

        Account one = new Account();
        one.setId(id);
        one.setDeleteFlag(1l);

        sql.updateTemplateById(one);
        doLog(OperateLogType.deleteAccount, "删除用户: " + id);
        return jsonResultSuccess();
    }
}