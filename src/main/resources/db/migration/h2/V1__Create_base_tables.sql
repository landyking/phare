-- 日志信息：主键、操作类型、创建时间、操作内容。
CREATE TABLE t_operate_log (
  ID          VARCHAR2(32) NOT NULL,
  TYPE        INT          NOT NULL,
  operator varchar2(32),
  description NVARCHAR2(1000),
  create_time TIMESTAMP    NOT NULL,
  PRIMARY KEY (ID)
);
COMMENT ON TABLE t_operate_log IS '日志信息';
comment on column T_OPERATE_LOG.operator is '操作人';
-- 字典表：主键、字典编码、字典描述、字典值、删除标记、创建时间、修改时间。
CREATE TABLE t_dict (
  ID          VARCHAR2(32)  NOT NULL,
  code        VARCHAR2(100) NOT NULL,
  description VARCHAR2(255) NOT NULL,
  delete_flag INT           NOT NULL,
  create_time TIMESTAMP     NOT NULL,
  update_time TIMESTAMP     NOT NULL,
  PRIMARY KEY (ID)
);
COMMENT ON TABLE t_dict IS '字典表';
-- 字典项表：主键、字典主键、字典项编码、字典项值、创建时间、修改时间。
CREATE TABLE t_dict_item (
  ID          VARCHAR2(32)  NOT NULL,
  dict_id     VARCHAR2(32)  NOT NULL,
  code        VARCHAR2(100) NOT NULL,
  CONTENT     VARCHAR2(255),
  create_time TIMESTAMP     NOT NULL,
  update_time TIMESTAMP     NOT NULL,
  PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX ditem_dictid_code_unq
  ON t_dict_item (dict_id, code);
COMMENT ON TABLE t_dict_item IS '字典项表';
-- 参数表：主键、参数编码、参数说明、参数值、删除标记、创建时间、修改时间。
CREATE TABLE t_param (
  ID          VARCHAR2(32)  NOT NULL,
  code        VARCHAR2(100) NOT NULL,
  description VARCHAR2(255) NOT NULL,
  CONTENT     VARCHAR2(255),
  delete_flag INT           NOT NULL,
  create_time TIMESTAMP     NOT NULL,
  update_time TIMESTAMP     NOT NULL,
  PRIMARY KEY (ID)
);
COMMENT ON TABLE t_param IS '参数表';
-- 用户信息表：主键、账号、密码、最后登录时间、最后登录IP、删除标记、启用标记。
CREATE TABLE t_account (
  ID              VARCHAR2(32) NOT NULL,
  description varchar2(200),
  username        VARCHAR2(64) NOT NULL,
  PASSWORD        VARCHAR2(64) NOT NULL,
  last_login_ip   VARCHAR2(20),
  last_login_time TIMESTAMP,
  enable_flag     INT          NOT NULL,
  delete_flag     INT          NOT NULL,
  PRIMARY KEY (ID)
);
COMMENT ON TABLE t_account IS '用户信息表';
comment on column T_ACCOUNT.description is '描述';

--  增加权限表
CREATE TABLE T_PERMISSION
(
  id          VARCHAR2(32)   NOT NULL,
  name        NVARCHAR2(100) NOT NULL,
  url         NVARCHAR2(100),
  ico         VARCHAR2(100),
  pid         VARCHAR2(32)   NOT NULL,
  order_flag  NUMBER(10),
  create_time TIMESTAMP      NOT NULL,
  use_flag    NUMBER(1) DEFAULT 0,
  type        NUMBER(2) DEFAULT 0,
  PRIMARY KEY (id)
);
COMMENT ON TABLE T_PERMISSION IS '权限表';
-- Add comments to the columns
COMMENT ON COLUMN T_PERMISSION.id IS '主键';
COMMENT ON COLUMN T_PERMISSION.name IS '权限名称';
COMMENT ON COLUMN T_PERMISSION.url IS '资源访问路径';
COMMENT ON COLUMN T_PERMISSION.ico IS '菜单图标';
COMMENT ON COLUMN T_PERMISSION.pid IS '父级权限ID';
COMMENT ON COLUMN T_PERMISSION.order_flag IS '排序号，小的优先级高';
COMMENT ON COLUMN T_PERMISSION.create_time IS '创建时间';
COMMENT ON COLUMN T_PERMISSION.use_flag IS '启用停用，1启用，0停用';
COMMENT ON COLUMN T_PERMISSION.type IS '菜单分类，0菜单，1按钮';
--  增加角色表
CREATE TABLE T_ROLE
(
  id          VARCHAR2(32)   NOT NULL,
  name        NVARCHAR2(100) NOT NULL,
  create_time TIMESTAMP      NOT NULL,
  PRIMARY KEY (id)
);
COMMENT ON TABLE T_ROLE IS '角色表';
COMMENT ON COLUMN T_ROLE.id IS '主键';
COMMENT ON COLUMN T_ROLE.name IS '角色名称';
COMMENT ON COLUMN T_ROLE.create_time IS '创建时间';
--  增加角色权限关联表
CREATE TABLE T_ROLE_PERMISSION
(
  id            VARCHAR2(32) NOT NULL,
  role_id       VARCHAR2(32) NOT NULL,
  permission_id VARCHAR2(32) NOT NULL,
  create_time   TIMESTAMP    NOT NULL,
  PRIMARY KEY (id)
);
alter table T_ROLE_PERMISSION add constraint role_permission_unq unique (PERMISSION_ID, ROLE_ID);
COMMENT ON TABLE T_ROLE_PERMISSION IS '角色权限关联表';
-- Add comments to the columns
COMMENT ON COLUMN T_ROLE_PERMISSION.id IS '主键';
COMMENT ON COLUMN T_ROLE_PERMISSION.role_id IS '角色id';
COMMENT ON COLUMN T_ROLE_PERMISSION.permission_id IS '权限id';
COMMENT ON COLUMN T_ROLE_PERMISSION.create_time IS '创建时间';
--  增加角色人员关联表
CREATE TABLE T_ROLE_USER
(
  id          VARCHAR2(32) NOT NULL,
  role_id     VARCHAR2(32) NOT NULL,
  user_id     VARCHAR2(32) NOT NULL,
  create_time TIMESTAMP    NOT NULL,
  PRIMARY KEY (id)
);
alter table T_ROLE_USER add constraint role_user_unq unique (ROLE_ID, USER_ID);
COMMENT ON TABLE T_ROLE_USER
IS '角色用户关联表';
-- Add comments to the columns
COMMENT ON COLUMN T_ROLE_USER.id
IS '主键';
COMMENT ON COLUMN T_ROLE_USER.role_id
IS '角色id';
COMMENT ON COLUMN T_ROLE_USER.user_id
IS '用户id';
COMMENT ON COLUMN T_ROLE_USER.create_time
IS '创建时间';