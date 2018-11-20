package app.listener;

import org.beetl.sql.core.SQLManager;

/**
 * Created by landy on 2018/11/20.
 */
public class BaseDataInit extends DataInit {
    private SQLManager sql;

    public BaseDataInit(SQLManager sql) {
        this.sql = sql;
    }

    @Override
    public boolean initMenu() {
        return false;
    }

    @Override
    public void initDepartment() {

    }

    @Override
    public void initPermision() {

    }

    @Override
    public void initDict() {

    }

    @Override
    public void initParam() {

    }
}
