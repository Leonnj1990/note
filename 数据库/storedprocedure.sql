use yichang;

--
-- 统计某用户在某银行申请产品总量、以及申请产品的通过率
--

DROP PROCEDURE IF EXISTS statics_order_by_bank;

DELIMITER //
CREATE PROCEDURE statics_order_by_bank(in member int, in bank int) 
BEGIN
	DECLARE total_bank, approve_total_bank INT;
	DECLARE approve_rate DECIMAL(10,2);
	SET total_bank=0, approve_total_bank=0, approve_rate=0.00;
	SELECT COUNT(order_id) INTO total_bank FROM pcore_order WHERE member_id=member and bank_id=bank;
	SELECT COUNT(order_id) INTO approve_total_bank FROM pcore_order WHERE member_id=member and bank_id=bank and status=2; 
	SELECT SUM(approve_total_bank*100/total_bank) INTO approve_rate;
	SELECT total_bank, approve_rate;
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
-- 统计某用户在本平台发布的某需求被多少家银行受理
--

DROP PROCEDURE IF EXISTS statics_demand_by_bank;

DELIMITER //
CREATE PROCEDURE statics_demand_by_bank(IN demand INT)
BEGIN
SELECT
  pbe.bank_id
FROM
  `pcore_bank_enterprise` AS pbe
INNER JOIN
  (
  SELECT
    pdbe.bank_enterprise_id
  FROM
    `pcore_demand_bank_enterprise` AS pdbe
  WHERE
    `demand_id` = demand
  GROUP BY
    bank_enterprise_id
) AS bank_enterprise
WHERE
  pbe.bank_enterprise_id = bank_enterprise.bank_enterprise_id
GROUP BY
  pbe.bank_id ;
END //
DELIMITER ;

-- --------------------------------------------------------

--
-- 统计某用户在本平台发布需求总量、发布需求已受理量、发布需求未受理量
--

DROP PROCEDURE IF EXISTS statics_demand;

DELIMITER //
CREATE PROCEDURE statics_demand(in member int) 
BEGIN
	DECLARE total, admissible_total, pending_admissible_total INT;
	SET total=0, admissible_total=0, pending_admissible_total=0;
	SELECT COUNT(demand_id) INTO total FROM pcore_demand WHERE member_id=member;
	SELECT COUNT(demand_id) INTO admissible_total FROM pcore_demand WHERE member_id=member and admissibility=2; 
	SELECT COUNT(demand_id) INTO pending_admissible_total FROM pcore_demand WHERE member_id=member and admissibility=0;
	SELECT total, admissible_total, pending_admissible_total;
END//
DELIMITER ;

-- --------------------------------------------------------