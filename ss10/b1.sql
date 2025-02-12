use world;
-- 2
DELIMITER $$
CREATE PROCEDURE GetCitiesByCountry(IN country_code VARCHAR(10))
BEGIN
    SELECT ID, Name, Population 
    FROM City
    WHERE CountryCode = country_code;
END $$

DELIMITER ;
-- 3
CALL GetCitiesByCountry('USA');
-- 4
DROP PROCEDURE  GetCitiesByCountry;
