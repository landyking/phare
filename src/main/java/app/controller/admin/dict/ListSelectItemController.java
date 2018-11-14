package app.controller.admin.dict;

import app.common.QuickJson;
import app.common.web.SuperParam;
import app.controller.admin.AdminController;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import gen.DictItem;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Component
public class ListSelectItemController extends AdminController {

    @Override
    protected ModelAndView doWork(SuperParam superParam) throws Exception {
        String dictCode = superParam.needParam("dictCode", String.class);
        List<DictItem> itemList = translator.listItemByDictCode(dictCode);
        ArrayNode data = QuickJson.newArray();
        for (DictItem one : itemList) {
            ObjectNode o = data.addObject();
            o.put("label", one.getContent());
            o.put("value", one.getCode());
        }
        return jsonResultSuccess("data", data);
    }
}
