package app.listener;

import org.beetl.sql.core.SQLManager;

/**
 * Created by landy on 2018/11/20.
 */
public class BaseDataInit extends DataInit {

    public BaseDataInit(SQLManager sql) {
        super(sql);
    }

    @Override
    public boolean initMenu() {
        return false;
    }

    @Override
    public void initDepartment() {

    }

    @Override
    public void initPermission() {

    }

    @Override
    public void initDict() {

    }

    @Override
    public void initParam() {

    }
}
