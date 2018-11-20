package app.controller.admin.account;

import app.common.DateTimeTool;
import app.common.Texts;
import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.RolePermission;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author: landy
 * @date: 2018-09-29 00:02
 */
@Component
public class GrantPermissionListToRoleController extends AdminController {
    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String ids = superParam.getParam("ids", String.class);
        String roleId = superParam.needParam("roleId", String.class);
        sql.lambdaQuery(RolePermission.class)
                .andEq(RolePermission::getRoleId, roleId)
                .delete();
        List<String> list = Texts.splitToList(ids);
        if (!CollectionUtils.isEmpty(list)) {
            for (String one : list) {
                RolePermission t = new RolePermission();
                t.setId(Texts.uuidLong());
                t.setRoleId(roleId);
                t.setPermissionId(one);
                t.setCreateTime(DateTimeTool.now());
                sql.insertTemplate(t);
            }
        }
        doLog(OperateLogType.grantPermissionToRole, String.format("permission: %s, role: %s", ids, roleId));
        return jsonResultSuccess();
    }
}
