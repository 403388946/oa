drop table if exists sys_user;
drop table if exists sys_organization;
drop table if exists sys_resource;
drop table if exists sys_role;

create table sys_user (
  id bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  organization_id bigint,
  username varchar(100),
  password varchar(100),
  salt varchar(100),
  role_ids varchar(100),
  locked bool default false,
  constraint pk_sys_user primary key(id)
) charset=utf8 ENGINE=InnoDB;
create unique index idx_sys_user_username on sys_user(username);
create index idx_sys_user_organization_id on sys_user(organization_id);

create table sys_organization (
  id bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  name varchar(100),
  parent_id bigint,
  parent_ids varchar(100),
  available bool default false,
  constraint pk_sys_organization primary key(id)
) charset=utf8 ENGINE=InnoDB;
create index idx_sys_organization_parent_id on sys_organization(parent_id);
create index idx_sys_organization_parent_ids on sys_organization(parent_ids);


create table sys_resource (
  id bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  name varchar(100),
  type varchar(50),
  url varchar(200),
  parent_id bigint,
  parent_ids varchar(100),
  permission varchar(100),
  available bool default false,
  constraint pk_sys_resource primary key(id)
) charset=utf8 ENGINE=InnoDB;
create index idx_sys_resource_parent_id on sys_resource(parent_id);
create index idx_sys_resource_parent_ids on sys_resource(parent_ids);

create table sys_role (
  id bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  role varchar(100),
  description varchar(100),
  resource_ids varchar(100),
  available bool default false,
  constraint pk_sys_role primary key(id)
) charset=utf8 ENGINE=InnoDB;
create index idx_sys_role_resource_ids on sys_role(resource_ids);