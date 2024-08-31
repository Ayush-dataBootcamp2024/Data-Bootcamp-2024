use world;

show tables;

-- 1 Select all countries from the world database and order them by population in descending order.
select name, Population from country
order by Population desc;

-- 2 Retrieve the names of cities with a population greater than 1 million, ordered alphabetically.
select Name,POPULATION from city
where population > 1000000
order by name ;

-- 4 Find the names of countries with a GDP greater than $100,000, ordered by GDP.
Select NAME, GNP from Country
WHEre GNP > 100000
   ORDER by gnp;
  
-- 5 Select the top 10 most populous cities and order them by population.
SELECT Name, Population FROM CITY 
ORDER BY POPULATION DESC 
limit 10;


-- 6 Retrieve all countries in South America and order them by area.
select Continent, Name, SurfaceArea from country
where Continent = 'South America'
order by SurfaceArea desc;

-- 7 Find the names of countries with a life expectancy less than 70 years, ordered by life expectancy.
SELECT NAME, lifeExpectancy from COUNTRY
WHERE LifeExpectancy<70
ORDER BY lifeexpectancy;



-- Counting the number of rows in any table
SELECT COUNT(*) AS No_of_rows FROM COUNTRY;


-- 3 List all continents and order them by the number of countries in each continent.
select Continent, count(*) as num_of_countries from country
group by Continent
order by num_of_countries desc;


select name,continent from country
where Continent="europe";

select count(*) from country
where Continent="Asia";


--  List all country codes and order them by the number of districts in each country code from the city table.
Select CountryCode, count(*) as Num_of_cities from city
group by countrycode
ordeR by nUM_of_cities desc
limit 10;

select CountryCode, count(distinct District) as Num_of_districts from city
group by CountryCode
order by num_of_districts desc
limit 10;


-- 8 List all cities in China and order them by population in descending order.
select name, COUNTRYCODE, Population from city
WHERE CountryCode="CHN"
order by population desc;

SELECT NAME,CountryCode FROM CITY
WHERE NAME = 'CHINA';

