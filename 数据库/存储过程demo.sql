
--拼接的sql需要动态执行, 暂时想到的解决方案是在adapter执行两次查询, 第一次查询 存储过程, 第二次查询拼接的sql语句, 但是执行两次感觉不太好
DROP PROCEDURE IF EXISTS enterprise_by_resource_catalog;

DELIMITER //
CREATE PROCEDURE enterprise_by_resource_catalog(in name varchar(255), in type int, in dimension int, in offset int, in size int) 
BEGIN
  DECLARE select_cal,on_cal,where_cal,limit_cal,condition_cal,name_nal,cal VARCHAR(800);
  SET select_cal = 'SELECT pe.enterprise_id FROM pcore_searchable_resource_catalog_data AS psrcd INNER JOIN (pcore_enterprise AS pe) ON ( ', 
  on_cal = 'unified_social_credit_code <> "" AND pe.unified_social_credit_code = psrcd.identify) ',
  where_cal = CONCAT('WHERE psrcd.type = ', type, ' AND psrcd.dimension =', dimension, ' GROUP BY psrcd.identify ORDER BY pe.update_time DESC '),
  limit_cal = CONCAT('LIMIT ', offset, ', ',size),
  name_nal = name,
  condition_cal ='',
  cal = '';

  IF name!=''
  THEN
  SET name_nal = CONCAT('"%',name,'%"'),
  condition_cal = CONCAT('pe.name LIKE ', name_nal, ' AND ');
  END IF;
  SET cal = CONCAT(select_cal, condition_cal, on_cal, where_cal, limit_cal);
  /* 问题: stmt怎么确定?
  SET @sql=cal;  
  PREPARE stmt FROM @sql;    -- 预处理动态sql语句
  EXECUTE stmt;              -- 执行sql语句
  DEALLOCATE PREPARE stmt ;  -- 释放prepare */
END//
DELIMITER ;


CALL enterprise_by_resource_catalog('',44,1,0,10)



--比较蠢的方式, 不用动态执行, 暂时用这个处理
DROP PROCEDURE IF EXISTS enterprise_by_resource_catalog;

DELIMITER //
CREATE PROCEDURE enterprise_by_resource_catalog(in name varchar(255), in type int, in dimension int, in offset int, in size int)  
BEGIN
IF name=0
THEN
SELECT pe.enterprise_id
  FROM `pcore_searchable_resource_catalog_data` AS psrcd 
  INNER JOIN (`pcore_enterprise` AS pe) 
  ON (unified_social_credit_code <> '' AND pe.unified_social_credit_code = psrcd.identify) 
  WHERE psrcd.type = type 
  AND psrcd.dimension = dimension
  GROUP BY psrcd.identify 
ORDER BY pe.update_time DESC 
LIMIT offset, size;
ELSE
SELECT pe.enterprise_id
  FROM `pcore_searchable_resource_catalog_data` AS psrcd 
  INNER JOIN (`pcore_enterprise` AS pe) 
  ON (pe.name LIKE CONCAT('%',name,'%') AND unified_social_credit_code <> '' AND pe.unified_social_credit_code = psrcd.identify) 
  WHERE psrcd.type = type 
  AND psrcd.dimension = dimension
  GROUP BY psrcd.identify 
ORDER BY pe.update_time DESC 
LIMIT offset, size;
END IF;
END//
DELIMITER ;