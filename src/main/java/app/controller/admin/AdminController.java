package app.controller.admin;

import app.common.DateTimeTool;
import app.common.QuickJson;
import app.common.Texts;
import app.common.shiro.MyUser;
import app.common.web.BaseController;
import app.constant.OperateLogType;
import app.constant.ParamKey;
import app.service.DictTranslator;
import app.service.ParamManager;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.google.common.base.Function;
import com.google.common.collect.Lists;
import gen.OperateLog;
import org.beetl.sql.core.SQLManager;
import org.beetl.sql.core.db.H2Style;
import org.beetl.sql.core.engine.PageQuery;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by landy on 2018/9/25.
 */
public abstract class AdminController extends BaseController {
    @Resource
    protected SQLManager sql;
    @Resource
    protected DictTranslator translator;
    @Resource
    protected ParamManager paramManager;

    public MyUser getAdminUser() {
        return getMyUser(MyUser.MODE_ADMIN);
    }

    public int calcStartRow(int page, int limit) {
        if (sql.getDbStyle() instanceof H2Style) {
            return (page - 1) * limit;
        } else {
            return (page - 1) * limit + 1;
        }
    }

    protected boolean isEnd(Integer page, Integer limit, long total) {
        return page * limit >= total;
    }

    public void fillQuery(PageQuery query, Map<String, Object> collect) {
        for (String k : collect.keySet()) {
            query.setPara(k, collect.get(k));
        }
    }

    @Override
    public ModelAndView jsonResultSuccess() {
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        return jsonResult(rst);
    }

    @Override
    public ModelAndView jsonResultSuccess(String name, JsonNode node) {
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 0);
        rst.put("msg", "ok");
        rst.set(name, node);
        return jsonResult(rst);
    }

    @Override
    public ModelAndView jsonResultFailure(String message) {
        ObjectNode rst = QuickJson.newObject();
        rst.put("code", 1);
        rst.put("msg", message);
        return jsonResult(rst);
    }

    public void doLog(OperateLogType type, String description) {
        OperateLog log = new OperateLog();
        log.setId(Texts.uuidLong());
        log.setCreateTime(DateTimeTool.now());
        log.setDescription(description);
        log.setOperator(getAdminUser().getUserId());
        log.setType((long) type.getType());
        sql.insert(log);
    }

    protected List<String> contactDownloadUrl(List<String> list) {
        if (list == null || !list.iterator().hasNext()) {
            return list;
        }
        final String param = paramManager.getParam(ParamKey.DOWNLOAD_FILE_URL);
        return Lists.transform(list, new Function<String, String>() {
            @Override
            public String apply(String input) {
                return param + input;
            }
        });
    }
}
