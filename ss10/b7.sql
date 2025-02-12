USE world;
-- 2
DELIMITER $$

CREATE PROCEDURE GetEnglishSpeakingCountriesWithCities (IN language VARCHAR(50))
BEGIN
  SELECT 
    c.Name AS CountryName, 
    SUM(ct.Population) AS TotalPopulation 
  FROM country c
  JOIN city ct ON c.Code = ct.CountryCode
  JOIN countrylanguage cl ON c.Code = cl.CountryCode
  WHERE cl.Language = language 
    AND cl.IsOfficial = 'T' 
  GROUP BY c.Name
  HAVING TotalPopulation > 5000000
  ORDER BY TotalPopulation DESC
  LIMIT 5;
END $$

DELIMITER ;

-- 3
CALL GetEnglishSpeakingCountriesWithCities('English');

-- 4
DROP PROCEDURE IF EXISTS GetEnglishSpeakingCountriesWithCities;
