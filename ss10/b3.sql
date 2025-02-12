use world;
-- 2
DELIMITER $$

CREATE PROCEDURE GetCountriesByLanguage(IN p_language VARCHAR(50))
BEGIN
    SELECT CountryCode, Language, Percentage
    FROM CountryLanguage
    WHERE Language = p_language AND Percentage > 50;
END $$

DELIMITER ;
-- 3
CALL GetCountriesByLanguage('Spanish');

-- 4
DROP PROCEDURE GetCountriesByLanguage;
