package app.controller.admin.dict;

import app.common.web.SuperParam;
import app.constant.OperateLogType;
import app.controller.admin.AdminController;
import gen.DictItem;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Component
public class DeleteDictItemController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String id = superParam.needParam("id", String.class);

        DictItem one = new DictItem();
        one.setId(id);

        sql.deleteObject(one);
        doLog(OperateLogType.deleteDictItem, String.format("id: %s", id));
        return jsonResultSuccess();
    }
}