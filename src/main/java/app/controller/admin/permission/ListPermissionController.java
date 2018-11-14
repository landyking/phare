package app.controller.admin.permission;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.web.SuperParam;
import app.constant.DictKey;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.Permission;
import org.beetl.sql.core.engine.PageQuery;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Component
public class ListPermissionController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        Integer page = superParam.getParam("page", Integer.class, 1);
        Integer limit = superParam.getParam("limit", Integer.class, 10);
        String id = superParam.getParam("id", String.class);
        String roleId = superParam.getParam("roleId", String.class);
        String pid = superParam.getParam("pid", String.class);
        String name = superParam.getParam("name", String.class);
        Integer useFlag = superParam.getParam("useFlag", Integer.class);
        PageQuery<Permission> query = new PageQuery<>(page.longValue(), limit.longValue());
        query.setPara("id", id);
        query.setPara("roleId", roleId);
        query.setPara("pid", pid);
        query.setPara("name", name);
        query.setPara("useFlag", useFlag);
        PageQuery<Permission> pageData = sql.pageQuery("permissionEx.listPermission", Permission.class, query);
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count", pageData.getTotalRow());
        ArrayNode data = rst.putArray("data");
        for (Permission one : pageData.getList()) {
            ObjectNode o = data.addObject();

            o.putPOJO("id", one.getId());
            o.putPOJO("ico", one.getIco());
            o.putPOJO("name", one.getName());
            o.putPOJO("orderFlag", one.getOrderFlag());
            o.putPOJO("pid", one.getPid());
            o.putPOJO("type", translator.translate(DictKey.permissionType, one.getType()));
            o.putPOJO("url", one.getUrl());
            o.putPOJO("useFlag", translator.translate(DictKey.yesOrNo, one.getUseFlag()));
            o.putPOJO("createTime", DateTimeTool.toFullString(one.getCreateTime()));
        }
        return jsonResult(rst);
    }
}
