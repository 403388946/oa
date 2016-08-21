CREATE DATABASE IF NOT EXISTS `oa_test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `oa_test`;


CREATE TABLE IF NOT EXISTS `oa_custom` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `code` varchar(255) NOT NULL COMMENT '编号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creater` bigint(20) NOT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '修改人',
  `is_del` int(2) NOT NULL DEFAULT '0' COMMENT '删除状态0-未删除，1-删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户表';

CREATE TABLE IF NOT EXISTS `oa_employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(255) NOT NULL COMMENT '员工编号',
  `name` varchar(255) NOT NULL COMMENT '员工姓名',
  `id_card` varchar(255) NOT NULL COMMENT '身份证号码',
  `custom_code` varchar(255) NOT NULL COMMENT '客户编号',
  `custom_price` decimal(20,2) DEFAULT '0.00' COMMENT '客户报价',
  `order_code` varchar(255) DEFAULT NULL,
  `custom_name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `join_date` datetime DEFAULT NULL COMMENT '入职日期',
  `pay_code` varchar(255) DEFAULT NULL COMMENT '工资卡号',
  `service_status` int(2) DEFAULT NULL COMMENT '在职状态（0-离职，1-在职，2-离职申请中）',
  `employment_form` int(2) DEFAULT NULL COMMENT '用工形式（1-代理，2-派遣）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creater` bigint(20) NOT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '修改人',
  `is_del` int(2) NOT NULL DEFAULT '0' COMMENT '删除状态0-未删除，1-删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工表';


CREATE TABLE IF NOT EXISTS `oa_file_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `path` varchar(200) DEFAULT NULL,
  `local_name` varchar(50) DEFAULT NULL  COMMENT '本地文件名',
  `real_name` varchar(50) DEFAULT NULL  COMMENT '服务器文件名',
  `file_size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP  COMMENT '业务主键',
  `service_id` bigint(20) NOT NULL COMMENT '业务主键',
  `service_type` int(2) NOT NULL COMMENT '业务类型',
  `file_type` varchar(20) NOT NULL COMMENT '文件类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT '文件信息';

CREATE TABLE IF NOT EXISTS `sys_notice`
(
  id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  url VARCHAR(200) DEFAULT NULL COMMENT '详情地址',
  content VARCHAR(200) DEFAULT NULL COMMENT '概要',
  server_id BIGINT(20) DEFAULT NULL COMMENT '业务关联ID',
  notice_status INT(2) DEFAULT 0 COMMENT '通知状态',
  view_type INT(1) DEFAULT 0 COMMENT '查看状态:0未查看,1已查看',
  server_name VARCHAR(200) DEFAULT NULL COMMENT '通知业务名称',
  receive_id BIGINT(20) DEFAULT 0 COMMENT '被通知人ID,0指所有人',
  notice_time TIMESTAMP COMMENT '通知时间',
  view_type int(1) DEFAULT '0' COMMENT '查看状态:0未看,1已看',
  notice_state int(2) DEFAULT NULL COMMENT '通知状态',
  creator BIGINT(20) NOT NULL COMMENT '创建人',
  creat_time TIMESTAMP COMMENT '创建事件',

  PRIMARY KEY id(id),
  KEY serverId(server_id),
  KEY receiveId(receive_id)
) ENGINE = InnoDB AUTO_INCREMENT = 0 CHARSET = UTF8 COMMENT '通知公告';