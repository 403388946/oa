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


CREATE TABLE IF NOT EXISTS `oa_employee_pic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `path` varchar(255) NOT NULL COMMENT '图片路径',
  `local_name` varchar(255) DEFAULT NULL COMMENT '本地文件名称',
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实名称',
  `pic_size` bigint(20) DEFAULT '0' COMMENT '大小',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;