# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
SELECT * FROM `city` WHERE `Name` LIKE "ping %"  ORDER BY `Population` ASC;

#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
SELECT *FROM `city` WHERE `Name` LIKE "ran%" ORDER BY `Population` DESC ;

#
# 3: Count all cities
SELECT COUNT(*) FROM `city` ;

#
# 4: Get the average population of all cities
SELECT AVG(`Population`) FROM `city` ;

#
# 5: Get the biggest population found in any of the cities
SELECT MAX(`Population`) FROM `city`;
#
# 6: Get the smallest population found in any of the cities
SELECT MIN(`Population`) FROM `city`;

#
# 7: Sum the population of all cities with a population below 10000
SELECT SUN(`population`) FROM `city` WHERE `population` <10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
SELECT COUNT(*) FROM `city` WHERE `CountryCode` IN("moz","VNM");
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
SELECT COUNT(*),`CountryCode`FROM `city`WHERE `CountryCode` IN("MOZ"," VNM") GROUP BY `CountryCode`;
#
# 10: Get average population of cities in MOZ and VNM
SELECT AVG(`Population`) FROM `city` WHERE `CountryCode` IN("MOZ","VNM");
#
# 11: Get the countrycodes with more than 200 cities
select `CountryCode` FROM `city` GROUP BY `CountryCode` HAVING COUNT(`CountryCode`) > 200;
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
SELECT `CountryCode`, COUNT(`CountryCode`)as cnt FROM `city` group by `CountryCode` HAVING COUNT(`CountryCode`) > 200 ORDER BY cnt;
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
SELECT DISTINCT(P. Language) FROM `city` s JOIN `countrylanguage` p ON s. `CountryCode` = P. `co` WHERE s. `population` BETWEEN 400 AND 500;
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
SELECT S.NAME , P. `language` FROM `city` s JOIN `countrylanguage` p ON s.`CountryCode` = p. `CountryCode` WHERE s . `Population` BETWEEN 500 AND 600;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
SELECT `Name` FROM `city` WHERE `CountryCode` = (SELECT `CountryCode` FROM `city` WHERE `population` = 122199);
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
SELECT `Name` FROM `city` WHERE `CountryCode` = (SELECT `CountryCode` FROM `city` WHERE `population` = 122199) AND NOT `Name` =(SELECT `Name` FROM `city` WHERE 'POPULATION' = 122199);
#
# 17: What are the city names in the country where Luanda is capital?
SELECT `Name` FROM `city` WHERE `CountryCode` = (SELECT `CountryCode` from country t JOIN  `city` C ON c.ID = `Capital` WHERE c.Name= "Luanda");
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT C. Name FROM country JOIN `city` c ON c.ID = `Capital` WHERE `Region` = ( SELECT `Region` FROM `city` c JOIN `countrylanguage` t ON C. `CountryCode` = t.`code` WHERE C. `Name`= "Yaren");

#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT(C.Language ) FROM country JOIN `countrylanguage` c ON c.`CountryCode` = `code` WHERE `Region` = (SELECT `Region` FROM `city` c JOIN `country` t ON.`code` WHERE  C. `Name` = "Riga");
#
# 20: Get the name of the most populous city

SELECT `Name` FROM CITY ORDER BY `population` DESC LIMIT  1;
