use world;
-- 2
DELIMITER $$

CREATE PROCEDURE CalculatePopulation(IN p_countryCode VARCHAR(10), OUT total_population BIGINT)
BEGIN
    SELECT SUM(Population) INTO total_population
    FROM City
    WHERE CountryCode = p_countryCode;
END $$

DELIMITER ;
-- 3
CALL CalculatePopulation('USA', @total_population);
SELECT @total_population AS TotalPopulation;
-- 4
DROP PROCEDURE  CalculatePopulation;
