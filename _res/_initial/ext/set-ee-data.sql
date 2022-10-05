
set @_ee_pin  = '038CAT';
set @_ee_name = 'CATICLAN';



-- 
-- BEGIN PROCESS
-- 
set @_ee_id   = replace(@_ee_pin,'-','');

-- 
-- delete previous data
-- 
delete from barangay;
delete from municipality;
delete from city;
delete from province;
update sys_org set parent_objid=null, parent_orgclass=null;
delete from sys_org; 
delete from sys_orgclass; 



-- 
-- insert org class
-- 
INSERT INTO `sys_orgclass` (`name`, `title`, `parentclass`, `handler`) 
VALUES ('EE', 'ECONOMIC ENTERPRISE', NULL, NULL);

INSERT INTO `sys_orgclass` (`name`, `title`, `parentclass`, `handler`) 
VALUES ('PROVINCE', 'PROVINCE', NULL, 'province');

INSERT INTO `sys_orgclass` (`name`, `title`, `parentclass`, `handler`) 
VALUES ('MUNICIPALITY', 'MUNICIPALITY', 'PROVINCE', 'municipality');

INSERT INTO `sys_orgclass` (`name`, `title`, `parentclass`, `handler`) 
VALUES ('BARANGAY', 'BARANGAY', 'MUNICIPALITY', 'barangay');


-- 
-- insert org
-- 
INSERT INTO `sys_org` (`objid`, `name`, `orgclass`, `parent_objid`, `parent_orgclass`, `code`, `root`, `txncode`) 
VALUES (@_ee_id, @_ee_name, 'EE', NULL, NULL, @_ee_pin, 0, NULL);
