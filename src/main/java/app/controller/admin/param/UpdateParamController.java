package app.controller.admin.param;

import app.common.DateTimeTool;
import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.Param;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Component
public class UpdateParamController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);
//        String code=superParam.needParam("code",String.class);
        String content = superParam.needParam("content", String.class);
//        Long deleteFlag=superParam.needParam("deleteFlag",Long.class);
        String description = superParam.needParam("description", String.class);
//        Date createTime=superParam.needParam("createTime",Date.class);
        Date updateTime = DateTimeTool.now();

        Param one = new Param();
        one.setId(id);
        one.setContent(content);
        one.setDescription(description);
        one.setUpdateTime(updateTime);

        int i = sql.updateTemplateById(one);
        Assert.isTrue(i > 0, "无效更新");
        doLog(OperateLogType.modifyParam, String.format("id: %s, content: %s", id, content));
        return jsonResultSuccess();
    }
}