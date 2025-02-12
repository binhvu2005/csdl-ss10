USE world;
-- 2
DELIMITER $$

CREATE PROCEDURE GetCountriesWithLargeCitie()
BEGIN
  SELECT 
    c.Name AS CountryName, 
    SUM(ct.Population) AS TotalPopulation 
  FROM country c
  JOIN city ct ON c.Code = ct.CountryCode
  GROUP BY c.Name
  ORDER BY TotalPopulation DESC;
END $$

DELIMITER ;

-- 3
CALL GetCountriesWithLargeCitie();

-- 4
DROP PROCEDURE IF EXISTS GetCountriesWithLargeCitie;
