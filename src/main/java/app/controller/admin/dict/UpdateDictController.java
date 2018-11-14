package app.controller.admin.dict;

import app.common.DateTimeTool;
import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.Dict;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Component
public class UpdateDictController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);
//        String code=superParam.needParam("code",String.class);
        String description = superParam.needParam("description", String.class);
        Date updateTime = DateTimeTool.now();

        Dict one = new Dict();
        one.setId(id);
        one.setDescription(description);
        one.setUpdateTime(updateTime);

        int i = sql.updateTemplateById(one);
        Assert.isTrue(i > 0, "无效更新");
        doLog(OperateLogType.updateDict, String.format("id: %s, description: %s", id, description));
        return jsonResultSuccess();
    }
}