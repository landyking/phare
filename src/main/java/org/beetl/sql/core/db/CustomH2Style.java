package org.beetl.sql.core.db;

import org.beetl.sql.core.SQLSource;
import org.beetl.sql.core.annotatoin.AssignID;
import org.beetl.sql.core.annotatoin.AutoID;
import org.beetl.sql.core.annotatoin.SeqID;
import org.beetl.sql.core.kit.BeanKit;

import java.lang.annotation.Annotation;
import java.util.List;
import java.util.Map;

/**
 * Created by landy on 2018/11/14.
 */
public class CustomH2Style extends H2Style {

    public String getPageSQLStatement(String sql, long offset, long pageSize) {
        offset = PageParamKit.mysqlOffset(this.offsetStartZero, offset);
        StringBuilder builder = new StringBuilder(sql);
        builder.append(" limit ").append(offset).append(" , ").append(pageSize);
        return builder.toString();
    }

    public void initPagePara(Map<String, Object> param, long start, long size) {
        param.put("_pageOffset", start - (long) (this.offsetStartZero ? 0 : 1));
        param.put("_pageSize", size);
    }
    @Override
    public int getIdType(Class c, String idProperty) {
        List<Annotation> ans = BeanKit.getAllAnnoation(c, idProperty);
        int idType = DBStyle.ID_ASSIGN; //默认手动赋值

        for (Annotation an : ans) {
            if (an instanceof AutoID) {
                idType = DBStyle.ID_AUTO;
                break;// 优先
            } else if (an instanceof SeqID) {
                //my sql not support
            } else if (an instanceof AssignID) {
                idType = DBStyle.ID_ASSIGN;
            }
        }

        return idType;
    }
}
