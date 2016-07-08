/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : localhost
 Source Database       : ERP

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : utf-8

 Date: 06/29/2016 10:52:04 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `AREA`
-- ----------------------------
DROP TABLE IF EXISTS `AREA`;
CREATE TABLE `AREA` (
  `AREA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATED` date NOT NULL,
  `CREATER` int(11) DEFAULT NULL,
  `LASTMOD` date DEFAULT NULL,
  `MODIFYER` int(11) DEFAULT NULL,
  `NAME` varchar(200) NOT NULL,
  `PID` int(11) DEFAULT NULL,
  `STATUS` varchar(1) NOT NULL,
  PRIMARY KEY (`AREA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `BRAND`
-- ----------------------------
DROP TABLE IF EXISTS `BRAND`;
CREATE TABLE `BRAND` (
  `BRAND_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌编码',
  `NAME` varchar(200) DEFAULT NULL COMMENT '品牌名称',
  `CREATED` date DEFAULT NULL COMMENT '创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '最后修改时间',
  `STATUS` char(1) DEFAULT 'A' COMMENT '状态',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`BRAND_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='品牌资料';

-- ----------------------------
--  Records of `BRAND`
-- ----------------------------
BEGIN;
INSERT INTO `BRAND` VALUES ('1', '公司A', '2013-06-27', '2013-06-27', 'A', '1', '1'), ('2', '公司B', '2013-06-27', '2013-06-27', 'A', '1', '1'), ('3', '公司C', '2016-06-25', '2016-06-25', 'A', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `CITY`
-- ----------------------------
DROP TABLE IF EXISTS `CITY`;
CREATE TABLE `CITY` (
  `CITY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROVINCE_ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `CREATED` date NOT NULL,
  `LASTMOD` date DEFAULT NULL,
  `STATUS` char(1) NOT NULL DEFAULT 'A',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`CITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='城市资料';

-- ----------------------------
--  Records of `CITY`
-- ----------------------------
BEGIN;
INSERT INTO `CITY` VALUES ('1', '1', '苏州', '2013-06-25', '2013-06-25', 'A', '1', '1'), ('2', '1', '昆山', '2013-06-25', '2013-06-25', 'A', '1', '1'), ('3', '2', '温州', '2013-06-25', '2013-06-25', 'A', '1', '1'), ('4', '3', '广州', '2016-06-26', '2016-06-26', 'A', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `CURRENCY`
-- ----------------------------
DROP TABLE IF EXISTS `CURRENCY`;
CREATE TABLE `CURRENCY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(55) NOT NULL,
  `CREATED` date DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` date DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  `SIGN` varchar(55) DEFAULT NULL,
  `CODE` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `CURRENCY`
-- ----------------------------
BEGIN;
INSERT INTO `CURRENCY` VALUES ('1', '人民币', '2013-06-25', '2013-06-25', '1', '1', '1', '￥'), ('2', '美元', '2013-06-25', '2013-06-25', '1', '1', '1', '$');
COMMIT;

-- ----------------------------
--  Table structure for `CUSTOMER`
-- ----------------------------
DROP TABLE IF EXISTS `CUSTOMER`;
CREATE TABLE `CUSTOMER` (
  `CUSTOMER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) NOT NULL,
  `MYID` varchar(55) DEFAULT NULL,
  `STATUS` char(1) NOT NULL DEFAULT 'A' COMMENT 'A:正常,I:删除',
  `CREATED` date NOT NULL,
  `LASTMOD` date DEFAULT NULL,
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFIYER` int(10) DEFAULT NULL COMMENT '修改人',
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '客户类型',
  `TEL` varchar(55) DEFAULT NULL,
  `FAX` varchar(55) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `EMAIL` varchar(200) DEFAULT NULL,
  `AREA_ID` int(11) DEFAULT NULL COMMENT '区域编码',
  `AREA_NAME` varchar(100) DEFAULT NULL COMMENT '区域名称',
  `PROVINCE_ID` int(11) DEFAULT NULL COMMENT '省份编码',
  `PROVINCE_NAME` varchar(55) DEFAULT NULL COMMENT '省份名称',
  `CITY_ID` int(11) DEFAULT NULL COMMENT '城市编码',
  `CITY_NAME` varchar(55) DEFAULT NULL COMMENT '城市名称',
  `ADDRESS` varchar(1000) DEFAULT NULL,
  `ZIP` varchar(20) DEFAULT NULL,
  `LEVEL_ID` int(11) DEFAULT NULL COMMENT '客户等级编码',
  `LEVEL_NAME` varchar(200) DEFAULT NULL COMMENT '客户等级名称',
  `PRICE_LEVEL` int(11) DEFAULT NULL COMMENT '价格等级',
  `CONTACT_PERIOD` int(11) DEFAULT NULL COMMENT '联系周期',
  `SOURCE_ID` int(11) DEFAULT NULL COMMENT '客户来源编码',
  `SOURCE_NAME` varchar(200) DEFAULT NULL COMMENT '客户来源名称',
  `NATURE_ID` int(11) DEFAULT NULL COMMENT '客户公司性质编码',
  `NATURE_NAME` varchar(200) DEFAULT NULL COMMENT '客户公司性质名称',
  `INDUSTRY_ID` int(11) DEFAULT NULL COMMENT '行业编码',
  `INDUSTRY_NAME` varchar(200) DEFAULT NULL COMMENT '行业名称',
  `MAIN_BUSINESS` varchar(1000) DEFAULT NULL COMMENT '主业务业',
  `SIZE_ID` int(11) DEFAULT NULL COMMENT '公司规模编码',
  `SIZE_NAME` varchar(200) DEFAULT NULL COMMENT '公司规模',
  `SETUP_DATE` datetime DEFAULT NULL COMMENT '开业年份',
  `CAPITAL` int(11) DEFAULT NULL COMMENT '注册资金',
  `CORPORATION` varchar(55) DEFAULT NULL COMMENT '法人',
  `CREDIT_ID` int(11) DEFAULT NULL COMMENT '信用编码',
  `CREDIT_NAME` varchar(55) DEFAULT NULL COMMENT '信用名称',
  `BANK` varchar(200) DEFAULT NULL,
  `ACCOUNT` varchar(55) DEFAULT NULL,
  `TAXNO` varchar(100) DEFAULT NULL COMMENT '税号',
  `SHARED` varchar(200) DEFAULT NULL COMMENT '共享人(以逗号分隔)',
  `PID` int(11) DEFAULT NULL COMMENT '客户父项(不用)',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '描述',
  `SALE_ID` int(11) DEFAULT NULL COMMENT '销售编码',
  `SALE_NAME` varchar(55) DEFAULT NULL COMMENT '销售名称',
  `SALE_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '销售组织编码',
  `SALE_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '销售组织名称',
  `CUSTOMER_STATUS` char(1) DEFAULT NULL COMMENT '客户状态 T:交易中，S:禁用',
  `CLASS_NAME` varchar(200) DEFAULT NULL COMMENT '客户类型名称',
  `EMP_COUNT` int(11) DEFAULT NULL,
  `TAX` int(11) DEFAULT NULL COMMENT '税率',
  `SETUP_ACCOUNT` int(11) DEFAULT NULL COMMENT '立帐方式 1:出库立账,2:开票立帐,3:不立账(不用)',
  `CURRENCY_ID` int(11) DEFAULT NULL COMMENT '币别编码',
  `CURRENCY_NAME` varchar(55) DEFAULT NULL,
  `TOTAL_SALES` varchar(55) DEFAULT NULL,
  `DEDUCTION_TAX` char(1) DEFAULT NULL COMMENT '1:不含税，2:含税',
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='客户资料';

-- ----------------------------
--  Records of `CUSTOMER`
-- ----------------------------
BEGIN;
INSERT INTO `CUSTOMER` VALUES ('21', '家乐福小王', '100001', 'A', '2013-06-26', '2016-06-26', '1', '1', '1', '008-008-008', '', 'www.sina.com', 'www@163.com', null, null, null, null, '1', '苏州', '', null, '1', '一般客户', null, null, null, null, '17', '国有企业', null, '', '', '24', '1-50人', null, '50000000', '', '28', '高', '', '1111111', '', null, null, null, '', '23', 'test', null, null, 'T', '潜在客户', '23', '5', null, '1', '人民币', '22', 'Y'), ('22', '12312', '3123123', 'I', '2013-06-26', '2016-06-26', '1', '1', '10', '123', '123', '', '', null, null, null, null, '2', '昆山', '123', null, '21', '重要客户', null, null, null, null, null, '', null, '', '', null, '', null, null, '123123213', null, '', '', '', '', null, null, null, '123', null, null, null, null, null, '潜在客户', null, null, null, null, '', '', 'Y'), ('23', '123123123', '123123', 'I', '2013-06-26', '2016-06-26', '1', '1', null, '', '', '', '', null, null, null, null, null, '', '', null, null, '', null, null, null, null, null, '', null, '', '', null, '', null, null, '', null, '', '', '', '', null, null, null, '', null, null, null, null, null, '', null, null, null, null, '', '', 'Y'), ('24', 'test', '1001', 'A', '2013-06-26', '2013-06-26', '1', '1', null, '', '', '', '', null, null, null, null, null, '', '', null, '20', '一般客户', null, null, null, null, null, '', null, '', '', null, '', null, null, '', null, '', '', '', '', null, null, null, '', '23', 'test', null, null, 'T', '', null, null, null, null, '', '', 'Y'), ('25', '12312', '3123123', 'I', '2013-06-26', '2016-06-26', '1', '1', null, '', '', '', '', null, null, null, null, null, '', '', null, null, '', null, null, null, null, null, '', null, '', '', null, '', null, null, '', null, '', '', '', '', null, null, null, '', null, '', null, null, 'T', '', null, null, null, null, '', '', 'Y'), ('26', '123', '123', 'I', '2013-06-27', '2016-06-26', '1', '1', null, '', '', '', '', null, null, null, null, null, '', '', null, null, '', null, null, null, null, null, '', null, '', '', null, '', null, null, '', null, '', '', '', '', null, null, null, '', null, '', null, null, 'T', '', null, null, null, null, '', '', 'Y'), ('27', '超市A', '003', 'A', '2016-06-27', '2016-06-27', '1', '1', null, '', '', '', '', null, null, null, null, null, '', '', null, null, '', null, null, null, null, null, '', null, '', '', null, '', null, null, '', null, '', '', '', '', null, null, null, '', null, '', null, null, 'T', '', null, null, null, null, '', '', 'Y');
COMMIT;

-- ----------------------------
--  Table structure for `CUSTOMER_CONTACT`
-- ----------------------------
DROP TABLE IF EXISTS `CUSTOMER_CONTACT`;
CREATE TABLE `CUSTOMER_CONTACT` (
  `CONTACT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户联系人编码',
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `NAME` varchar(55) NOT NULL COMMENT '联系人',
  `CLASS_NAME` varchar(255) DEFAULT NULL COMMENT '类别名称',
  `SEX_NAME` varchar(10) DEFAULT NULL COMMENT '性别名称',
  `ORGANIZATION` varchar(255) DEFAULT NULL COMMENT '部门',
  `DUTY` varchar(255) DEFAULT NULL COMMENT '职务',
  `TEL` varchar(55) DEFAULT NULL COMMENT '电话 ',
  `EMAIL` varchar(255) DEFAULT NULL COMMENT '邮件',
  `MOBILE` varchar(20) DEFAULT NULL COMMENT '手机',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `CREATED` date DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` date DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  `FAX` varchar(55) DEFAULT NULL COMMENT '传真',
  `QQ` varchar(25) DEFAULT NULL COMMENT 'QQ',
  `BIRTHDAY` date DEFAULT NULL COMMENT '生日',
  PRIMARY KEY (`CONTACT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `CUSTOMER_CONTACT`
-- ----------------------------
BEGIN;
INSERT INTO `CUSTOMER_CONTACT` VALUES ('3', '21', '李小姐', null, 'M', null, '', '2222', '111@163.com', null, '', 'A', '2013-06-26', '2013-06-26', '1', '1', null, '', '2013-06-26'), ('4', '27', '小张', null, 'M', null, '', '', '', null, '', 'A', '2016-06-27', '2016-06-27', '1', '1', null, '', null);
COMMIT;

-- ----------------------------
--  Table structure for `ITEM`
-- ----------------------------
DROP TABLE IF EXISTS `ITEM`;
CREATE TABLE `ITEM` (
  `ITEM_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '商品自编码',
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `CLASS_NAME` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `SPEC` varchar(255) DEFAULT NULL COMMENT '规格',
  `AMOUNT` int(10) unsigned DEFAULT NULL,
  `UNIT` varchar(55) DEFAULT NULL COMMENT '单位',
  `PACKAGE_UNIT` varchar(55) DEFAULT NULL COMMENT '包装单位',
  `CONVERTS` int(11) DEFAULT NULL COMMENT '转换',
  `OLD_MYID` varchar(55) DEFAULT NULL COMMENT '原系统编码',
  `TAX_NO` int(11) DEFAULT NULL COMMENT '税率',
  `IS_BATCH` char(1) DEFAULT NULL COMMENT 'Y:有批次管理，N:无批次管理',
  `IS_VALID` char(1) DEFAULT NULL COMMENT 'Y:有效期管理，N:无有效期管理',
  `COST` double(18,8) unsigned DEFAULT NULL COMMENT '参考成本',
  `RETAIL_PRICE` double(18,8) unsigned DEFAULT NULL COMMENT '零售价',
  `SALE_PRICE` double(18,8) unsigned DEFAULT NULL COMMENT '销售价',
  `BRAND_ID` int(11) DEFAULT NULL COMMENT '品牌编码',
  `BRAND_NAME` varchar(55) DEFAULT NULL COMMENT '品牌名称',
  `CITY_ID` int(11) DEFAULT NULL COMMENT '产地编码',
  `CITY_NAME` varchar(55) DEFAULT NULL COMMENT '产地名称',
  `QUALITY_PERIOD` varchar(55) DEFAULT NULL COMMENT '保质期',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT '备注',
  `CREATED` date DEFAULT NULL,
  `LASTMOD` date DEFAULT NULL,
  `STATUS` char(1) DEFAULT 'A',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  `BARCODE` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`ITEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ITEM`
-- ----------------------------
BEGIN;
INSERT INTO `ITEM` VALUES ('1', '004', '葡萄干', '潜在客户', '', '600', '斤', '袋', '1', null, null, 'Y', 'Y', null, null, null, '1', '公司A', '2', '昆山', null, '', '2013-06-27', '2016-06-27', 'A', '1', '1', ''), ('5', '001', '花生牛奶001', '经销商', '', '90', '盒', '', null, null, null, 'Y', 'Y', '8.00000000', '12.00000000', null, null, '', '3', '温州', null, '', '2013-07-02', '2016-06-27', 'A', '1', '1', ''), ('6', '002', '花生牛奶002', '潜在客户', '', '80', '盒', '', null, null, null, 'Y', 'Y', '0.00000000', '12.00000000', null, null, '', null, '', null, '', '2013-07-02', '2016-06-27', 'A', '1', '1', ''), ('7', '003', '花生牛奶003', '潜在客户', '', '30', '盒', '', null, null, null, 'Y', 'Y', '23.69000000', '12.00000000', null, null, '', null, '', null, '', '2013-07-02', '2016-06-27', 'A', '1', '1', '');
COMMIT;

-- ----------------------------
--  Table structure for `LOG`
-- ----------------------------
DROP TABLE IF EXISTS `LOG`;
CREATE TABLE `LOG` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志自动生成ID',
  `USER_ID` int(11) DEFAULT NULL COMMENT '操作用户ID',
  `NAME` varchar(20) DEFAULT NULL COMMENT '操作用户名称',
  `LOG_DATE` datetime DEFAULT NULL COMMENT '日志生成时间',
  `TYPE` int(10) DEFAULT NULL COMMENT '日志类型: 1：安全日志 2：表示操作日志',
  `MAC` varchar(20) DEFAULT NULL COMMENT '物理地址',
  `IP` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `OBJECT_TYPE` int(1) DEFAULT NULL COMMENT '对象类型 ',
  `OBJECT_ID` varchar(100) DEFAULT NULL COMMENT '操作事件写入权限编码，系统事件写入系统编码',
  `EVENT_NAME` varchar(100) DEFAULT NULL COMMENT '事件名称',
  `EVENT_RECORD` varchar(500) DEFAULT NULL COMMENT '详细描述',
  PRIMARY KEY (`LOG_ID`),
  KEY `FK_LOG1` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='日录资料表';

-- ----------------------------
--  Records of `LOG`
-- ----------------------------
BEGIN;
INSERT INTO `LOG` VALUES ('3', null, 'system', '2016-06-29 10:47:00', '1', '**************', '**************', null, 'dbBackUp-20160629104700.sql', '数据备份', '/Users/zhuzirui/Downloads/erp-master/src/main/webapp/attachment/dbBackUp/dbBackUp-20160629104700.sql');
COMMIT;

-- ----------------------------
--  Table structure for `ORDER_PURCHASE`
-- ----------------------------
DROP TABLE IF EXISTS `ORDER_PURCHASE`;
CREATE TABLE `ORDER_PURCHASE` (
  `ORDER_PURCHASE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MYID` varchar(55) DEFAULT NULL,
  `SETUP_DATE` datetime DEFAULT NULL,
  `WAREHOUSE_ID` int(11) DEFAULT NULL,
  `SUPLIER_ID` int(11) DEFAULT NULL COMMENT '供应商编码',
  `SUPLIER_NAME` varchar(200) DEFAULT NULL COMMENT '供应商名称',
  `SUPLIER_MYID` varchar(55) DEFAULT NULL COMMENT '供应商自编码',
  `SUPLIER_ADDRESS` varchar(200) DEFAULT NULL,
  `SUPLIER_CONTACT` varchar(55) DEFAULT NULL,
  `SUPLIER_TEL` varchar(55) DEFAULT NULL COMMENT '公司电话',
  `CONTACT_MOBILE` varchar(20) DEFAULT NULL COMMENT '联系人手机',
  `CONTACT_TEL` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `CONTACT_FAX` varchar(20) DEFAULT NULL COMMENT '联系人传真',
  `DELIVERY_MODE` int(11) DEFAULT NULL,
  `DELIVERY_MODE_NAME` varchar(55) DEFAULT NULL,
  `ESTIMATED_DELIVERY` datetime DEFAULT NULL COMMENT '预计交货日期',
  `DELIVERY_ADDRESS` varchar(300) DEFAULT NULL,
  `ORDER_DESC` varchar(1000) DEFAULT NULL,
  `PAY_MODE` int(11) DEFAULT NULL,
  `ISINVOICE` int(2) DEFAULT NULL COMMENT '是否开票 1:是，2:否',
  `BUYER_ID` int(11) DEFAULT NULL COMMENT '供应商编码',
  `BUYER_NAME` varchar(55) DEFAULT NULL COMMENT '供应商名称',
  `BUYER_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '供应商组织编码',
  `BUYER_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '供应商组织名称',
  `WAREHOUSE_NAME` varchar(200) DEFAULT NULL,
  `ENTER_ID` int(11) DEFAULT NULL COMMENT '录入人编码',
  `ENTER_NAME` varchar(55) DEFAULT NULL COMMENT '录入人名称',
  `ENTER_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '录入人组织编码',
  `ENTER_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '录入人组织名称',
  `ENTER_DATE` datetime DEFAULT NULL COMMENT '录入日期',
  `AUDITE_ID` int(11) DEFAULT NULL COMMENT '审核人编码',
  `AUDITE_NAME` varchar(55) DEFAULT NULL COMMENT '审核人名称',
  `AUDITE_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '审核人组织编码',
  `AUDITE_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '审核人组织名称',
  `AUDITE_DATE` datetime DEFAULT NULL COMMENT '审核日期',
  `AUDITE_STATUS` char(1) DEFAULT NULL COMMENT '审核状态',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `SOURCE_OBJECT` int(11) DEFAULT NULL COMMENT '来源对像 1:请购单',
  `OBJECT_ID` int(11) DEFAULT NULL COMMENT '对象编码',
  `PRINT_COUNT` int(11) DEFAULT NULL COMMENT '打印次数',
  `BATCH_ID` int(11) DEFAULT NULL COMMENT '暂时不填',
  `BATCH_NO` varchar(255) DEFAULT NULL COMMENT '批号',
  `DEDUCTION_TAX` char(1) DEFAULT NULL COMMENT '1:不含税，2:含税',
  `SUPLIER_ORDER_NO` varchar(100) DEFAULT NULL,
  `AMOUNT` double(18,8) DEFAULT '0.00000000',
  `TAX_AMOUNT` double(18,8) DEFAULT '0.00000000',
  `TOTAL_AMOUNT` double(18,8) DEFAULT '0.00000000',
  `ADVANCE_PAYMENT` double(18,8) DEFAULT '0.00000000',
  `CREATED` datetime DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` datetime DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  `ORDER_STATUS` char(1) DEFAULT NULL,
  `CURRENCY_ID` int(11) DEFAULT NULL,
  `CURRENCY_NAME` varchar(55) DEFAULT NULL,
  `IsONGOING` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ORDER_PURCHASE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ORDER_PURCHASE`
-- ----------------------------
BEGIN;
INSERT INTO `ORDER_PURCHASE` VALUES ('10', 'KS-001', '2016-06-28 00:00:00', '1', '2', 'taste', '1', null, '供应商A小王', '', null, null, null, null, '物流公司', '2013-07-03 00:00:00', null, null, null, null, null, null, '4', '执行小组A', '物流仓', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '', 'Y', '001', '5160.00000000', '877.20000000', '6037.20000000', null, '2013-07-03 12:22:50', '2016-06-28 00:46:36', 'A', '1', '1', null, '1', '人民币', 'Y');
COMMIT;

-- ----------------------------
--  Table structure for `ORDER_PURCHASE_LINE`
-- ----------------------------
DROP TABLE IF EXISTS `ORDER_PURCHASE_LINE`;
CREATE TABLE `ORDER_PURCHASE_LINE` (
  `ORDER_PURCHASE_LID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_PURCHASE_ID` int(11) DEFAULT NULL COMMENT '询价单编码',
  `ITEM_ID` int(11) DEFAULT NULL COMMENT '商品编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '商品自编码',
  `ITEM_NAME` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `SPEC` varchar(200) DEFAULT NULL COMMENT '规格',
  `UNIT` varchar(55) DEFAULT NULL COMMENT '单位',
  `BRAND_ID` int(11) DEFAULT NULL COMMENT '品牌编码',
  `BRAND_NAME` varchar(200) DEFAULT NULL COMMENT '品牌名称',
  `ORDER_QTY` int(11) DEFAULT NULL COMMENT '请购数量',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '备注',
  `CREATED` datetime DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` datetime DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  `PRICE` double(18,8) DEFAULT '0.00000000',
  `TAX` double(18,8) DEFAULT '0.00000000',
  `PRICE_TAX` double(18,8) DEFAULT '0.00000000',
  `AMOUNT` double(18,8) DEFAULT '0.00000000',
  `TAX_AMOUNT` double(18,8) DEFAULT '0.00000000',
  `PRICE_TAX_AMOUNT` double(18,8) DEFAULT '0.00000000',
  `TAX_NO` int(11) DEFAULT '0',
  `FACT_QTY` int(11) DEFAULT '0',
  `DISCOUNT_NO` double(18,8) DEFAULT '0.00000000',
  PRIMARY KEY (`ORDER_PURCHASE_LID`),
  KEY `FK_ORDER_PURCHASE_LINE` (`ORDER_PURCHASE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='询价明细资料';

-- ----------------------------
--  Records of `ORDER_PURCHASE_LINE`
-- ----------------------------
BEGIN;
INSERT INTO `ORDER_PURCHASE_LINE` VALUES ('77', '10', '5', '001', '花生牛奶001', null, '盒', null, null, '500', null, '2013-07-03 12:22:50', '2016-06-27 13:46:22', 'A', '1', '1', '6.00000000', '0.00000000', null, '2100.00000000', '357.00000000', null, '17', null, '0.70000000'), ('78', '10', '6', '002', '花生牛奶002', null, '盒', null, null, '500', null, '2013-07-03 12:22:50', '2016-06-26 13:15:35', 'A', '1', '1', '6.00000000', '0.00000000', null, '1500.00000000', '255.00000000', null, '17', null, '0.50000000'), ('79', '10', '7', '003', '花生牛奶003', null, '盒', null, null, '300', null, '2013-07-03 12:22:50', '2016-06-26 13:15:35', 'A', '1', '1', '6.50000000', '0.00000000', null, '1560.00000000', '265.20000000', null, '17', null, '0.80000000');
COMMIT;

-- ----------------------------
--  Table structure for `ORDER_SALE`
-- ----------------------------
DROP TABLE IF EXISTS `ORDER_SALE`;
CREATE TABLE `ORDER_SALE` (
  `ORDER_SALE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MYID` varchar(55) DEFAULT NULL,
  `SETUP_DATE` date DEFAULT NULL,
  `SETUP_ACCOUNT` int(11) DEFAULT NULL,
  `WAREHOUSE_ID` int(11) DEFAULT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL COMMENT '客户编码',
  `CUSTOMER_NAME` varchar(200) DEFAULT NULL COMMENT '客户名称',
  `CUSTOMER_MYID` varchar(55) DEFAULT NULL COMMENT '客户自编码',
  `CUSTOMER_ADDRESS` varchar(200) DEFAULT NULL,
  `CUSTOMER_CONTACT` varchar(55) DEFAULT NULL,
  `CUSTOMER_TEL` varchar(55) DEFAULT NULL COMMENT '公司电话',
  `CONTACT_MOBILE` varchar(20) DEFAULT NULL COMMENT '联系人手机',
  `CONTACT_TEL` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `CONTACT_FAX` varchar(20) DEFAULT NULL COMMENT '联系人传真',
  `DELIVERY_MODE` int(11) DEFAULT NULL,
  `DELIVERY_MODE_NAME` varchar(55) DEFAULT NULL,
  `ESTIMATED_DELIVERY` date DEFAULT NULL COMMENT '预计交货日期',
  `DELIVERY_ADDRESS` varchar(300) DEFAULT NULL,
  `ORDER_DESC` varchar(1000) DEFAULT NULL,
  `PAY_MODE` int(11) DEFAULT NULL,
  `ISINVOICE` int(2) DEFAULT NULL COMMENT '是否开票 1:是，2:否',
  `SALE_ID` int(11) DEFAULT NULL COMMENT '供应商编码',
  `SALE_NAME` varchar(55) DEFAULT NULL COMMENT '供应商名称',
  `SALE_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '客户组织编码',
  `SALE_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '客户组织名称',
  `WAREHOUSE_NAME` varchar(200) DEFAULT NULL,
  `ENTER_ID` int(11) DEFAULT NULL COMMENT '录入人编码',
  `ENTER_NAME` varchar(55) DEFAULT NULL COMMENT '录入人名称',
  `ENTER_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '录入人组织编码',
  `ENTER_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '录入人组织名称',
  `ENTER_DATE` date DEFAULT NULL COMMENT '录入日期',
  `AUDITE_ID` int(11) DEFAULT NULL COMMENT '审核人编码',
  `AUDITE_NAME` varchar(55) DEFAULT NULL COMMENT '审核人名称',
  `AUDITE_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '审核人组织编码',
  `AUDITE_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '审核人组织名称',
  `AUDITE_DATE` date DEFAULT NULL COMMENT '审核日期',
  `AUDITE_STATUS` char(1) DEFAULT NULL COMMENT '审核状态',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `SOURCE_OBJECT` int(11) DEFAULT NULL COMMENT '来源对像 1:请购单',
  `OBJECT_ID` int(11) DEFAULT NULL COMMENT '对象编码',
  `PRINT_COUNT` int(11) DEFAULT NULL COMMENT '打印次数',
  `BATCH_ID` int(11) DEFAULT NULL COMMENT '暂时不填',
  `BATCH_NO` varchar(255) DEFAULT NULL COMMENT '批号',
  `DEDUCTION_TAX` char(1) DEFAULT NULL COMMENT '1:不含税，2:含税',
  `CUSTOMER_ORDER_NO` varchar(100) DEFAULT NULL,
  `AMOUNT` double(18,8) DEFAULT '0.00000000',
  `TAX_AMOUNT` double(18,8) DEFAULT '0.00000000',
  `TOTAL_AMOUNT` double(18,8) DEFAULT '0.00000000',
  `ADVANCE_PAYMENT` double(18,8) DEFAULT '0.00000000',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  `ORDER_STATUS` char(1) DEFAULT NULL,
  `CURRENCY_ID` int(11) DEFAULT NULL,
  `CURRENCY_NAME` varchar(55) DEFAULT NULL,
  `IsONGOING` varchar(255) DEFAULT NULL,
  `CLASS_NAME` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`ORDER_SALE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ORDER_SALE`
-- ----------------------------
BEGIN;
INSERT INTO `ORDER_SALE` VALUES ('3', '001', '2016-06-27', null, '1', '21', '家乐福小王', '100001', null, '李小姐', '2222', null, null, null, null, '客户自提', '2013-07-09', null, null, null, null, '123', '', null, '', '物流仓', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', 'Y', '', '960.00000000', '163.20000000', '1123.20000000', '0.00000000', '2013-07-09', '2016-06-27', 'A', '1', '1', null, '1', '人民币', 'Y', null), ('4', '002', '2016-06-14', null, '1', '21', '家乐福小王', '100001', null, '李小姐', '2222', null, null, null, null, '', '2016-06-27', null, null, null, null, null, '', null, '', '物流仓', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', 'Y', '', '1700.00000000', '0.00000000', '1700.00000000', '0.00000000', '2016-06-27', '2016-06-28', 'A', '1', '1', null, null, '', 'Y', null);
COMMIT;

-- ----------------------------
--  Table structure for `ORDER_SALE_LINE`
-- ----------------------------
DROP TABLE IF EXISTS `ORDER_SALE_LINE`;
CREATE TABLE `ORDER_SALE_LINE` (
  `ORDER_SALE_LID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_SALE_ID` int(11) DEFAULT NULL COMMENT '询价单编码',
  `ITEM_ID` int(11) DEFAULT NULL COMMENT '商品编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '商品自编码',
  `ITEM_NAME` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `SPEC` varchar(200) DEFAULT NULL COMMENT '规格',
  `AMOUNT` double(18,8) DEFAULT '0.00000000',
  `UNIT` varchar(55) DEFAULT NULL COMMENT '单位',
  `BRAND_ID` int(11) DEFAULT NULL COMMENT '品牌编码',
  `BRAND_NAME` varchar(200) DEFAULT NULL COMMENT '品牌名称',
  `ORDER_QTY` int(11) DEFAULT NULL COMMENT '请购数量',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '备注',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  `PRICE` double(18,8) DEFAULT '0.00000000',
  `TAX` double(18,8) DEFAULT '0.00000000',
  `PRICE_TAX` double(18,8) DEFAULT '0.00000000',
  `TAX_AMOUNT` double(18,8) DEFAULT '0.00000000',
  `PRICE_TAX_AMOUNT` double(18,8) DEFAULT '0.00000000',
  `TAX_NO` int(11) DEFAULT '0',
  `FACT_QTY` int(11) DEFAULT '0',
  `DISCOUNT_NO` double(18,8) DEFAULT '0.00000000',
  PRIMARY KEY (`ORDER_SALE_LID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='询价明细资料';

-- ----------------------------
--  Records of `ORDER_SALE_LINE`
-- ----------------------------
BEGIN;
INSERT INTO `ORDER_SALE_LINE` VALUES ('1', '3', '5', '001', '花生牛奶001', null, '320.00000000', '盒', null, null, '50', null, '2013-07-09', '2016-06-26', 'A', '1', '1', '8.00000000', '0.00000000', '0.00000000', '54.40000000', '0.00000000', '17', '0', '0.80000000'), ('2', '3', '6', '002', '花生牛奶002', null, '640.00000000', '盒', null, null, '80', null, '2013-07-09', '2016-06-26', 'A', '1', '1', '8.00000000', '0.00000000', '0.00000000', '108.80000000', '0.00000000', '17', '0', '0.00000000'), ('4', '4', null, '001', '康师傅冰红茶', null, '900.00000000', '瓶', null, null, '300', null, '2016-06-27', '2016-06-27', 'A', '1', '1', '3.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0', '0', '1.00000000'), ('5', '4', null, '002', '王老吉', null, '800.00000000', '瓶', null, null, '200', null, '2016-06-27', '2016-06-27', 'A', '1', '1', '5.00000000', '0.00000000', '0.00000000', '0.00000000', '0.00000000', '0', '0', '0.80000000');
COMMIT;

-- ----------------------------
--  Table structure for `ORGANIZATION`
-- ----------------------------
DROP TABLE IF EXISTS `ORGANIZATION`;
CREATE TABLE `ORGANIZATION` (
  `ORGANIZATION_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '组织机构自动ID',
  `COMPANY_ID` int(11) DEFAULT NULL COMMENT '从属公司ID',
  `MYID` varchar(25) DEFAULT NULL COMMENT '组织自编码',
  `PID` int(10) DEFAULT NULL COMMENT '父组织ID',
  `FULL_NAME` varchar(255) DEFAULT NULL COMMENT '组织名称',
  `ENAME` varchar(100) DEFAULT NULL COMMENT '英文名称',
  `MANAGER` int(10) DEFAULT NULL COMMENT '主负责人',
  `ICONCLS` varchar(100) DEFAULT NULL COMMENT '图标',
  `STATE` varchar(20) DEFAULT NULL,
  `ASSISTANT_MANAGER` int(10) DEFAULT NULL COMMENT '副负责人',
  `EMP_QTY` int(10) DEFAULT NULL COMMENT '编制人员数',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `CREATED` date DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` date DEFAULT NULL COMMENT '修改日期',
  `SHORT_NAME` varchar(50) DEFAULT NULL COMMENT '简称',
  `TEL` varchar(50) DEFAULT NULL COMMENT '电话',
  `FAX` varchar(50) DEFAULT NULL COMMENT '传真',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ORGANIZATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='组织部门资料表';

-- ----------------------------
--  Records of `ORGANIZATION`
-- ----------------------------
BEGIN;
INSERT INTO `ORGANIZATION` VALUES ('1', null, '1', null, '总经理室', '', null, 'icon-pro', 'closed', null, null, 'A', '2013-05-27', '2016-06-25', '', '', '', '行政管理', '1', '1'), ('2', null, '100101', '1', 'MIS', 'mis', null, 'icon-undo', 'closed', null, null, 'A', '2013-05-27', '2016-06-26', 'm', '', '', '', '1', '1'), ('3', null, '78545', '1', 'liter', '', null, 'icon-sys', 'closed', null, null, 'I', null, '2013-06-18', '', '123', '123', '', '1', '1'), ('4', null, '234', '5', '执行小组A', '', null, 'icon-end', 'closed', null, null, 'A', '2013-05-28', '2016-06-26', 'GroupA', '123', '', 'test', '1', '1'), ('5', null, '2', null, '执行部', '', null, 'icon-tip', 'closed', null, null, 'A', '2013-06-14', '2016-06-25', '', '', '', '库存管理操作与执行', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `PERMISSION`
-- ----------------------------
DROP TABLE IF EXISTS `PERMISSION`;
CREATE TABLE `PERMISSION` (
  `PERMISSION_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限代码',
  `PID` int(11) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `PNAME` varchar(100) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MYID` varchar(55) DEFAULT NULL,
  `TYPE` char(1) DEFAULT NULL COMMENT 'F:FUNCTION,O:OPERATION',
  `ISUSED` char(1) DEFAULT NULL COMMENT 'Y,N',
  `STATE` varchar(20) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL COMMENT '链接地址',
  `ICONCLS` varchar(100) DEFAULT NULL COMMENT '功能模块',
  `STATUS` char(1) NOT NULL COMMENT '状态',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `CREATED` datetime NOT NULL COMMENT '创造日期',
  `LASTMOD` datetime DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`PERMISSION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='权限资料表';

-- ----------------------------
--  Records of `PERMISSION`
-- ----------------------------
BEGIN;
INSERT INTO `PERMISSION` VALUES ('1', null, '系统管理', '', '0', 'sysMgr', 'F', 'Y', 'closed', 'javascript:void(0);', 'icon-sys', 'A', '系统管理', '2013-05-23 00:00:00', '2013-06-18 00:00:00', '1', '1'), ('2', '1', '程式管理', '系统管理', '0', 'funMgr', 'F', 'Y', 'closed', 'jsp/function/functionMain.jsp', 'icon-pro', 'A', '程式管理', '2013-05-23 00:00:00', '2013-05-27 00:00:00', '1', '1'), ('3', null, '公司管理', '', '0', 'compMgr', 'F', 'N', 'closed', 'javascript:void(0);', 'icon-comp', 'A', '公司管理', '2013-05-23 00:00:00', '2013-06-20 15:33:13', '1', '1'), ('6', null, '库存管理', '', '1', 'itemMgr', 'F', 'Y', 'closed', 'javascript:void(0);', 'icon-item', 'A', '', '2013-05-23 00:00:00', '2013-08-05 10:09:30', '1', '1'), ('7', '1', '权限分派', '系统管理', '3', 'funOMgr', 'F', 'Y', 'closed', 'jsp/permission/permissionAssignmentMain.jsp', 'icon-config', 'A', '菜单功能分派', '2013-05-23 00:00:00', '2013-06-22 09:15:57', '1', '1'), ('8', '6', '库存档案录入', '库存管理', '2', 'itemMain', 'F', 'Y', 'closed', 'jsp/itemManager/itemMain.jsp', 'icon-item', 'A', '', '2013-05-23 00:00:00', '2013-06-27 09:18:02', '1', '1'), ('10', '3', '公司档案录入', '公司管理', '0', 'compMain', 'F', 'Y', 'closed', 'jsp/company/companyMain.jsp', 'icon-edit', 'A', '公司维护页面', '2013-05-24 00:00:00', '2013-06-27 08:46:23', '1', '1'), ('11', '10', '公司新增', '公司管理', '1', 'compAdd', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-adds', 'A', '公司新增', '2013-05-24 00:00:00', '2013-05-27 00:00:00', '1', '1'), ('12', '10', '公司编辑', '公司管理', '2', 'compEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-edit', 'A', '公司编辑', '2013-05-24 00:00:00', '2013-05-27 00:00:00', '1', '1'), ('13', '10', '公司删除', '公司管理', '3', 'compDel', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-remove', 'A', '公司删除', '2013-05-24 00:00:00', '2013-06-14 00:00:00', '1', '1'), ('14', '10', '公司结束编辑', '公司管理', '4', 'compEndEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-cancel', 'I', '结束编辑', '2013-05-24 00:00:00', '2013-06-14 00:00:00', '1', '1'), ('15', '10', '公司保存', '公司管理', '5', 'compSave', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-save', 'I', '保存', '2013-05-24 00:00:00', '2013-06-14 00:00:00', '1', '1'), ('16', '2', '菜单功能新增', '系统管理', '4', 'funAdd', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-adds', 'A', '菜单功能新增', '2013-05-24 00:00:00', '2013-05-27 00:00:00', '1', '1'), ('17', '2', '菜单功能编辑', '系统管理', '5', 'funEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-edit', 'A', '菜单功能编辑', '2013-05-24 00:00:00', '2013-06-14 00:00:00', '1', '1'), ('18', '2', '菜单功能删除', '系统管理', '6', 'funDel', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-remove', 'A', '菜单功能删除', '2013-05-24 00:00:00', '2013-06-14 00:00:00', '1', '1'), ('19', '2', '菜单结束编辑', '系统管理', '7', 'funEndEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-cancel', 'I', '结束编辑', '2013-05-24 00:00:00', '2013-06-14 00:00:00', '1', '1'), ('20', '2', '菜单保存', '系统管理', '8', 'funSave', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-save', 'I', '保存', '2013-05-24 00:00:00', '2013-06-14 00:00:00', '1', '1'), ('21', '7', '权限分配保存', '系统管理', '9', 'perConfig', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-config', 'A', '权限分配保存', '2013-05-24 00:00:00', '2013-05-27 00:00:00', '1', '1'), ('22', '7', '角色新增', '系统管理', '10', 'roleAdd', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-role', 'A', '角色新增', '2013-05-27 00:00:00', '2013-05-27 00:00:00', '1', '1'), ('23', '7', '角色编辑', '系统管理', '11', 'roleEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-edit', 'A', '角色编辑', '2013-05-27 00:00:00', '2013-05-27 00:00:00', '1', '1'), ('24', '7', '角色删除', '系统管理', '12', 'roleDel', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-remove', 'A', '角色删除', '2013-05-27 00:00:00', '2013-05-27 00:00:00', '1', '1'), ('25', '7', '角色结束编辑', '系统管理', '13', 'roleEndEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-cancel', 'I', '角色结束编辑', '2013-05-27 00:00:00', '2013-06-14 00:00:00', '1', '1'), ('26', '7', '角色保存', '系统管理', '14', 'roleSave', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-save', 'I', '角色保存', '2013-05-27 00:00:00', '2013-06-14 00:00:00', '1', '1'), ('27', '1', '用户管理', '系统管理', '15', 'userMain', 'F', 'Y', 'closed', 'jsp/user/userMain.jsp', 'icon-adds', 'A', '用户管理', '2013-05-27 00:00:00', '2013-05-27 00:00:00', '1', '1'), ('28', '1', '用户角色分派', '系统管理', '16', 'userRoleMgr', 'F', 'Y', 'closed', 'jsp/roleConfig/roleConfigMain.jsp', 'icon-role', 'A', '用户角色分配', '2013-05-27 00:00:00', '2013-06-22 09:16:35', '1', '1'), ('29', '27', '用户新增', '用户管理', '16', 'userAdd', 'O', 'N', 'open', 'javascript:void(0);', 'icon-adds', 'A', '', '2013-05-27 00:00:00', '2016-06-26 13:27:07', '1', '1'), ('30', '27', '用户编辑', '系统管理', '17', 'userEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-edit', 'A', '', '2013-05-27 00:00:00', '2013-05-27 00:00:00', '1', '1'), ('31', '27', '用户删除', '系统管理', '18', 'userDel', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-cancel', 'A', '', '2013-05-27 00:00:00', '2013-05-27 00:00:00', '1', '1'), ('32', '27', '用户结束编辑', '系统管理', '19', 'userEndEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-end', 'I', '', '2013-05-27 00:00:00', '2013-06-14 00:00:00', '1', '1'), ('33', '27', '用户保存', '系统管理', '20', 'userSave', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-save', 'I', '', '2013-05-27 00:00:00', '2013-06-14 00:00:00', '1', '1'), ('34', '28', '用户角色分派', '系统管理', '21', 'userRoleConfig', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-config', 'A', '用户角色分派', '2013-05-29 00:00:00', '2013-05-29 00:00:00', '1', '1'), ('40', '1', '组织管理', '系统管理', '6', 'orgzMgr', 'F', 'Y', 'closed', 'jsp/organization/organizationMain.jsp', 'icon-tip', 'A', '组织管理', '2013-06-14 00:00:00', '2013-06-14 00:00:00', '1', '1'), ('41', '40', '组织增加', '组织管理', '0', 'orgzAdd', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-edit', 'A', '', '2013-06-14 00:00:00', '2013-06-14 00:00:00', '1', '1'), ('42', '40', '组织编辑', '组织管理', '1', 'orgzEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-edit', 'A', '', '2013-06-17 00:00:00', '2013-06-17 00:00:00', '1', '1'), ('43', '40', '组织删除', '组织管理', '2', 'orgzDel', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-remove', 'A', '', '2013-06-17 00:00:00', '2013-06-17 00:00:00', '1', '1'), ('44', '1', '日志管理', '系统管理', '45', 'logMgr', 'F', 'Y', 'closed', 'jsp/logs/logsMain.jsp', 'icon-pro', 'A', '日志管理', '2013-06-18 00:00:00', '2013-06-18 00:00:00', '1', '1'), ('47', '44', '日志新增', '日志管理', '1', 'logAdd', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-edit', 'A', '', '2013-06-18 00:00:00', '2013-06-18 00:00:00', '1', '1'), ('48', '44', '日志编辑', '日志管理', '2', 'logEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-remove', 'A', '', '2013-06-18 00:00:00', '2013-06-18 00:00:00', '1', '1'), ('49', '44', '日志删除', '日志管理', '3', 'logDel', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-cancel', 'A', '', '2013-06-18 00:00:00', '2013-06-18 00:00:00', '1', '1'), ('59', '1', '参数设置', '系统管理', '12', 'param', 'F', 'N', 'closed', 'jsp/sysParameter/sysParameterMain.jsp', 'icon-remove', 'A', '', '2013-06-21 12:14:27', '2016-06-26 13:25:31', '1', '1'), ('60', '59', '结束编辑', '参数设置', '1', 'parEndEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-end', 'A', '', '2013-06-22 09:23:01', '2013-06-22 09:23:01', '1', '1'), ('61', '59', '删除', '参数设置', '2', 'parDel', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-remove', 'A', '', '2013-06-22 09:23:47', '2013-06-22 09:24:23', '1', '1'), ('62', '59', '保存', '参数设置', '3', 'parSave', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-save', 'A', '', '2013-06-22 09:25:11', '2013-06-22 09:25:57', '1', '1'), ('63', '1', 'Bug管理', '系统管理', '9', 'bugMgr', 'F', 'N', 'closed', 'jsp/bugManager/bugMain.jsp', 'icon-bug', 'A', '', '2013-06-22 09:45:45', '2013-06-22 14:37:19', '1', '1'), ('64', '63', 'Bug新增', 'Bug管理', '9', 'bugAdd', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-badd', 'A', '', '2013-06-22 10:04:54', '2016-06-26 13:27:38', '1', '1'), ('65', '63', 'Bug编辑', 'Bug管理', '10', 'bugEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-bedit', 'A', '', '2013-06-22 10:05:34', '2013-06-22 10:05:34', '1', '1'), ('66', '63', 'Bug删除', 'Bug管理', '11', 'bugDel', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-bdel', 'A', '', '2013-06-22 10:06:12', '2013-06-22 10:06:12', '1', '1'), ('67', '1', 'test', '系统管理', '1', '123', 'F', 'N', 'closed', 'jsp/bugManager/MyJsp.jsp', 'icon-bdel', 'I', '', '2013-06-22 15:54:10', '2013-06-22 22:31:02', '1', '1'), ('68', null, '客户管理', '', '3', 'cstMgr', 'F', 'Y', 'closed', 'javascript:void(0);', 'icon-role', 'A', '', '2013-06-24 09:45:45', '2013-06-24 09:45:45', '1', '1'), ('69', '68', '客户档案录入', '客户管理', '1', 'cstMain', 'F', 'Y', 'closed', 'jsp/cstManager/cstMain.jsp', 'icon-edit', 'A', '', '2013-06-24 09:46:49', '2016-06-26 13:25:44', '1', '1'), ('70', '69', '客户新增', '客户管理', '1', 'cstAdd', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-adds', 'A', '', '2013-06-26 12:20:09', '2013-06-26 12:20:09', '1', '1'), ('71', '69', '客户编辑', '客户管理', '2', 'cstEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-ok', 'A', '', '2013-06-26 12:20:46', '2013-06-26 12:21:22', '1', '1'), ('72', '69', '客户删除', '客户管理', '3', 'cstDel', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-remove', 'A', '', '2013-06-26 12:22:05', '2013-06-26 12:22:05', '1', '1'), ('73', '69', '客户联系人编辑', '客户管理', '4', 'cstConEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-config', 'A', '', '2013-06-26 12:23:15', '2013-06-26 12:23:15', '1', '1'), ('74', null, '供应商管理', '', '5', 'supMgr', 'F', 'Y', 'closed', 'javascript:void(0);', 'icon-role', 'A', '', '2013-06-26 12:27:50', '2013-06-26 12:29:22', '1', '1'), ('75', '74', '供应商档案录入', '供应商管理', '1', 'supMain', 'F', 'Y', 'closed', 'jsp/supManager/supMain.jsp', 'icon-tip', 'A', '', '2013-06-26 12:28:55', '2013-06-26 16:28:17', '1', '1'), ('76', '75', '供应商新增', '供应商管理', '1', 'supAdd', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-adds', 'A', '', '2013-06-26 12:30:25', '2013-06-26 12:30:25', '1', '1'), ('77', '75', '供应商编辑', '供应商管理', '2', 'supEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-ok', 'A', '', '2013-06-26 12:31:10', '2013-06-26 12:31:10', '1', '1'), ('78', '75', '供应商删除', '供应商管理', '3', 'supDel', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-remove', 'A', '', '2013-06-26 12:31:59', '2013-06-26 14:05:55', '1', '1'), ('79', '75', '供应商联系人编辑', '供应商管理', '4', 'supConEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-config', 'A', '', '2013-06-26 14:06:44', '2013-06-26 15:45:59', '1', '1'), ('80', '8', '商品新增', '商品管理', '1', 'itemAdd', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-adds', 'A', '', '2013-06-26 15:37:38', '2013-06-26 15:37:38', '1', '1'), ('81', '8', '商品编辑', '商品管理', '2', 'itemEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-ok', 'A', '', '2013-06-26 15:38:10', '2013-06-26 15:38:21', '1', '1'), ('82', '8', '商品删除', '商品管理', '3', 'itemDel', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-cancel', 'A', '', '2013-06-26 15:38:59', '2013-06-26 15:39:18', '1', '1'), ('83', '8', '商品导入', '商品管理', '4', 'itemImport', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-excel', 'I', '', '2013-06-26 15:41:54', '2013-06-26 16:30:12', '1', '1'), ('87', null, '项目管理', '', '5', 'projectMgr', 'F', 'N', 'closed', 'javascript:void(0);', 'icon-sys', 'A', '', '2013-06-27 12:02:43', '2013-06-27 12:02:43', '1', '1'), ('88', '87', '项目档案录入', '项目管理', '1', 'projectMain', 'F', 'Y', 'closed', 'jsp/project/projectMain.jsp', 'icon-adds', 'A', '', '2013-06-27 12:03:59', '2013-06-27 12:03:59', '1', '1'), ('89', '88', '项目新增', '项目档案录入', '1', 'projectAdd', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-adds', 'A', '', '2013-06-27 12:04:39', '2013-06-27 12:04:53', '1', '1'), ('90', '88', '项目编辑', '项目档案录入', '2', 'projectEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-edit', 'A', '', '2013-06-27 12:05:28', '2013-06-27 12:05:28', '1', '1'), ('91', '88', '项目删除', '项目档案录入', '3', 'projectDel', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-ok', 'A', '', '2013-06-27 12:06:08', '2013-07-01 10:59:53', '1', '1'), ('92', null, '数据备份', '', '7', 'dbBackUp', 'F', 'Y', 'closed', 'javascript:void(0);', 'icon-db', 'A', '', '2013-06-28 13:32:09', '2013-06-28 13:32:22', '1', '1'), ('93', '92', '数据备份', '数据备份', '1', 'dbBackUpMain', 'F', 'Y', 'closed', 'jsp/dbBackUp/dbBackUpMain.jsp', 'icon-end', 'A', '', '2013-06-28 13:34:21', '2013-06-28 13:50:29', '1', '1'), ('94', '93', '手动备份', '数据备份', '1', 'dbBackUpHand', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-pro', 'A', '', '2013-06-28 13:37:27', '2013-07-11 11:23:27', '1', '1'), ('95', '93', '定时备份', '数据备份', '2', 'dbBackUpTime', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-config', 'A', '', '2013-06-28 13:38:19', '2013-06-28 13:38:19', '1', '1'), ('96', '74', '采购单录入', '供应商管理', '3', 'ordPurMgr', 'F', 'Y', 'closed', 'jsp/orderPurchase/orderPurchaseMain.jsp', 'icon-adds', 'A', '', '2013-07-01 10:58:03', '2013-07-01 10:58:03', '1', '1'), ('97', '96', '采购单新增', '采购单录入', '1', 'ordPurAdd', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-adds', 'A', '', '2013-07-01 10:58:58', '2013-07-01 10:58:58', '1', '1'), ('98', '96', '采购单编辑', '采购单录入', '2', 'ordPurEdit', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-ok', 'A', '', '2013-07-01 10:59:44', '2013-07-01 11:01:00', '1', '1'), ('99', '96', '采购单删除', '采购单录入', '3', 'ordPurDel', 'O', 'Y', 'open', 'javascript:void(0);', 'icon-remove', 'A', '', '2013-07-01 11:00:44', '2013-07-01 11:00:44', '1', '1'), ('100', '68', '客户订单录入', '客户管理', '3', 'cstOrderMgr', 'F', 'Y', 'closed', 'jsp/orderSale/orderSaleMain.jsp', 'icon-end', 'A', '', '2013-07-08 15:20:54', '2013-07-08 15:23:53', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `PLAN_PURCHASE`
-- ----------------------------
DROP TABLE IF EXISTS `PLAN_PURCHASE`;
CREATE TABLE `PLAN_PURCHASE` (
  `PLAN_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '采购计划编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '采购单自编码',
  `DATE` date DEFAULT NULL COMMENT '计划单日期',
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '计划类型编码',
  `CLASS_NAME` varchar(55) DEFAULT NULL COMMENT '计划类型名称',
  `PROJECT_ID` int(11) DEFAULT NULL COMMENT '项目编码',
  `PROJECT_NAME` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `AMOUNT` float DEFAULT NULL COMMENT '计划未税总价',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '项目描述',
  `SOURCE_OBJECT` varchar(55) DEFAULT NULL COMMENT '来源对象',
  `OBJECT_ID` int(11) DEFAULT NULL COMMENT '来源对象编码',
  `PRINT_COUNT` int(11) DEFAULT NULL COMMENT '打印次数',
  `ENTER_ID` int(11) DEFAULT NULL COMMENT '录入人编码',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  `ENTER_NAME` varchar(55) DEFAULT NULL COMMENT '录入人名称',
  `ENTER_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '录入人组织编码',
  `ENTER_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '录入人组织名称',
  `ENTER_DATE` date DEFAULT NULL COMMENT '录入日期',
  `AUDITE_ID` int(11) DEFAULT NULL COMMENT '审核人编码',
  `AUDITE_NAME` varchar(55) DEFAULT NULL COMMENT '审核人名称',
  `AUDITE_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '审核人组织编码',
  `AUDITE_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '审核人组织名称',
  `AUDITE_DATE` date DEFAULT NULL COMMENT '审核日期',
  `AUDITE_STATUS` char(1) DEFAULT NULL COMMENT '审核状态',
  `AMOUNT_TAX` double(18,8) DEFAULT NULL COMMENT '含税总价',
  PRIMARY KEY (`PLAN_ID`),
  KEY `FK_PLAN_PURCHASE1` (`CLASS_ID`),
  KEY `FK_PLAN_PURCHASE2` (`PROJECT_ID`),
  KEY `FK_PLAN_PURCHASE3` (`ATTACHMENT_ID`),
  KEY `FK_PLAN_PURCHASE4` (`ENTER_ORGANIZATION_ID`),
  KEY `FK_PLAN_PURCHASE5` (`AUDITE_ID`),
  KEY `FK_PLAN_PURCHASE6` (`ENTER_ID`),
  KEY `FK_PLAN_PURCHASE7` (`AUDITE_ORGANIZATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `PLAN_PURCHASE_LINE`
-- ----------------------------
DROP TABLE IF EXISTS `PLAN_PURCHASE_LINE`;
CREATE TABLE `PLAN_PURCHASE_LINE` (
  `PLAN_LID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEM_ID` int(11) DEFAULT NULL COMMENT '商品编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '商品自编码',
  `NAME` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `SPEC` varchar(200) DEFAULT NULL COMMENT '规格',
  `UNIT` varchar(55) DEFAULT NULL COMMENT '单位编码',
  `BRAND_ID` int(11) DEFAULT NULL COMMENT '品牌编码',
  `BRAND_NAME` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `PLAN_QTY` int(11) DEFAULT NULL COMMENT '计划数量',
  `PRICE_TAX` double(18,8) DEFAULT NULL COMMENT '含税价格',
  `AMOUNT` double(18,8) DEFAULT NULL COMMENT '未税总价',
  `PRICE` double(18,8) DEFAULT NULL COMMENT '未税单价',
  `AMOUNT_TAX` double(18,8) DEFAULT NULL COMMENT '含税总价',
  `TAX` double(18,8) DEFAULT NULL COMMENT '税金',
  `PLAN_ID` int(11) DEFAULT NULL COMMENT '计划编码',
  `TAX_RATE` int(11) DEFAULT NULL COMMENT '税率',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '备注',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  PRIMARY KEY (`PLAN_LID`),
  KEY `PLAN_PURCHASE_LINE1` (`ITEM_ID`),
  KEY `PLAN_PURCHASE_LINE2` (`BRAND_ID`),
  KEY `PLAN_PURCHASE_LINE3` (`PLAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `PROVINCE`
-- ----------------------------
DROP TABLE IF EXISTS `PROVINCE`;
CREATE TABLE `PROVINCE` (
  `PROVINCE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '省份',
  `AREA_ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `CREATED` date NOT NULL,
  `LASTMOD` date DEFAULT NULL,
  `STATUS` char(1) NOT NULL DEFAULT 'A',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`PROVINCE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='省份资料';

-- ----------------------------
--  Records of `PROVINCE`
-- ----------------------------
BEGIN;
INSERT INTO `PROVINCE` VALUES ('1', '0', '江苏', '2013-06-25', '2013-06-25', 'A', '1', '1'), ('2', '0', '浙江', '2013-06-25', '2013-06-25', 'A', '1', '1'), ('3', '0', '广东', '2016-06-26', '2016-06-26', 'A', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `REQUISITION_PURCHASE`
-- ----------------------------
DROP TABLE IF EXISTS `REQUISITION_PURCHASE`;
CREATE TABLE `REQUISITION_PURCHASE` (
  `REQ_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '请购单编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '请购单自编码',
  `DATE` date DEFAULT NULL COMMENT '请购日期',
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '采购类型',
  `CLASS_NAME` varchar(55) DEFAULT NULL COMMENT '采购类型名称',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '备注',
  `WAREHOUSE_ID` int(11) DEFAULT NULL COMMENT '仓库编码',
  `SOURCE_OBJECT` char(2) DEFAULT NULL COMMENT 'P:采购计划，SO:表示销售订单',
  `OBJECT_ID` int(11) DEFAULT NULL COMMENT '来源单据编码',
  `CUSTOMER_ID` int(11) DEFAULT NULL COMMENT '客户编码',
  `CUSTOMER_NAME` varchar(200) DEFAULT NULL COMMENT '客户名称',
  `AMOUNT` double DEFAULT NULL COMMENT '未税总价',
  `AMOUNT_TAX` double DEFAULT NULL COMMENT '含税总价',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `PRINT_COUNT` int(11) DEFAULT NULL COMMENT '打印次数',
  `REQUISITION_ID` int(11) DEFAULT NULL COMMENT '请购人编码',
  `REQUISITION_NAME` varchar(55) DEFAULT NULL COMMENT '请购人名称',
  `REQUISITION_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '请购组织编码',
  `REQUISITION_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '请购组织名称',
  `ENTER_ID` int(11) DEFAULT NULL COMMENT '录入人编码',
  `ENTER_NAME` varchar(55) DEFAULT NULL COMMENT '录入人名称',
  `ENTER_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '录入人组织编码',
  `ENTER_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '录入人组织名称',
  `ENTER_DATE` date DEFAULT NULL COMMENT '录入日期',
  `AUDITE_ID` int(11) DEFAULT NULL COMMENT '审核人编码',
  `AUDITE_NAME` varchar(55) DEFAULT NULL COMMENT '审核人名称',
  `AUDITE_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '审核人组织编码',
  `AUDITE_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '审核人组织名称',
  `AUDITE_DATE` date DEFAULT NULL COMMENT '审核日期',
  `AUDITE_STATUS` char(1) DEFAULT NULL COMMENT '审核状态',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  `WAREHOUSE_NAME` varchar(55) DEFAULT NULL COMMENT '仓库名称',
  PRIMARY KEY (`REQ_ID`),
  KEY `FK_REQUISITION_PURCHASE1` (`CLASS_ID`),
  KEY `FK_REQUISITION_PURCHASE2` (`WAREHOUSE_ID`),
  KEY `FK_REQUISITION_PURCHASE3` (`CUSTOMER_ID`),
  KEY `FK_REQUISITION_PURCHASE4` (`ATTACHMENT_ID`),
  KEY `FK_REQUISITION_PURCHASE5` (`REQUISITION_ID`),
  KEY `FK_REQUISITION_PURCHASE6` (`REQUISITION_ORGANIZATION_ID`),
  KEY `FK_REQUISITION_PURCHASE7` (`ENTER_ID`),
  KEY `FK_REQUISITION_PURCHASE8` (`ENTER_ORGANIZATION_ID`),
  KEY `FK_REQUISITION_PURCHASE9` (`AUDITE_ID`),
  KEY `FK_REQUISITION_PURCHASE10` (`AUDITE_ORGANIZATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `REQUISITION_PURCHASE_LINE`
-- ----------------------------
DROP TABLE IF EXISTS `REQUISITION_PURCHASE_LINE`;
CREATE TABLE `REQUISITION_PURCHASE_LINE` (
  `REQUISITION_LID` int(11) NOT NULL AUTO_INCREMENT,
  `REQUISITION_ID` int(11) DEFAULT NULL COMMENT '请购单编码',
  `ITEM_ID` int(11) DEFAULT NULL COMMENT '商品编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '商品自编码',
  `ITEM_NAME` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `SPEC` varchar(200) DEFAULT NULL COMMENT '规格',
  `UNIT` varchar(55) DEFAULT NULL COMMENT '单位',
  `BRAND_ID` int(11) DEFAULT NULL COMMENT '品牌编码',
  `BRAND_NAME` varchar(200) DEFAULT NULL COMMENT '品牌名称',
  `REQUISITION_QTY` int(11) DEFAULT NULL COMMENT '请购数量',
  `PRICE_TAX` float DEFAULT '0' COMMENT '含税价格',
  `AMOUNT` float DEFAULT '0' COMMENT '未税总价',
  `PRICE` float DEFAULT '0' COMMENT '未税单价',
  `AMOUNT_TAX` float DEFAULT '0' COMMENT '含税总价',
  `TAX` float DEFAULT '0' COMMENT '税金',
  `DELIVERY_PERIOD` date DEFAULT NULL COMMENT '交货期限',
  `HAVEORDER_QTY` int(11) DEFAULT NULL COMMENT '已下订单数量',
  `SALE_ORDER_ID` int(11) DEFAULT NULL COMMENT '销售订单编码',
  `SALE_ORDER_MYID` varchar(55) DEFAULT NULL COMMENT '销售订单自编码',
  `NEVERORDER_QTY` int(11) DEFAULT NULL COMMENT '未下单数量',
  `SALE_ID` int(11) DEFAULT NULL COMMENT '销售单编码',
  `SALE_MYID` varchar(55) DEFAULT NULL COMMENT '销售单自编码',
  `SALE_CONTRACT_ID` int(11) DEFAULT NULL COMMENT '销售合同编码',
  `SALE_CONTRACT_MYID` varchar(55) DEFAULT NULL COMMENT '销售合同自编码',
  `PLAN_ID` int(11) DEFAULT NULL COMMENT '采购计划编码',
  `PLAN_MYID` varchar(55) DEFAULT NULL COMMENT '采购计划自编码',
  `HAVE_ENQUIRY` int(1) DEFAULT NULL COMMENT '是否询价 1:已询价，2:未询价',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '备注',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  PRIMARY KEY (`REQUISITION_LID`),
  KEY `FK_REQUISITION_PURCHASE_LINE1` (`ITEM_ID`),
  KEY `FK_REQUISITION_PURCHASE_LINE2` (`BRAND_ID`),
  KEY `FK_REQUISITION_PURCHASE_LINE3` (`PLAN_ID`),
  KEY `FK_REQUISITION_PURCHASE_LINE4` (`REQUISITION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ROLE`
-- ----------------------------
DROP TABLE IF EXISTS `ROLE`;
CREATE TABLE `ROLE` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色编码',
  `NAME` varchar(55) DEFAULT NULL COMMENT '角色名称',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT '角色描述',
  `STATUS` char(1) DEFAULT NULL COMMENT '角色状态',
  `CREATED` datetime DEFAULT NULL COMMENT '创造时间',
  `LASTMOD` datetime DEFAULT NULL COMMENT '修改时间',
  `SORT` int(10) DEFAULT NULL COMMENT '排序',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='系统角色资料';

-- ----------------------------
--  Records of `ROLE`
-- ----------------------------
BEGIN;
INSERT INTO `ROLE` VALUES ('1', '系统管理角色', '管理角色', 'A', '2013-05-20 00:00:00', '2013-06-14 00:00:00', '1', '1', '1'), ('2', '角色2', '角色2', 'A', '2013-05-20 00:00:00', '2013-06-14 00:00:00', '1', '1', '1'), ('3', '角色3', '角色3', 'A', '2013-05-23 00:00:00', '2016-06-25 15:59:04', '3', '1', '1'), ('10', 'test', '测试角色', 'A', '2013-06-19 00:00:00', '2013-06-19 00:00:00', '3', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `ROLE_PERMISSION`
-- ----------------------------
DROP TABLE IF EXISTS `ROLE_PERMISSION`;
CREATE TABLE `ROLE_PERMISSION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ROLE_ID` int(11) NOT NULL COMMENT '角色代码',
  `PERMISSION_ID` int(11) NOT NULL COMMENT '权限代码',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `CREATED` datetime DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` datetime DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ID`),
  KEY `FK_ROLE_PERMISSION1` (`ROLE_ID`),
  KEY `FK_ROLE_PERMISSION2` (`PERMISSION_ID`),
  CONSTRAINT `FK_ROLE_PERMISSION1` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_PERMISSION2` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `PERMISSION` (`PERMISSION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='角色权限资料';

-- ----------------------------
--  Records of `ROLE_PERMISSION`
-- ----------------------------
BEGIN;
INSERT INTO `ROLE_PERMISSION` VALUES ('1', '2', '6', 'A', '2016-06-25 20:31:26', '2016-06-29 10:07:35', '2', '2'), ('2', '2', '8', 'A', '2016-06-25 20:31:26', '2016-06-29 10:07:35', '2', '2'), ('3', '2', '80', 'A', '2016-06-25 20:31:26', '2016-06-29 10:07:35', '2', '2'), ('4', '2', '81', 'A', '2016-06-25 20:31:26', '2016-06-29 10:07:35', '2', '2'), ('5', '2', '82', 'A', '2016-06-25 20:31:26', '2016-06-29 10:07:35', '2', '2'), ('6', '2', '1', 'A', '2016-06-29 09:40:46', '2016-06-29 10:07:35', '2', '2'), ('7', '2', '7', 'I', '2016-06-29 09:40:46', '2016-06-29 10:07:35', '2', '2'), ('8', '2', '21', 'I', '2016-06-29 09:40:46', '2016-06-29 10:07:35', '2', '2'), ('9', '2', '22', 'I', '2016-06-29 09:40:46', '2016-06-29 10:07:35', '2', '2'), ('10', '2', '23', 'I', '2016-06-29 09:40:46', '2016-06-29 10:07:35', '2', '2'), ('11', '2', '24', 'I', '2016-06-29 09:40:46', '2016-06-29 10:07:35', '2', '2'), ('12', '2', '2', 'A', '2016-06-29 10:06:31', '2016-06-29 10:07:35', '2', '2'), ('13', '2', '16', 'A', '2016-06-29 10:06:31', '2016-06-29 10:07:35', '2', '2');
COMMIT;

-- ----------------------------
--  Table structure for `SUPLIER`
-- ----------------------------
DROP TABLE IF EXISTS `SUPLIER`;
CREATE TABLE `SUPLIER` (
  `SUPLIER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商编码',
  `NAME` varchar(200) DEFAULT NULL COMMENT '供应商名称',
  `MYID` varchar(55) DEFAULT NULL COMMENT '供应商自编码',
  `STATUS` char(1) DEFAULT NULL,
  `CREATED` date DEFAULT NULL,
  `LASTMOD` date DEFAULT NULL,
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFIYER` int(10) DEFAULT NULL COMMENT '修改人',
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '供应商类型',
  `TEL` varchar(55) DEFAULT NULL COMMENT '电话',
  `FAX` varchar(55) DEFAULT NULL COMMENT '传真',
  `URL` varchar(200) DEFAULT NULL COMMENT '网站',
  `EMAIL` varchar(200) DEFAULT NULL COMMENT '邮件',
  `AREA_ID` int(11) DEFAULT NULL COMMENT '区域编码',
  `AREA_NAME` varchar(100) DEFAULT NULL COMMENT '区域名称',
  `PROVINCE_ID` int(11) DEFAULT NULL COMMENT '省份编码',
  `PROVINCE_NAME` varchar(55) DEFAULT NULL COMMENT '省份名称',
  `CITY_ID` int(11) DEFAULT NULL COMMENT '城市编码',
  `CITY_NAME` varchar(55) DEFAULT NULL COMMENT '城市名称',
  `ADDRESS` varchar(1000) DEFAULT NULL COMMENT '地址',
  `ZIP` varchar(20) DEFAULT NULL COMMENT '邮政编码',
  `LEVEL_ID` int(11) DEFAULT NULL COMMENT '供应商等级编码',
  `LEVEL_NAME` varchar(200) DEFAULT NULL COMMENT '供应商等级名称',
  `SOURCE_ID` int(11) DEFAULT NULL COMMENT '供应商来源编码',
  `SOURCE_NAME` varchar(200) DEFAULT NULL COMMENT '供应商来源名称',
  `NATURE_ID` int(11) DEFAULT NULL COMMENT '供应商公司性质编码',
  `NATURE_NAME` varchar(200) DEFAULT NULL COMMENT '供应商公司性质名称',
  `INDUSTRY_ID` int(11) DEFAULT NULL COMMENT '行业编码',
  `INDUSTRY_NAME` varchar(200) DEFAULT NULL COMMENT '行业名称',
  `MAIN_BUSINESS` varchar(1000) DEFAULT NULL COMMENT '主业务业',
  `SIZE_ID` int(11) DEFAULT NULL COMMENT '公司规模编码',
  `SIZE_NAME` varchar(200) DEFAULT NULL COMMENT '公司规模',
  `SETUP_DATE` date DEFAULT NULL COMMENT '注册时间',
  `CAPITAL` int(11) DEFAULT NULL COMMENT '注册资金',
  `CORPORATION` varchar(55) DEFAULT NULL COMMENT '法人',
  `CREDIT_ID` int(11) DEFAULT NULL COMMENT '信用编码',
  `CREDIT_NAME` varchar(55) DEFAULT NULL COMMENT '信用名称',
  `BANK` varchar(200) DEFAULT NULL COMMENT '开户银行',
  `ACCOUNT` varchar(55) DEFAULT NULL COMMENT '账号',
  `TAXNO` varchar(100) DEFAULT NULL COMMENT '税号',
  `SHARED` varchar(200) DEFAULT NULL COMMENT '共享人(以逗号分隔)',
  `PID` int(11) DEFAULT NULL COMMENT '供应商父项',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '描述',
  `BUYER_ID` int(11) DEFAULT NULL COMMENT '供应商编码',
  `BUYER_NAME` varchar(55) DEFAULT NULL COMMENT '供应商名称',
  `BUYER_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '供应商组织编码',
  `BUYER_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '供应商组织名称',
  `SUPLIER_STATUS` char(1) DEFAULT NULL COMMENT '客户状态 T:交易中，S:禁用',
  `CLASS_NAME` varchar(200) DEFAULT NULL COMMENT '供应商类型名称',
  `EMP_COUNT` int(11) DEFAULT NULL,
  `TOTAL_SALES` varchar(55) DEFAULT NULL COMMENT '销售额',
  `CURRENCY_ID` int(11) DEFAULT NULL COMMENT '币别编码',
  `CURRENCY_NAME` varchar(55) DEFAULT NULL,
  `DEDUCTION_TAX` char(1) DEFAULT NULL COMMENT '1:不含税，2:含税',
  `TAX` int(11) DEFAULT NULL COMMENT '税率',
  PRIMARY KEY (`SUPLIER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `SUPLIER`
-- ----------------------------
BEGIN;
INSERT INTO `SUPLIER` VALUES ('2', 'taste', '1', 'A', '2013-06-26', '2016-06-25', '1', '1', null, '', '', '', '', null, null, null, null, '1', '苏州', '', null, null, '', null, null, null, '', null, '', '', null, '', null, null, '', null, '', '', '', '', null, null, null, '', null, '', null, null, 'T', '', null, '', null, '', 'Y', null), ('3', '盼盼', '2', 'A', '2013-07-01', '2016-06-25', '1', '1', null, '', '', '', '', null, null, null, null, '1', '苏州', '', null, null, '', null, null, null, '', null, '', '', null, '', null, null, '', null, '', '', '', '', null, null, null, '', null, '', null, null, 'T', '', null, '', '1', '人民币', 'Y', null), ('4', '康师傅', '003', 'A', '2016-06-26', '2016-06-26', '1', '1', null, '', '', '', '', null, null, null, null, '4', '广州', '天河区天府路', null, null, '', null, null, null, '', null, '', '', null, '', null, null, '', null, '', '', '', '', null, null, null, '', null, '', null, null, 'T', '', null, '', null, '', 'Y', null);
COMMIT;

-- ----------------------------
--  Table structure for `SUPLIER_CONTACT`
-- ----------------------------
DROP TABLE IF EXISTS `SUPLIER_CONTACT`;
CREATE TABLE `SUPLIER_CONTACT` (
  `CONTACT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商联系人编码',
  `SUPLIER_ID` int(11) DEFAULT NULL COMMENT '供应商编码',
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '联系人类型编码',
  `NAME` varchar(55) DEFAULT NULL COMMENT '联系人名称',
  `SEX_ID` int(11) DEFAULT NULL COMMENT '性别编码',
  `CLASS_NAME` varchar(255) DEFAULT NULL COMMENT '联系人类型名称',
  `SEX_NAME` varchar(10) DEFAULT NULL COMMENT '性别名称',
  `ORGANIZATION` varchar(255) DEFAULT NULL COMMENT '部门',
  `DUTY` varchar(255) DEFAULT NULL COMMENT '职务',
  `TEL` varchar(55) DEFAULT NULL COMMENT '电话',
  `EMAIL` varchar(255) DEFAULT NULL COMMENT '邮件',
  `MOBILE` varchar(20) DEFAULT NULL COMMENT '手机',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `CREATED` date DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` date DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  `QQ` varchar(25) DEFAULT NULL COMMENT 'QQ',
  PRIMARY KEY (`CONTACT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `SUPLIER_CONTACT`
-- ----------------------------
BEGIN;
INSERT INTO `SUPLIER_CONTACT` VALUES ('2', '2', null, '供应商A小王', null, null, 'F', null, '', '', 'qwe@qq.com', null, '123', 'A', '2013-06-26', '2013-06-26', '1', '1', ''), ('3', '3', null, '供应商B李明', null, null, 'M', null, '', '', '123@q.com', null, '123', 'A', '2013-07-01', '2013-07-11', '1', '1', '');
COMMIT;

-- ----------------------------
--  Table structure for `USERS`
-- ----------------------------
DROP TABLE IF EXISTS `USERS`;
CREATE TABLE `USERS` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户代码',
  `MYID` varchar(50) DEFAULT NULL COMMENT '用户自编码',
  `ACCOUNT` varchar(50) DEFAULT NULL COMMENT '账号',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `ORGANIZE_ID` int(11) DEFAULT NULL COMMENT '组织代码',
  `ORGANIZE_NAME` varchar(255) DEFAULT NULL COMMENT '组织名称',
  `DUTY_ID` int(11) DEFAULT NULL COMMENT '称位代码 表:SYSTEM_CODE  position',
  `TITLE_ID` int(11) DEFAULT NULL COMMENT '职等代码 表:SYSTEM_CODE  title',
  `PASSWORD` varchar(128) DEFAULT NULL COMMENT '密码',
  `EMAIL` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `LANG` varchar(20) DEFAULT NULL COMMENT '语言',
  `THEME` varchar(20) DEFAULT NULL COMMENT '样式',
  `FIRST_VISIT` datetime DEFAULT NULL COMMENT '第一次登录',
  `PREVIOUS_VISIT` datetime DEFAULT NULL COMMENT '上一次登录',
  `LAST_VISITS` datetime DEFAULT NULL COMMENT '最后一次登录',
  `LOGIN_COUNT` int(10) DEFAULT NULL COMMENT '登录资数',
  `ISEMPLOYEE` int(1) DEFAULT NULL COMMENT '是否是职工',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `IP` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `QUESTION_ID` int(10) DEFAULT NULL COMMENT '问题代码',
  `ANSWER` varchar(100) DEFAULT NULL COMMENT '回复',
  `ISONLINE` int(1) DEFAULT NULL COMMENT '是否在线',
  `CREATED` datetime DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` datetime DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  `TEL` varchar(30) DEFAULT NULL COMMENT '用户电话',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='用户资料表';

-- ----------------------------
--  Records of `USERS`
-- ----------------------------
BEGIN;
INSERT INTO `USERS` VALUES ('1', 'admin', 'admin', 'admin', '2', 'MIS', null, null, 'admin', '12@qq.com', null, null, null, null, null, null, null, 'A', null, '', null, null, null, null, '2013-06-14 00:00:00', '1', '1', '1111111'), ('2', 'root', 'root', 'root', '2', 'MIS', null, null, 'root', '123@qq.com', null, null, null, null, null, null, null, 'A', null, '', null, null, null, null, '2013-06-19 00:00:00', '1', '1', '123'), ('13', 'gsdgsgdsgdg', '123', 'twerywrt', '4', 'asdfasd', null, null, 'ert', 'ewrtewrt', null, null, null, null, null, null, null, 'I', null, '', null, null, null, '2013-06-14 00:00:00', '2013-06-14 00:00:00', '1', '1', ''), ('14', 'ttt', 'ttt', 'ttttttt', '2', 'MIS', null, null, 'tt', 'ttt', null, null, null, null, null, null, null, 'I', null, '', null, null, null, '2013-06-14 00:00:00', '2013-06-14 00:00:00', '1', '1', ''), ('15', '234', '234', '234', '1', '总经理室', null, null, '234', '234', null, null, null, null, null, null, null, 'I', null, '', null, null, null, '2013-06-14 00:00:00', '2013-06-14 00:00:00', '1', '1', '342'), ('16', '123', '123', '123', '2', 'MIS', null, null, '123', '123', null, null, null, null, null, null, null, 'I', null, '', null, null, null, '2013-06-14 00:00:00', '2013-06-14 00:00:00', '1', '1', '123'), ('17', '12312', '31231', '2312', '5', '12333', null, null, '312', '123', null, null, null, null, null, null, null, 'I', null, '', null, null, null, '2013-06-18 00:00:00', '2013-06-18 00:00:00', '1', '1', '3123'), ('18', '123', '123', '3123', '4', 'asdfasd', null, null, '123', '123', null, null, null, null, null, null, null, 'I', null, '', null, null, null, '2013-06-18 00:00:00', '2013-06-18 00:00:00', '1', '1', '132'), ('19', '123', '124', '123', '2', 'MIS', null, null, '123', '123', null, null, null, null, null, null, null, 'I', null, '', null, null, null, '2013-06-18 00:00:00', '2013-06-18 00:00:00', '1', '1', '123'), ('20', '123', '3123', '123', '12', '123', null, null, '123', '123', null, null, null, null, null, null, null, 'I', null, '', null, null, null, '2013-06-18 00:00:00', '2013-06-19 00:00:00', '1', '1', '123'), ('21', 'test', 'test', 'test', '2', 'MIS', null, null, 'test', 'test@163.com', null, null, null, null, null, null, null, 'I', null, '', null, null, null, '2013-06-19 00:00:00', '2013-06-19 00:00:00', '1', '1', '111'), ('22', '123', '123', '123', null, '', null, null, '123', '123', null, null, null, null, null, null, null, 'I', null, '', null, null, null, '2013-06-19 00:00:00', '2013-06-19 00:00:00', '1', '1', '123'), ('23', 'test', 'test', 'test', '1', '总经理室', null, null, 'test', 'atest', null, null, null, null, null, null, null, 'A', null, '测试账号', null, null, null, '2013-06-19 00:00:00', '2013-06-19 00:00:00', '1', '1', '123123'), ('24', 'hy', 'ww', 'ee', '1', '总经理室', null, null, 'ee', '123', null, null, null, null, null, null, null, 'I', null, '', null, null, null, '2013-06-21 09:19:56', '2016-06-25 20:14:37', '1', '1', '123');
COMMIT;

-- ----------------------------
--  Table structure for `USER_ROLE`
-- ----------------------------
DROP TABLE IF EXISTS `USER_ROLE`;
CREATE TABLE `USER_ROLE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL DEFAULT '0' COMMENT '用户代码',
  `ROLE_ID` int(11) DEFAULT NULL COMMENT '角色代码',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `CREATED` datetime DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` datetime DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ID`),
  KEY `FK_USER_ROLE1` (`USER_ID`),
  KEY `FK_USER_ROLE2` (`ROLE_ID`),
  CONSTRAINT `FK_USER_ROLE1` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`USER_ID`),
  CONSTRAINT `FK_USER_ROLE2` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='用户角色资料表';

-- ----------------------------
--  Records of `USER_ROLE`
-- ----------------------------
BEGIN;
INSERT INTO `USER_ROLE` VALUES ('1', '2', '2', 'A', '2013-05-24 00:00:00', '2016-06-29 10:06:17', '1', '1'), ('3', '2', '3', 'I', '2013-05-29 00:00:00', '2016-06-29 10:06:17', '1', '1'), ('10', '1', '1', 'A', '2013-05-29 00:00:00', '2013-06-14 00:00:00', '1', '1'), ('16', '2', '1', 'I', '2013-05-29 00:00:00', '2016-06-29 10:06:17', '1', '1'), ('18', '13', '2', 'A', '2013-06-14 00:00:00', '2013-06-14 00:00:00', '1', '1'), ('19', '13', '3', 'A', '2013-06-14 00:00:00', '2013-06-14 00:00:00', '1', '1'), ('21', '23', '10', 'I', '2013-06-19 00:00:00', '2013-06-22 13:42:59', '1', '1'), ('22', '24', '10', 'A', '2013-06-21 09:21:45', '2013-07-11 14:25:26', '1', '1'), ('24', '23', '3', 'I', '2013-06-22 13:42:32', '2013-06-22 13:42:59', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `WAREHOUSE`
-- ----------------------------
DROP TABLE IF EXISTS `WAREHOUSE`;
CREATE TABLE `WAREHOUSE` (
  `WAREHOUSE_ID` int(11) NOT NULL COMMENT '仓库编码',
  `NAME` varchar(55) DEFAULT NULL COMMENT '仓库名称',
  `MYID` varchar(55) DEFAULT NULL COMMENT '仓库自编码',
  `ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '部门编码',
  `ORGANIZATION_NAME` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `MANAGER_ID` int(11) DEFAULT NULL COMMENT '管理人编码',
  `MANAGER_NAME` varchar(50) DEFAULT NULL COMMENT '管理员名称',
  `TEL` varchar(55) DEFAULT NULL COMMENT '电话',
  `ADDRESS` varchar(200) DEFAULT NULL COMMENT '地址',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT '描述',
  `CREATED` date DEFAULT NULL,
  `LASTMOD` date DEFAULT NULL,
  `STATUS` char(1) DEFAULT 'A',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`WAREHOUSE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `WAREHOUSE`
-- ----------------------------
BEGIN;
INSERT INTO `WAREHOUSE` VALUES ('1', '物流仓', '12', '1', '1', '1', '1', '1', '1', '1', '2013-07-01', '2013-07-01', 'A', '1', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
