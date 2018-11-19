package app.constant;

/**
 * Created by landy on 2018/9/19.
 */
public enum OperateLogType {
    /**
     * 管理员登录
     */
    adminLogin(2),
    /**
     * 修改自身密码
     */
    changeSelfPass(3),
    /**
     * 管理员登出
     */
    adminLogout(4),


    /**
     * 修改参数
     */
    modifyParam(99000),
    /**
     * 新增字典
     */
    addDict(99010),
    /**
     * 更新字典
     */
    updateDict(99011),
    /**
     * 新增字典项
     */
    addDictItem(99020),
    /**
     * 更新字典项
     */
    updateDictItem(99021),
    /**
     * 删除字典项
     */
    deleteDictItem(99023),
    /**
     * 创建管理员
     */
    addAccount(99030),
    /**
     * 删除管理员
     */
    deleteAccount(99031),
    /**
     * 更新管理员
     */
    updateAccount(99032),
    /**
     * 修改管理员密码
     */
    changeAccountPass(99033),
    /**
     * 为管理员分配角色
     */
    assignRoleToAccount(99034),
    /**
     * 新增角色
     */
    addRole(99040),
    /**
     * 更新角色
     */
    updateRole(99041),
    /**
     * 删除角色
     */
    deleteRole(99042),
    /**
     * 新增权限
     */
    addPermission(99050),
    /**
     * 更新权限
     */
    updatePermission(99051),
    /**
     * 将权限授予角色
     */
    grantPermissionToRole(99052),
    /**
     * 新增单位
     */
    addDepartment(99060),
    /**
     * 更新单位
     */
    updateDepartment(99061),
    /**
     * 删除单位
     */
    deleteDepartment(99062);

    private int type;

    OperateLogType(int type) {
        this.type = type;
    }

    public int getType() {
        return type;
    }
}
