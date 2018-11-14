package app.controller.admin.param;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.Param;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

@Component
public class LoadParamController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);

        Param one = new Param();
        one.setId(id);

        Param out = sql.templateOne(one);
        Assert.notNull(out, "数据不存在");
        ObjectNode data = QuickJson.newObject();
        data.putPOJO("id", out.getId());
        data.putPOJO("code", out.getCode());
        data.putPOJO("content", out.getContent());
        data.putPOJO("deleteFlag", out.getDeleteFlag());
        data.putPOJO("description", out.getDescription());
        data.putPOJO("createTime", out.getCreateTime());
        data.putPOJO("updateTime", DateTimeTool.toFullString(out.getUpdateTime()));
        return jsonResultSuccess("data", data);
    }
}