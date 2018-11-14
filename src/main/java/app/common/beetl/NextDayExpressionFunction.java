package app.common.beetl;

import app.common.DateTimeTool;
import org.beetl.core.Context;
import org.beetl.core.Function;

import java.util.Date;

public class NextDayExpressionFunction implements Function {

    public Object call(Object[] paras, Context ctx) {

        if (paras.length == 0 || paras[0] == null) {
            throw new RuntimeException("日期参数为空");
        }
        Object result = paras[0];
        if (result instanceof Date) {
            return DateTimeTool.nextDay(((Date) result).getTime());
        } else if (result instanceof Long) {
            return DateTimeTool.nextDay((Long) result).getTime();
        } else {
            throw new RuntimeException("不支持的日期类型: " + result.getClass().getName());
        }
    }

}
