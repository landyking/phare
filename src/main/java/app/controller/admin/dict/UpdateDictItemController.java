package app.controller.admin.dict;

import app.common.DateTimeTool;
import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.DictItem;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Component
public class UpdateDictItemController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);
//        String code=superParam.needParam("code",String.class);
        String content = superParam.needParam("content", String.class);
//        String dictId=superParam.needParam("dictId",String.class);
//        Date createTime=superParam.needParam("createTime",Date.class);
        Date updateTime = DateTimeTool.now();

        DictItem one = new DictItem();
        one.setId(id);
        one.setContent(content);
        one.setUpdateTime(updateTime);

        int i = sql.updateTemplateById(one);
        Assert.isTrue(i > 0, "无效更新");
        doLog(OperateLogType.updateDictItem, String.format("id: %s, content: %s", id, content));
        return jsonResultSuccess();
    }
}
