package app.controller.admin;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.shiro.MyToken;
import app.common.shiro.MyUser;
import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.constant.ParamKey;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.Account;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by landy on 2018/9/25.
 */
@Component
public class LoginController extends AdminController {
    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String username = superParam.needParam("username", String.class);
        String password = superParam.needParam("password", String.class);
        MyToken token = new MyToken();
        token.setUserMode(MyUser.MODE_ADMIN);
        token.setUsername(username);
        token.setPassword(password.toCharArray());
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            ObjectNode rst = QuickJson.newObject();
            Session session = subject.getSession();
            rst.put("itoken", session.getId().toString());
            rst.put("fileUploadUrl", paramManager.getParam(ParamKey.UPLOAD_FILE_URL));
            rst.put("fileDownloadUrl", paramManager.getParam(ParamKey.DOWNLOAD_FILE_URL));

            //更新最后登录时间和ip
            Account update = new Account();
            update.setId(getAdminUser().getUserId());
            update.setLastLoginIp(getRequestSourceIp());
            update.setLastLoginTime(DateTimeTool.now());
            sql.updateTemplateById(update);

            //记录授权登陆信息
            doLog(OperateLogType.adminLogin, username + " 登录系统");
            return jsonResultSuccess("data", rst);
        } catch (UnknownAccountException e) {
            logWarn("账号" + username + "不存在");
            return jsonResultFailure("账号" + username + "不存在");
        } catch (IncorrectCredentialsException e) {
            logWarn("账号" + username + "密码不对");
            return jsonResultFailure("密码不对");
        } catch (Exception e) {
            logError("登录失败", e);
            return jsonResult(QuickJson.newObject().put("success", false).put("message", e.getMessage()));
        }
    }
}
