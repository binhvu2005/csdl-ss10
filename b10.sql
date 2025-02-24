USE world;
-- 2
create view OfficialLanguageView  as
select country.Code as CountryCode ,
 country.Name as CountryName,
 countrylanguage.Language as Language
 from country
 join countrylanguage ON country.Code = countrylanguage.CountryCode
 where  countrylanguage.IsOfficial = 'T';
 -- 3
 select * from CountryLanguageView ;
-- 4
create index idx_CountryName on city(name);
-- 5
DELIMITER $$

CREATE PROCEDURE GetSpecialCountriesAndCities(IN language_name VARCHAR(50))
BEGIN
  SELECT 
    c.Name AS CountryName, 
    ct.Name AS CityName,
    ct.Population AS CityPopulation,
    SUM(ct.Population) OVER (PARTITION BY c.Code) AS TotalPopulation
  FROM country c
  JOIN city ct ON c.Code = ct.CountryCode
  JOIN countrylanguage cl ON c.Code = cl.CountryCode
  WHERE ct.Name LIKE 'New%' 
    AND cl.Language = language_name
  ORDER BY TotalPopulation DESC
  LIMIT 10;
END $$

DELIMITER ;

-- 6
CALL GetSpecialCountriesAndCities('English');

-- 7
DROP PROCEDURE IF EXISTS GetSpecialCountriesAndCities;