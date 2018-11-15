package org.beetl.sql.core.engine;

import app.common.QuickMap;
import app.common.web.SuperParam;

/**
 * Created by landy on 2018/11/15.
 */
public class CustomPageQuery<T> extends PageQuery<T> {
    public CustomPageQuery(SuperParam sp) {
        super(getPage(sp), getLimit(sp), extraParams());
    }

    private static QuickMap<String> extraParams() {
        return QuickMap.strMap();
    }

    private static long getLimit(SuperParam sp) {
        return sp.getParam("limit", Integer.class, 10).longValue();
    }

    private static long getPage(SuperParam sp) {
        return sp.getParam("page", Integer.class, 1).longValue();
    }
}
