package app.controller.admin.permission;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.web.SuperParam;
import app.constant.DictKey;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.google.common.collect.Ordering;
import gen.Department;
import gen.Permission;
import org.beetl.sql.core.engine.PageQuery;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class TreePermissionController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String roleId = superParam.getParam("roleId", String.class);
        String pid = superParam.getParam("pid", String.class, "0");
        String name = superParam.getParam("name", String.class);
        Integer useFlag = superParam.getParam("useFlag", Integer.class);
        PageQuery<Permission> query = new PageQuery<>(1, 2000);
        query.setPara("roleId", roleId);
        query.setPara("name", name);
        query.setPara("useFlag", useFlag);
        PageQuery<Permission> pageData = sql.pageQuery("permissionEx.listPermission", Permission.class, query);
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count", pageData.getTotalRow());
        ArrayNode data = rst.putArray("data");
        List<Permission> list = pageData.getList();
        Map<String, List<Permission>> pidToDep = list.stream().collect(Collectors.groupingBy(Permission::getPid));
        Assert.isTrue(!CollectionUtils.isEmpty(pidToDep.get(pid)), "根菜单不存在");
        fillTree(data, pid, pidToDep);
        return jsonResult(rst);
    }

    private void fillTree(ArrayNode data, String pid, Map<String, List<Permission>> pidToDep) {
        List<Permission> list = pidToDep.get(pid);
        Collections.sort(list, new Ordering<Permission>() {
            @Override
            public int compare(Permission left, Permission right) {
                return left.getOrderFlag().compareTo(right.getOrderFlag());
            }
        });
        for (Permission dep : list) {
            ObjectNode obj = data.addObject();
            QuickJson.fillFromPojo(obj, dep, "url");
            if (!CollectionUtils.isEmpty(pidToDep.get(dep.getId()))) {
                fillTree(obj.putArray("children"), dep.getId(), pidToDep);
            }
        }
    }
}
