package app.controller.admin.departmentControl;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.QuickMap;
import app.common.Texts;
import app.common.web.SuperParam;
import app.constant.AppConst;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.*;
import gen.*;

import java.util.*;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.beetl.sql.core.engine.PageQuery;
import org.beetl.sql.core.engine.CustomPageQuery;

@Component
public class ListDepartmentControlController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        Integer type = superParam.needParam("type", Integer.class);
        String userId = superParam.needParam("userId", String.class);

        CustomPageQuery<DepartmentControl> query = new CustomPageQuery<>(superParam);
        query.setPara("userId", userId);
        query.setPara("type", type);
        List<DepartmentControl> pageData = sql.select("departmentControlEx.listPageData", DepartmentControl.class, query.getParas());
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.put("count", pageData.size());
        ArrayNode data = rst.putArray("data");
        for (DepartmentControl one : pageData) {
            ObjectNode o = data.addObject();

            o.putPOJO("createTime", one.getCreateTime());
            o.putPOJO("depId", one.getDepId());
            o.putPOJO("id", one.getId());
            o.putPOJO("type", one.getType());
            o.putPOJO("userId", one.getUserId());
        }
        return jsonResult(rst);
    }
}

