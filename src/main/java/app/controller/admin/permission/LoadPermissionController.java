package app.controller.admin.permission;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.Permission;
import gen.RolePermission;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Component
public class LoadPermissionController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);

        Permission one = new Permission();
        one.setId(id);

        Permission out = sql.templateOne(one);
        Assert.notNull(out, "数据不存在");
        ObjectNode data = QuickJson.newObject();
        data.putPOJO("id", out.getId());
        data.putPOJO("ico", out.getIco());
        data.putPOJO("name", out.getName());
        data.putPOJO("orderFlag", out.getOrderFlag());
        data.putPOJO("pid", out.getPid());
        data.putPOJO("type", out.getType());
        data.putPOJO("url", out.getUrl());
        data.putPOJO("useFlag", out.getUseFlag());
        data.putPOJO("createTime", DateTimeTool.toFullString(out.getCreateTime()));
        List<RolePermission> list = sql.query(RolePermission.class)
                .andEq("permission_id", out.getId())
                .select();
        ArrayNode arr = data.putArray("roleIds");
        for (RolePermission t : list) {
            arr.add(t.getRoleId());
        }
        return jsonResultSuccess("data", data);
    }
}
