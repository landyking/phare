package app.listener;

import app.common.DateTimeTool;
import gen.Department;
import gen.DepartmentControl;
import org.beetl.sql.core.SQLManager;
import org.springframework.web.context.WebApplicationContext;

/**
 * Created by landy on 2018/11/19.
 */
public class TestDataInit {
    public static void init(WebApplicationContext applicationContext) {
        SQLManager sql = applicationContext.getBean(SQLManager.class);
        initDepartmentData(sql);
    }

    private static void initDepartmentData(SQLManager sql) {
        addDepartment(sql, "1", "0", "利冬市局");
        addDepartment(sql, "11", "1", "网络处");
        addDepartment(sql, "111", "11", "网络1");
        addDepartment(sql, "112", "11", "网络2");
        addDepartment(sql, "113", "11", "网络3");
        addDepartment(sql, "22", "1", "安全处");
        addDepartment(sql, "33", "1", "后勤科");
        addDepartment(sql, "331", "33", "后勤1");
        addDepartment(sql, "332", "33", "后勤2");
        addDepartment(sql, "333", "33", "后勤3");
        addDepartment(sql, "334", "33", "后勤4");
        addDepartment(sql, "14", "1", "保卫科");
        addDepartment(sql, "15", "1", "研发部");
        addDepartment(sql, "151", "15", "测试组");
        for (int i = 0; i < 100; i++) {
            addDepartment(sql,"151" + i, "151", "测试" + i);
        }
    }

    private static void addDepartment(SQLManager sql, String id, String pid, String name) {
        if (sql.single(Department.class, id) == null) {
            Department d = new Department();
            d.setId(id);
            d.setName(name);
            d.setAddress("利冬市五一路1号");
            d.setLatitude("0");
            d.setLongitude("0");
            d.setCreateTime(DateTimeTool.nowLong());
            d.setUpdateTime(DateTimeTool.nowLong());
            d.setPid(pid);
            d.setDescription("无");
            sql.insert(d);
        }
    }
}
