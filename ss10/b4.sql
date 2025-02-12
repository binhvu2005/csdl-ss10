use world;
-- 2
DELIMITER $$

CREATE PROCEDURE UpdateCityPopulation(INOUT city_id INT, IN new_population BIGINT)
BEGIN
    UPDATE City
    SET Population = new_population
    WHERE ID = city_id;

    SELECT ID, Name, Population
    FROM City
    WHERE ID = city_id;
END $$

DELIMITER ;
-- 3
SET @city_id = 100; 
CALL UpdateCityPopulation(@city_id, 1500000);
-- 4
DROP PROCEDURE  UpdateCityPopulation;
