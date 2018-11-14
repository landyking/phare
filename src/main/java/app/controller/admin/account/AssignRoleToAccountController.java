package app.controller.admin.account;

import app.common.DateTimeTool;
import app.common.Texts;
import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.RoleUser;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author: landy
 * @date: 2018-09-29 00:02
 */
@Component
public class AssignRoleToAccountController extends AdminController {
    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String userId = superParam.needParam("id", String.class);
        String roleIds = superParam.getParam("roleIds", String.class);
        sql.query(RoleUser.class)
                .andEq("user_id",userId)
                .delete();
        List<String> list = Texts.splitToList(roleIds);
        if (!CollectionUtils.isEmpty(list)) {
            for (String one : list) {
                RoleUser t = new RoleUser();
                t.setId(Texts.uuidLong());
                t.setRoleId(one);
                t.setUserId(userId);
                t.setCreateTime(DateTimeTool.now());
                sql.insertTemplate(t);
                doLog(OperateLogType.assignRoleToAccount, String.format("role: %s, account: %s", one, userId));
            }
        }
        return jsonResultSuccess();
    }
}
