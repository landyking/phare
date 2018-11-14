package app.controller.admin.dict;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.Dict;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

@Component
public class LoadDictController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id=superParam.needParam("id",String.class);

        Dict one=new Dict();
        one.setId(id);

        Dict out = sql.templateOne(one);
        Assert.notNull(out, "数据不存在");
        ObjectNode data = QuickJson.newObject();
        data.putPOJO("id",out.getId());
        data.putPOJO("code",out.getCode());
        data.putPOJO("deleteFlag",out.getDeleteFlag());
        data.putPOJO("description",out.getDescription());
        data.putPOJO("createTime",out.getCreateTime());
        data.putPOJO("updateTime", DateTimeTool.toFullString(out.getUpdateTime()));
        return jsonResultSuccess("data",data);
    }
}
