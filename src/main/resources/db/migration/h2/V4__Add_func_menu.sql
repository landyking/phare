insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p2000000', '基本功能', '', '', '0', '2', CURRENT_TIMESTAMP(), '1', '0');

insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p2001000', '工程管理', '_admin/project/listProject.jsp', 'layui-icon-set', 'p2000000', '1', CURRENT_TIMESTAMP(), '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p2002000', '常量管理', '_admin/constant/listConstant.jsp', 'layui-icon-set', 'p2000000', '2', CURRENT_TIMESTAMP(), '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p2003000', '表信息管理', '_admin/tableInfo/listTableInfo.jsp', 'layui-icon-set', 'p2000000', '3', CURRENT_TIMESTAMP(), '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p2004000', '列信息管理', '_admin/tableColumn/listTableColumn.jsp', 'layui-icon-set', 'p2000000', '4', CURRENT_TIMESTAMP(), '1', '0');

-- 为 系统管理员角色 授予 全部权限
delete from t_role_permission where role_id = 'r1';
insert into T_ROLE_PERMISSION (id,role_id,permission_id,create_time)(select replace(uuid(),'-','') as id,'r1',t.id as permission_id,CURRENT_TIMESTAMP() from T_PERMISSION t);