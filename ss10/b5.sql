use world;
-- 2
DELIMITER $$

CREATE PROCEDURE GetLargeCitiesByCountry(IN country_code VARCHAR(10))
BEGIN
    SELECT ID, Name AS CityName, Population
    FROM City
    WHERE CountryCode = country_code AND Population > 1000000
    ORDER BY Population DESC;
END $$

DELIMITER ;
-- 3
CALL GetLargeCitiesByCountry('USA');
-- 4
DROP PROCEDURE IF EXISTS GetLargeCitiesByCountry;
