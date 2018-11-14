package app.service;

import app.common.QuickMap;
import app.common.Texts;
import com.google.common.base.Joiner;
import com.google.common.collect.Maps;
import gen.DictItem;
import org.beetl.sql.core.SQLManager;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.Callable;

/**
 * Created by landy on 2018/9/19.
 */
@Service
public class DictTranslator {
    public static final String DICT_TRANSLATOR = "DictTranslator";
    @Resource
    private SQLManager sql;
    @Resource
    private CacheManager cacheManager;

    public String translate(String dictKey, Object v) {
        return translate(dictKey, v, true);
    }

    public String translate(final String dictKey, Object v, final boolean failUseOriginal) {
        if (v == null) {
            return null;
        }
        final String val = Texts.toString(v);
        String cacheKey = Joiner.on('#').join(dictKey, val, failUseOriginal);
        org.springframework.cache.Cache cache = cacheManager.getCache(DICT_TRANSLATOR);
        return cache.get(cacheKey, () -> doTranslate(dictKey, val, failUseOriginal));
    }

    @SuppressWarnings("unchecked")
    public List<DictItem> listItemByDictCode(String dictKey) {
        return sql.select("dictItemEx.listItemByDictCode", DictItem.class, QuickMap.of("dictCode", dictKey));
    }

    private String doTranslate(String dictKey, String val, boolean failUseOriginal) {
        HashMap<String, Object> params = Maps.newHashMap();
        params.put("dictCode", dictKey);
        params.put("itemCode", val);
        String content = sql.selectSingle("dictItemEx.getItemContentByDictAndCode", params, String.class);
        if (content == null && failUseOriginal) {
            return val;
        } else {
            return content;
        }
    }
}
