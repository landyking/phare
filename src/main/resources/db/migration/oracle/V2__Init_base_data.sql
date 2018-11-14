-- 默认账号 admin 000000
insert into t_account (id,username,password,last_login_ip,last_login_time,enable_flag,delete_flag)
values ('1','admin','f902353066c4a8203a742a4978dc92f2','127.0.0.1',to_timestamp('2006-01-01 12:10:10.1','yyyy-mm-dd hh24:mi:ss.ff'),1,0);

insert into t_dict (id,code,description,delete_flag,create_time,update_time) values ('1','yesOrNo','是否标记',0,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values ('11','1','0','否',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values ('12','1','1','是',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

insert into t_dict (id,code,description,delete_flag,create_time,update_time) values ('2','permissionType','权限类型',0,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values ('21','2','0','菜单',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values ('22','2','1','按钮',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1000000', '系统管理', '', '', '0', '1', CURRENT_TIMESTAMP, '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1001000', '参数设置', '_admin/sys/paramManage.jsp', 'layui-icon-set', 'p1000000', '1', CURRENT_TIMESTAMP, '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1002000', '字典管理', '_admin/sys/dictManage.jsp', 'layui-icon-read', 'p1000000', '2', CURRENT_TIMESTAMP, '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1003000', '权限管理', '', '', 'p1000000', '3', CURRENT_TIMESTAMP, '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1003010', '后台账户', '_admin/sys/adminUserManage.jsp', 'layui-icon-user', 'p1003000', '1', CURRENT_TIMESTAMP, '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1003020', '后台角色', '_admin/sys/adminRoleManage.jsp', 'layui-icon-star', 'p1003000', '2', CURRENT_TIMESTAMP, '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1003030', '后台权限', '_admin/sys/adminPermissionManage.jsp', 'layui-icon-component', 'p1003000', '3', CURRENT_TIMESTAMP, '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1004000', '日志管理', '_admin/sys/logManage.jsp', 'layui-icon-date', 'p1000000', '4', CURRENT_TIMESTAMP, '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1005000', '系统信息', '_admin/sys/systemInfo.jsp', 'layui-icon-rmb', 'p1000000', '5', CURRENT_TIMESTAMP, '1', '0');

-- 新增角色 系统管理员 r1
insert into t_role (id,name,create_time) values ('r1','系统管理员',CURRENT_TIMESTAMP);
-- 给admin 1 分配角色 系统管理员
insert into t_role_user (id,role_id,user_id,create_time) values ('ru1','r1','1',CURRENT_TIMESTAMP);
-- 为 系统管理员角色 授予 全部权限
delete from t_role_permission where role_id = 'r1';
insert into T_ROLE_PERMISSION (id,role_id,permission_id,create_time)(select sys_guid() as id,'r1',t.id as permission_id,CURRENT_TIMESTAMP from T_PERMISSION t);