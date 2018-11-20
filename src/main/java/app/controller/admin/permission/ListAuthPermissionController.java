package app.controller.admin.permission;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.web.SuperParam;
import app.constant.DictKey;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.Permission;
import org.beetl.sql.core.engine.CustomPageQuery;
import org.beetl.sql.core.engine.PageQuery;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Component
public class ListAuthPermissionController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String userId = superParam.getParam("userId", String.class);

        PageQuery<Permission> query = new CustomPageQuery<>(superParam);
        query.setPara("userId", userId);
        List<Permission> pageData = sql.select("permissionEx.listAuthPermission", Permission.class, query.getParas());
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count", pageData.size());
        ArrayNode data = rst.putArray("data");
        for (Permission one : pageData) {
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
