package org.beetl.sql.core.db;

import org.beetl.sql.core.SQLSource;
import org.beetl.sql.core.annotatoin.AssignID;
import org.beetl.sql.core.annotatoin.AutoID;
import org.beetl.sql.core.annotatoin.SeqID;
import org.beetl.sql.core.kit.BeanKit;

import java.lang.annotation.Annotation;
import java.util.List;

/**
 * Created by landy on 2018/11/14.
 */
public class CustomH2Style extends H2Style {
    @Override
    public SQLSource genInsert(Class<?> cls) {
        return super.genInsert(cls);
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
