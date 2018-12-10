

-- --------------------------------------------------------

--
-- 根据信用类型(资源目录)搜索企业
--

DROP PROCEDURE IF EXISTS enterprise_by_resource_catalog;

DELIMITER //
CREATE PROCEDURE enterprise_by_resource_catalog(in name varchar(255), in type int, in dimension varchar(255), in offset int, in size int) 
BEGIN
  DECLARE select_cal,on_cal,where_cal,limit_cal,condition_cal,name_cal,dimension_cal VARCHAR(255);
  DECLARE cal TEXT;

  SET dimension_cal='';
  IF dimension!=''
  THEN
  SET @dimension = dimension,
  dimension_cal = CONCAT(' AND psrcd.dimension IN (', @dimension, ')');
  END IF;
  
  SET select_cal = 'SELECT pe.enterprise_id FROM pcore_searchable_resource_catalog_data AS psrcd INNER JOIN (pcore_enterprise AS pe) ON ( ', 
  on_cal = 'unified_social_credit_code <> "" AND pe.unified_social_credit_code = psrcd.identify) ',
  where_cal = CONCAT('WHERE psrcd.type = ', type, dimension_cal, ' GROUP BY psrcd.identify ORDER BY pe.update_time DESC '),
  limit_cal = CONCAT('LIMIT ', offset, ', ',size),
  name_cal = name,
  condition_cal ='',
  cal = '';

  IF name!=''
  THEN
  SET name_cal = CONCAT('"%',name,'%"'),
  condition_cal = CONCAT('pe.name LIKE ', name_cal, ' AND ');
  END IF;
  SET cal = CONCAT(select_cal, condition_cal, on_cal, where_cal, limit_cal);
   
  SET @sql=cal;  
  PREPARE stmt FROM @sql;    -- 预处理动态sql语句
  EXECUTE stmt;              -- 执行sql语句
  DEALLOCATE PREPARE stmt ;  -- 释放prepare 
END//
DELIMITER ;

-- --------------------------------------------------------

--
-- 根据信用类型(资源目录)搜索企业总数
--

DROP PROCEDURE IF EXISTS enterprise_by_resource_catalog_total;

DELIMITER //
CREATE PROCEDURE enterprise_by_resource_catalog_total(in name varchar(255), in type int, in dimension varchar(255)) 
BEGIN
  DECLARE select_cal,on_cal,where_cal,condition_cal,name_cal,dimension_cal VARCHAR(255);
  DECLARE cal TEXT;
  
  SET dimension_cal='';
  IF dimension!=''
  THEN
  SET @dimension = dimension,
  dimension_cal = CONCAT(' AND psrcd.dimension IN (', @dimension, ')');
  END IF;
  
  SET select_cal = 'SELECT pe.enterprise_id FROM pcore_searchable_resource_catalog_data AS psrcd INNER JOIN (pcore_enterprise AS pe) ON ( ', 
  on_cal = 'unified_social_credit_code <> "" AND pe.unified_social_credit_code = psrcd.identify) ',
  where_cal = CONCAT('WHERE psrcd.type = ', type, dimension_cal, ' GROUP BY psrcd.identify'),
  name_cal = name,
  condition_cal ='',
  cal = '';

  IF name!=''
  THEN
  SET name_cal = CONCAT('"%',name,'%"'),
  condition_cal = CONCAT('pe.name LIKE ', name_cal, ' AND ');
  END IF;
  SET cal = CONCAT(select_cal, condition_cal, on_cal, where_cal);
   
  SET @sql=cal;  
  PREPARE stmt FROM @sql;    -- 预处理动态sql语句
  EXECUTE stmt;              -- 执行sql语句
  DEALLOCATE PREPARE stmt ;  -- 释放prepare 
END//
DELIMITER ;

-- --------------------------------------------------------

--
-- 统计某用户在本平台申请产品总量、申请产品的通过率、申请产品的驳回率、申请产品的通过量、申请产品的驳回量
--

DROP PROCEDURE IF EXISTS statics_order;

DELIMITER //
CREATE PROCEDURE statics_order(in member int) 
BEGIN
  DECLARE total, approve_total, reject_total INT;
  DECLARE approve_rate, reject_rate DECIMAL(10,2);
  SET total=0, approve_total=0, reject_total=0, approve_rate=0.00, reject_rate=0.00;
  SELECT COUNT(order_id) INTO total FROM pcore_order WHERE member_id=member;
  SELECT COUNT(order_id) INTO approve_total FROM pcore_order WHERE member_id=member and status=2; 
  SELECT COUNT(order_id) INTO reject_total FROM pcore_order WHERE member_id=member and status=-2;
  SELECT SUM(approve_total*100/total) INTO approve_rate;
  SELECT SUM(reject_total*100/total) INTO reject_rate;
  SELECT total, approve_total, reject_total, approve_rate, reject_rate;
END//
DELIMITER ;

-- --------------------------------------------------------

--
-- 统计 联合奖惩案例ids
--

DROP PROCEDURE IF EXISTS statics_case_award_penalty;

DELIMITER //
CREATE PROCEDURE statics_case_award_penalty(in ug1 int, in ug2 int, in ug3 int, in ug4 int) 
BEGIN
SELECT MAX(case_award_penalty_id) AS case_award_penalty_id FROM pcore_case_award_penalty WHERE award_penalty_type = ug1 AND status = ug2 GROUP BY identify, item_award_penalty ORDER BY case_award_penalty_id DESC limit ug3, ug4;
END//
DELIMITER ;

-- --------------------------------------------------------

