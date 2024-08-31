-- Basic Questions -- 

use world;

show tables;

select * from city;

select * from country;

select * from countrylanguage;

describe city;

select name from city;

SELECT count(*) AS NUM_OF_ROWS from country;

SELECT Name, Population FROM city WHERE name = "abu dhabi";

-- insert into city (ID,Name,CountryCode,District,Population) 
-- values
-- (500,"xyz","fdf300","ohhd",382712334),
-- (600,"abc","ioheh78","thgegh",69790342);


-- DELETE FROM city WHERE Name = "xyz";


-- update city
-- set Population = 54333223112222
-- where Name = 'abc';


select Continent, Name as Countries from country 
where Continent = "europe";

select 
country.Name, 
city.Name as Capital_city 
from country 
join city on city.CountryCode = country.Code	
where city.ID = country.Capital;

select 
country.Name as country,
countrylanguage.Language
from 
countrylanguage
join country on country.Code = countrylanguage.CountryCode
where country.Name = 'hong kong';

select 
country.Name as country,
countrylanguage.Language as official_language
from 
countrylanguage
join country on country.Code = countrylanguage.CountryCode
where country.Name = 'hong kong' AND countrylanguage.IsOfficial = 'T';

select 
Name as country,
Population 
from country
where Population > 100000000;

select 
Continent,
Name as Country
from country
where Continent = "asia";


-- Intermediate Questions --

Select avg(Population) as Average_population_of_all_cities from city;

select Name as Country, Population as Total_population from country
where country.Name = 'australia';

select 
country.Name as Country,
count(city.Name) as Total_no_of_cities
from 
country
join city on country.Code = city.CountryCode
group by country.Name;

select Name as Country, Population from country
order by Population desc
limit 5;

select Name as City, Population from city
order by Population
limit 1;

select Name as country, LifeExpectancy from country where LifeExpectancy>80;

Select Name as country, GNP from country Where GNP > 1000000000000;

SELECT Name, IndepYear FROM country WHERE IndepYear > 1950
ORDER BY IndepYear;

select 
country.Name as country,
count(countrylanguage.IsOfficial) as num_of_official_languages
from 
countrylanguage
join country on country.Code = countrylanguage.CountryCode
where countrylanguage.IsOfficial = 'T'
group by CountryCode
having num_of_official_languages > 1;

select District,Name as City from city 
where District = "California";

select 
country.Name as country,
(Population/SurfaceArea) as "Population density"
from country
order by (Population/SurfaceArea) desc;

SELECT 
country.Name as country,
(Population/SurfaceArea) as Population_density
from country
order by Population_density asc;

select Name as countries, GNP/Capital as GDP_per_capita from country
order by GDP_per_capita desc;

select Name as countries, GNP/Capital as GDP_per_capita from country
order by GDP_per_capita;

select 
country.Name as countries,
count(countrylanguage.Language) as no_of_official_languages
from country
join countrylanguage on countrylanguage.CountryCode = country.Code
where countrylanguage.IsOfficial = "T"
group by countries
having no_of_official_languages > 5;

select 
Name as country, LifeExpectancy from country 
order by LifeExpectancy desc;

select 
Name as country, LifeExpectancy from country 
order by LifeExpectancy;

select
country.Name as Country,
count(city.Name) as num_of_cities
from 
city
inner join country on country.Code = city.CountryCode
group by country order by num_of_cities  desc;

select
country.Name as Country,
count(*) as num_of_cities
from 
city
inner join country on country.Code = city.CountryCode
group by country order by num_of_cities;

SELECT 
country.Name AS Country,
COUNT(Language) AS Num_of_languages
FROM 
country
JOIN countrylanguage ON countrylanguage.CountryCode = country.Code
GROUP BY Country ORDER BY Num_of_languages DESC;



-- Advanced Questions --

