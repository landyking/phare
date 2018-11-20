package app.controller.admin.account;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.Account;
import gen.Department;
import gen.RoleUser;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Component
public class LoadAccountController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);

        Account one = new Account();
        one.setId(id);

        Account out = sql.templateOne(one);
        Assert.notNull(out, "数据不存在");
        Optional<Department> dep = Optional.ofNullable(sql.single(Department.class, out.getDepId()));
        ObjectNode data = QuickJson.newObject();
        data.putPOJO("id", out.getId());
        data.putPOJO("depId", out.getDepId());
        data.putPOJO("depName", dep.map(Department::getName).orElse(null));
        data.putPOJO("deleteFlag", out.getDeleteFlag());
        data.putPOJO("description", out.getDescription());
        data.putPOJO("enableFlag", out.getEnableFlag());
        data.putPOJO("lastLoginIp", out.getLastLoginIp());
//        data.putPOJO("password", out.getPassword());
        data.putPOJO("username", out.getUsername());
        data.putPOJO("lastLoginTime", DateTimeTool.toFullString(out.getLastLoginTime()));
        List<RoleUser> roleUserList = sql.query(RoleUser.class).andEq("user_id", out.getId())
                .select();
        ArrayNode roleIds = data.putArray("roleIds");
        for (RoleUser ru : roleUserList) {
            roleIds.add(ru.getRoleId());
        }
        return jsonResultSuccess("data", data);
    }
}
