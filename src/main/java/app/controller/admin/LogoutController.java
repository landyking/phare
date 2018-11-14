package app.controller.admin;

import app.common.shiro.MyUser;
import app.common.web.SuperParam;
import app.constant.OperateLogType;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by landy on 2018/9/25.
 */
@Component
public class LogoutController extends AdminController {
    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        Subject subject = SecurityUtils.getSubject();
        MyUser user = getAdminUser();
        if (subject != null && subject.isAuthenticated()) {
            doLog(OperateLogType.adminLogout, String.format("id: %s", user.getUserId()));
            subject.logout();
        }
        return jsonResultSuccess();
    }
}
