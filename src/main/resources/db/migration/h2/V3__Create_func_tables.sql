CREATE TABLE t_phare_project (
  ID          VARCHAR2(32) NOT NULL,
  code varchar2(100) not null,
  name varchar2(100),
  description NVARCHAR2(1000),
  create_time TIMESTAMP    NOT NULL,
  PRIMARY KEY (ID)
);
COMMENT ON TABLE t_phare_project IS '工程信息';
comment on column t_phare_project.name is '名称';
comment on column t_phare_project.description is '描述';
comment on column t_phare_project.create_time is '创建时间';

CREATE TABLE t_phare_table_info (
  ID          VARCHAR2(32) NOT NULL,
  project_id varchar2(32) not null,
  code varchar2(100) not null,
  name varchar2(100),
  description NVARCHAR2(1000),
  create_time TIMESTAMP    NOT NULL,
  PRIMARY KEY (ID)
);
COMMENT ON TABLE t_phare_table_info IS '表信息';
comment on column t_phare_table_info.project_id is '所属工程';
comment on column t_phare_table_info.name is '名称';
comment on column t_phare_table_info.description is '描述';
comment on column t_phare_table_info.create_time is '创建时间';

CREATE TABLE t_phare_table_column (
  ID          VARCHAR2(32) NOT NULL,
  table_id varchar2(32) not null,
  code varchar2(100) not null,
  name varchar2(100),
  description NVARCHAR2(1000),
  nullable_flag number(1),
  pk_flag number(1),
  fk_id varchar2(32),
  def_val varchar2(100),
  data_type varchar2(100),
  db_type varchar2(100),
  type_length number(5),
  type_precision number(5),
  constant_id varchar2(32),
  create_time TIMESTAMP    NOT NULL,
  PRIMARY KEY (ID)
);
COMMENT ON TABLE t_phare_table_column IS '列信息';
comment on column t_phare_table_column.table_id is '所属表';
comment on column t_phare_table_column.name is '名称';
comment on column t_phare_table_column.description is '描述';
comment on column t_phare_table_column.nullable_flag is '可空';
comment on column t_phare_table_column.pk_flag is '是否主键';
comment on column t_phare_table_column.fk_id is '外键引用id';
comment on column t_phare_table_column.def_val is '默认值';
comment on column t_phare_table_column.data_type is '数据类型';
comment on column t_phare_table_column.db_type is '数据库类型';
comment on column t_phare_table_column.type_length is '类型长度';
comment on column t_phare_table_column.type_precision is '类型精度';
comment on column t_phare_table_column.constant_id is '常量引用id';
comment on column t_phare_table_column.create_time is '创建时间';

CREATE TABLE t_phare_constant (
  ID          VARCHAR2(32) NOT NULL,
  project_id varchar2(32) not null,
  code varchar2(100) not null,
  name varchar2(100),
  description NVARCHAR2(1000),
  create_time TIMESTAMP    NOT NULL,
  PRIMARY KEY (ID)
);
COMMENT ON TABLE t_phare_constant IS '常量信息';
comment on column t_phare_constant.project_id is '所属工程';
comment on column t_phare_constant.name is '名称';
comment on column t_phare_constant.description is '描述';
comment on column t_phare_constant.create_time is '创建时间';

CREATE TABLE t_phare_constant_value (
  ID          VARCHAR2(32) NOT NULL,
  constant_id varchar2(32) not null,
  code varchar2(100) not null,
  name varchar2(100),
  description NVARCHAR2(1000),
  create_time TIMESTAMP    NOT NULL,
  PRIMARY KEY (ID)
);
COMMENT ON TABLE t_phare_constant_value IS '常量值信息';
comment on column t_phare_constant_value.constant_id is '所属常量';
comment on column t_phare_constant_value.name is '名称';
comment on column t_phare_constant_value.description is '描述';
comment on column t_phare_constant_value.create_time is '创建时间';