Select 
country.Name as country,
country.Population,
countrylanguage.Language as Official_language
From
country
Join countrylanguage On countrylanguage.CountryCode = country.Code
Where countrylanguage.Language = "English" And countrylanguage.IsOfficial = "T";

select Name as Cities, Population 
from city
order by population desc
limit 5;

select
Name as country,
(GNP-GNPOld)/GNPOld * 100 as GDP_growth_rate
from country
WHERE (GNP-GNPOld)/GNPOld * 100 > 2
order by (GNP-GNPOld)/GNPOld * 100;
-- OR --
select
Name as country,
(GNP-GNPOld)/GNPOld * 100 as GDP_growth_rate
from country
HAVING GDP_growth_rate > 2
order by GDP_growth_rate;

select
country.Name as Country,
count(countrylanguage.Language) as Num_of_official_languages
from country
JOin countrylanguage on country.Code = countrylanguage.CountryCode
where countrylanguage.IsOfficial = 'T'
group by country.Name
order by Num_of_official_languages desc;

select
country.Name as Country,
count(countrylanguage.Language) as Num_of_diverse_languages
from country
Join countrylanguage on countrylanguage.CountryCode = country.Code
group by country.Name
order by Num_of_diverse_languages desc;

SELECT
	country.Name as Country,
	Count(*) as No_of_cities_with_over_1_Million_Population
FROM
	city
JOIN
	country ON country.Code = city.CountryCode
WHERE 
	city.Population > 1000000
GROUP BY 
	country.Name
ORDER BY No_of_cities_with_over_1_Million_Population DESC;

SELECT 
	country.Name AS COUNTRY,
    COUNT(city.ID) AS No_of_cities_with_under_1_Million_Population
FROM
	city
JOIN 
	country ON country.Code = city.CountryCode
WHERE 
	city.Population < 1000000
GROUP BY
	country.Name
ORDER BY 
	No_of_cities_with_under_1_Million_Population DESC;
    
select 
	country.Name AS country,
    count(city.Name) AS No_of_cities_betn_500000_1000000_Population
from 
	city
join 
	country ON country.Code = city.CountryCode
where
	city.Population BETWEEN 500000 AND 1000000
group by
	country	
order by No_of_cities_betn_500000_1000000_Population desc;    
    
select 
	country.Name as country,
    count(city.Population) as No_of_cities_betn_100000_500000_Population
from 
	city
join 
	country on country.Code = city.CountryCode
where
	city.Population between 100000 and 500000
group by
	country	
order by 
	No_of_cities_betn_100000_500000_Population desc;
    
select 
country.Name as country,
count(city.Name) as No_of_cities_with_population_under_100000
from country
join city on city.CountryCode=country.Code
where city.Population < 100000
group by country.Name
order by count(city.Name) desc;

select 
country.Name as country,
count(city.Name) as No_of_cities_with_population_over_10_Million
from country
join city on city.CountryCode=country.Code
where city.Population > 10000000
group by country
order by No_of_cities_with_population_over_10_Million desc;

select 
country.Name as country,
count(city.Population) as 'No of cities with population under 10 Million'
from country
join city on city.CountryCode = country.Code
where city.Population < 10000000
group by COUNTRY
order by count(city.Population) desc;

SELECT 
	COUNTRY.Name AS Country,
	COUNT(*) AS No_of_cities_betn_1_Million_and_10_Million
FROM country
JOIN city ON CITY.CountryCode = country.Code
WHERE 
	city.Population BETWEEN 1000000 AND 10000000
GROUP BY Country
ORDER BY No_of_cities_betn_1_Million_and_10_Million DESC;

SELECT 
	COUNTRY.Name AS COUNTRY_NAMES,
	COUNT(*) AS "No of cities betn 500,000_and_1_Million"
FROM country
JOIN city ON CITY.CountryCode = country.Code
WHERE 
	city.Population BETWEEN 500000 AND 1000000
GROUP BY country_names
ORDER BY COUNT(*);

