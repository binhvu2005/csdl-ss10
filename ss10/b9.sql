USE world;
-- 2
create view CountryLanguageView as
select country.Code as CountryCode ,
 country.Name as CountryName,
 countrylanguage.Language as Language,
 countrylanguage.IsOfficial as IsOfficial
 from country
 join countrylanguage ON country.Code = countrylanguage.CountryCode
 where  countrylanguage.IsOfficial = 'T';
 -- 3
 select * from CountryLanguageView ;
 -- 4
 DELIMITER $$

CREATE PROCEDURE GetLargeCitiesWithEnglish ()
BEGIN
  SELECT 
    ct.name as CityName,
    c.Name AS CountryName, 
    SUM(ct.Population) AS TotalPopulation 
  FROM country c
  JOIN city ct ON c.Code = ct.CountryCode
  JOIN countrylanguage cl ON c.Code = cl.CountryCode
  WHERE cl.IsOfficial = 'T'
    AND cl.Language = 'English'
  GROUP BY CityName,CountryName
  HAVING TotalPopulation > 1000000
  ORDER BY TotalPopulation desc
  limit 20;
END $$

DELIMITER ;
 -- 5
CALL GetLargeCitiesWithEnglish();
-- 6
DROP PROCEDURE IF EXISTS GetLargeCitiesWithEnglish;