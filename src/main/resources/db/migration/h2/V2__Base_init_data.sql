-- 默认账号 admin 000000
insert into t_account (id,username,password,last_login_ip,last_login_time,enable_flag,delete_flag,dep_id)
values ('1','admin','f902353066c4a8203a742a4978dc92f2','127.0.0.1',null,1,0,'0');

insert into t_dict (id,code,description,delete_flag,create_time,update_time) values ('i1','yesOrNo','是否标记',0,CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values ('i11','i1','0','否',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values ('i12','i1','1','是',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());

insert into t_dict (id,code,description,delete_flag,create_time,update_time) values ('i2','permissionType','权限类型',0,CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values ('i21','i2','0','菜单',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values ('i22','i2','1','按钮',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());

insert into t_dict (id,code,description,delete_flag,create_time,update_time) values ('i3','departmentControlType','部门控制类型',0,CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values ('i31','i3','0','默认',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());

insert into t_dict (id,code,description,delete_flag,create_time,update_time) values ('i9','operateLogType','操作日志类型',0,CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i92','i9','2','管理员登录',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i93','i9','3','修改自身密码',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i94','i9','4','管理员登出',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999000','i9','99000','修改参数',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999010','i9','99010','新增字典',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999011','i9','99011','更新字典',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999020','i9','99020','新增字典项',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999021','i9','99021','更新字典项',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999023','i9','99023','删除字典项',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999030','i9','99030','创建管理员',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999031','i9','99031','删除管理员',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999032','i9','99032','更新管理员',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999033','i9','99033','修改管理员密码',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999034','i9','99034','为管理员分配角色',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999040','i9','99040','新增角色',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999041','i9','99041','更新角色',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999042','i9','99042','删除角色',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999050','i9','99050','新增权限',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999051','i9','99051','更新权限',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999052','i9','99052','将权限授予角色',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999060','i9','99060','新增单位',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999061','i9','99061','更新单位',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());
insert into t_dict_item (id,dict_id,code,CONTENT,create_time,update_time) values('i999062','i9','99062','删除单位',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP());

insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1000000', '系统管理', '', '', '0', '9999', CURRENT_TIMESTAMP(), '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1001000', '参数设置', '_admin/sys/paramManage.jsp', 'layui-icon-set', 'p1000000', '1', CURRENT_TIMESTAMP(), '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1002000', '字典管理', '_admin/sys/dictManage.jsp', 'layui-icon-read', 'p1000000', '2', CURRENT_TIMESTAMP(), '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1003000', '权限管理', '', '', 'p1000000', '3', CURRENT_TIMESTAMP(), '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1003010', '后台账户', '_admin/sys/adminUserManage.jsp', 'layui-icon-user', 'p1003000', '1', CURRENT_TIMESTAMP(), '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1003020', '后台角色', '_admin/sys/adminRoleManage.jsp', 'layui-icon-star', 'p1003000', '2', CURRENT_TIMESTAMP(), '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1003030', '功能权限', '_admin/sys/adminPermissionManage.jsp', 'layui-icon-component', 'p1003000', '3', CURRENT_TIMESTAMP(), '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1003040', '单位信息', '_admin/sys/listDepartment.jsp', 'layui-icon-component', 'p1003000', '4', CURRENT_TIMESTAMP(), '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1003050', '数据权限', '_admin/sys/listDepartmentControl.jsp', 'layui-icon-component', 'p1003000', '5', CURRENT_TIMESTAMP(), '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1004000', '日志管理', '_admin/sys/logManage.jsp', 'layui-icon-date', 'p1000000', '4', CURRENT_TIMESTAMP(), '1', '0');
insert into T_PERMISSION (ID, NAME, URL, ICO, PID, ORDER_FLAG, CREATE_TIME, USE_FLAG, TYPE) values ('p1005000', '系统信息', '_admin/sys/systemInfo.jsp', 'layui-icon-rmb', 'p1000000', '5', CURRENT_TIMESTAMP(), '1', '0');

-- 新增角色 系统管理员 r1
insert into t_role (id,name,create_time) values ('r1','系统管理员',CURRENT_TIMESTAMP());
-- 给admin 1 分配角色 系统管理员
insert into t_role_user (id,role_id,user_id,create_time) values ('ru1','r1','1',CURRENT_TIMESTAMP());
-- 为 系统管理员角色 授予 全部权限
delete from t_role_permission where role_id = 'r1';
insert into T_ROLE_PERMISSION (id,role_id,permission_id,create_time)(select replace(uuid(),'-','') as id,'r1',t.id as permission_id,CURRENT_TIMESTAMP() from T_PERMISSION t);