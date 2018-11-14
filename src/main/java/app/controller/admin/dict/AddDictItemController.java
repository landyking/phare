package app.controller.admin.dict;

import app.common.DateTimeTool;
import app.common.Texts;
import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.DictItem;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Component
public class AddDictItemController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String code = superParam.needParam("code", String.class);
        String content = superParam.needParam("content", String.class);
        String dictId = superParam.needParam("dictId", String.class);

        long count = sql.query(DictItem.class).andEq("code", code)
                .andEq("dict_id", dictId).count();
        Assert.isTrue(count <= 0, "字典项" + code + "已存在");

        Date createTime = DateTimeTool.now();
        Date updateTime = createTime;

        DictItem one = new DictItem();
        String id = Texts.uuidLong();
        one.setId(id);
        one.setCode(code);
        one.setContent(content);
        one.setDictId(dictId);
        one.setCreateTime(createTime);
        one.setUpdateTime(updateTime);

        sql.insertTemplate(one);
        doLog(OperateLogType.addDictItem, String.format("id: %s, code: %s", id, code));
        return jsonResultSuccess();
    }
}