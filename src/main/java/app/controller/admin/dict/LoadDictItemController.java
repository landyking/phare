package app.controller.admin.dict;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.DictItem;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

@Component
public class LoadDictItemController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id=superParam.needParam("id",String.class);

        DictItem one=new DictItem();
        one.setId(id);

        DictItem out = sql.templateOne(one);
        Assert.notNull(out, "数据不存在");
        ObjectNode data = QuickJson.newObject();
        data.putPOJO("id",out.getId());
        data.putPOJO("code",out.getCode());
        data.putPOJO("content",out.getContent());
        data.putPOJO("dictId",out.getDictId());
        data.putPOJO("createTime",out.getCreateTime());
        data.putPOJO("updateTime", DateTimeTool.toFullString(out.getUpdateTime()));
        return jsonResultSuccess("data",data);
    }
}
