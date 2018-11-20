package app.controller.admin.account;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.QuickMap;
import app.common.web.SuperParam;
import app.constant.DictKey;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.google.common.base.Function;
import com.google.common.base.Joiner;
import com.google.common.collect.Lists;
import gen.Account;
import gen.Role;
import org.beetl.sql.core.engine.PageQuery;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Component
public class ListAccountController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        Integer page = superParam.getParam("page", Integer.class, 1);
        Integer limit = superParam.getParam("limit", Integer.class, 10);

        QuickMap<String> collect = QuickMap.strMap();
        superParam.getParam(collect, "username", String.class);
        superParam.getParam(collect, "description", String.class);
        superParam.getParam(collect, "enableFlag", String.class);

        PageQuery<Account> query = new PageQuery<>(page.longValue(), limit.longValue());
        fillQuery(query, collect);
        PageQuery<Account> pageData = sql.pageQuery("accountEx.listAccount", Account.class, query);
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count", pageData.getTotalRow());
        ArrayNode data = rst.putArray("data");
        for (Account one : pageData.getList()) {
            ObjectNode o = data.addObject();

            o.putPOJO("id", one.getId());
            o.putPOJO("depId", one.getDepId());
            o.putPOJO("depName", one.get("depName"));
            o.putPOJO("enableFlag", translator.translate(DictKey.yesOrNo, one.getEnableFlag()));
            o.putPOJO("lastLoginIp", one.getLastLoginIp());
            o.putPOJO("username", one.getUsername());
            o.putPOJO("description", one.getDescription());
            o.putPOJO("lastLoginTime", DateTimeTool.toFullString(one.getLastLoginTime()));
            List<Role> roles = sql.select("roleEx.loadRoleByUser", Role.class, QuickMap.of("userId", one.getId()));
            String roleTxt = Joiner.on(",").join(Lists.transform(roles, new Function<Role, String>() {
                @Override
                public String apply(Role input) {
                    return input.getName();
                }
            }));
            o.putPOJO("roles", roleTxt);
        }
        return jsonResult(rst);
    }
}