package app.service;

import gen.Param;
import org.beetl.sql.core.SQLManager;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.concurrent.Callable;

/**
 * Created by landy on 2018/9/20.
 */
@Service
public class ParamManager {
    public static final String PARAM_MANAGER = "ParamManager";
    @Resource
    private SQLManager sql;
    @Resource
    private CacheManager cacheManager;

    public String getParam(final String paramKey) {
        Cache cache = cacheManager.getCache(PARAM_MANAGER);
        return cache.get(paramKey, new Callable<String>() {
            @Override
            public String call() throws Exception {
                Param single = sql.query(Param.class).andEq("delete_flag", 0)
                        .andEq("code", paramKey).single();
                if (single != null) {
                    return single.getContent();
                }
                return "";
            }
        });
    }
}
