package app.controller.admin.dict;

import app.common.DateTimeTool;
import app.common.Texts;
import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.Dict;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Component
public class AddDictController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String code = superParam.needParam("code", String.class);
        String description = superParam.needParam("description", String.class);
        String id = Texts.uuidLong();
        Long deleteFlag = 0l;
        Date createTime = DateTimeTool.now();
        Date updateTime = createTime;

        Dict one = new Dict();
        one.setId(id);
        one.setCode(code);
        one.setDeleteFlag(deleteFlag);
        one.setDescription(description);
        one.setCreateTime(createTime);
        one.setUpdateTime(updateTime);

        sql.insertTemplate(one);
        doLog(OperateLogType.addDict, String.format("id: %s, code: %s", id, code));
        return jsonResultSuccess();
    }
}
