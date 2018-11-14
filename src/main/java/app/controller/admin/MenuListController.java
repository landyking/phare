package app.controller.admin;

import app.common.QuickJson;
import app.common.QuickMap;
import app.common.web.SuperParam;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.google.common.collect.Ordering;
import gen.Permission;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collections;
import java.util.List;

/**
 * Created by landy on 2018/9/28.
 */
@Component
public class MenuListController extends AdminController {

    public static final Ordering<Permission> ORDERING = new Ordering<Permission>() {
        @Override
        public int compare(Permission left, Permission right) {
            return left.getOrderFlag().compareTo(right.getOrderFlag());
        }
    };

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String userId = getAdminUser().getUserId();
        List<Permission> list = sql.select("permissionEx.listAuthPermission", Permission.class, QuickMap.of("userId", userId));
        MultiValueMap<String, Permission> map = new LinkedMultiValueMap<>();
        for (Permission one : list) {
            map.add(one.getPid(), one);
        }
        ArrayNode data = QuickJson.newArray();
        fill(data, map, "0");
        return jsonResultSuccess("data", data);
    }

    public void fill(ArrayNode data, MultiValueMap<String, Permission> map, String pid) {
        if (!map.containsKey(pid)) {
            return;
        }
        List<Permission> permissions = map.get(pid);
        Collections.sort(permissions, ORDERING);
        for (Permission one : permissions) {
            ObjectNode o = data.addObject();
            o.put("title", one.getName());
            o.put("href", one.getUrl());
            o.put("icon", one.getIco());
            ArrayNode subList = o.putArray("list");
            fill(subList, map, one.getId());
        }
    }
}
