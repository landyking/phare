package app.controller.admin.role;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.Role;
import gen.RolePermission;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Component
public class ListRoleController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        Integer page = superParam.getParam("page", Integer.class, 1);
        Integer limit = superParam.getParam("limit", Integer.class, 10);
        long total = sql.query(Role.class).count();
        List<Role> list = sql.query(Role.class)
                .limit(calcStartRow(page, limit), limit).select();
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count", total);
        ArrayNode data = rst.putArray("data");
        for (Role one : list) {
            ObjectNode o = data.addObject();

            o.putPOJO("id", one.getId());
            o.putPOJO("name", one.getName());
            o.putPOJO("createTime", DateTimeTool.toFullString(one.getCreateTime()));
            long permissionCount = sql.query(RolePermission.class)
                    .andEq("role_id", one.getId())
                    .count();
            o.put("permissionCount", permissionCount);
        }
        return jsonResult(rst);
    }
}