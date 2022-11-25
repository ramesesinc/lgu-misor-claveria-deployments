
set @_city_pin  = '043-00';
set @_city_name = 'CEBU';



-- 
-- BEGIN PROCESS
-- 
set @_city_id  = replace(@_city_pin,'-','');
set @_city_idx = @_city_pin;

-- 
-- delete previous data
-- 
delete from barangay;
delete from district;
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
VALUES ('CITY', 'CITY', NULL, 'city');

INSERT INTO `sys_orgclass` (`name`, `title`, `parentclass`, `handler`) 
VALUES ('DISTRICT', 'DISTRICT', 'CITY', 'district');

INSERT INTO `sys_orgclass` (`name`, `title`, `parentclass`, `handler`) 
VALUES ('BARANGAY', 'BARANGAY', 'DISTRICT', 'barangay');


-- 
-- insert org
-- 
INSERT INTO `sys_org` (
	`objid`, `name`, `orgclass`, `parent_objid`, `parent_orgclass`, `code`, `root`, `txncode`
) 
VALUES (
	@_city_id, @_city_name, 'CITY', NULL, NULL, @_city_pin, 1, NULL
);


-- 
-- insert city
-- 
INSERT INTO `city` (
	`objid`, `state`, `indexno`, `pin`, `name`, 
	`mayor_name`, `mayor_title`, `mayor_office`, 
	`assessor_name`, `assessor_title`, `assessor_office`, 
	`treasurer_name`, `treasurer_title`, `treasurer_office`, 
	`address`, `fullname`
) 
VALUES (
	@_city_id, 'DRAFT', @_city_idx, @_city_pin, @_city_name, 
	'-', 'CITY MAYOR', 'OFFICE OF THE CITY MAYOR', 
	'-', 'CITY ASSESSOR', 'OFFICE OF THE CITY ASSESSOR', 
	'-', 'CITY TREASURER', 'OFFICE OF THE CITY TREASURER', 
	upper(concat(@_city_name, ' CITY, PHILIPPINES')), 
	upper(concat('CITY OF ', @_city_name))
);
