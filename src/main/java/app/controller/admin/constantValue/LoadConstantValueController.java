package app.controller.admin.constantValue;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.Texts;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.*;
import java.util.*;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

@Component
public class LoadConstantValueController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id=superParam.needParam("id",String.class);

        ConstantValue one=new ConstantValue();
        one.setId(id);

        ConstantValue out = sql.templateOne(one);
        Assert.notNull(out, "数据不存在");
        ObjectNode data = QuickJson.newObject();
        data.putPOJO("id",out.getId());
        data.putPOJO("constantId",out.getConstantId());
        data.putPOJO("name",out.getName());
        data.putPOJO("description",out.getDescription());
        data.putPOJO("createTime",out.getCreateTime());
        return jsonResultSuccess("data",data);
    }
}

