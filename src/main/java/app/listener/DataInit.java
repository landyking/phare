package app.listener;

import org.beetl.sql.core.SQLManager;

/**
 * Created by landy on 2018/11/20.
 */
public abstract class DataInit {
    protected final SQLManager sql;

    public DataInit(SQLManager sql) {
        this.sql = sql;
    }
    public abstract boolean initMenu();

    public abstract void initDepartment();

    public abstract void initPermission();

    public abstract void initDict();

    public abstract void initParam();
}
