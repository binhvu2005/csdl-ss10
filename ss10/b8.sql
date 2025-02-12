USE world;
-- 2
DELIMITER $$

CREATE PROCEDURE GetCountriesByCityNames()
BEGIN
  SELECT 
    c.Name AS CountryName, 
    cl.Language AS OfficialLanguage,
    SUM(ct.Population) AS TotalPopulation 
  FROM country c
  JOIN city ct ON c.Code = ct.CountryCode
  JOIN countrylanguage cl ON c.Code = cl.CountryCode
  WHERE cl.IsOfficial = 'T'
    AND ct.Name LIKE 'A%'
  GROUP BY c.Name, cl.Language
  HAVING TotalPopulation > 2000000
  ORDER BY CountryName ASC;
END $$

DELIMITER ;

-- 3
CALL GetCountriesByCityNames();

-- 4
DROP PROCEDURE IF EXISTS GetCountriesByCityNames;
