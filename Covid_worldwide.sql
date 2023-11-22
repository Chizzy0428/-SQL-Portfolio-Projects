SELECT * FROM sql_project.covid_worldwide;
-- Added the Column Death_Percentage using the syntax
-- ALTER TABLE sql_project.covid_worldwide
-- ADD COLUMN `Death Percentage` DECIMAL(10,2);
UPDATE sql_project.covid_worldwide
SET `Death_Percentage` = (Total_Deaths / Total_Cases) * 100;

-- looking at the total cases vs the population
-- The Added Column Covid_Percentage Shows what percentage of the population in each country got covid
 ALTER TABLE sql_project.covid_worldwide
ADD COLUMN `Covid_Percentage` DECIMAL(10,2);
UPDATE sql_project.covid_worldwide
SET `Covid_Percentage` = (Total_Cases / Population) * 100;
-- looking at the total recovered vs population
ALTER TABLE sql_project.covid_worldwide
ADD COLUMN `Percentage_Recovered` DECIMAL(10,2);
UPDATE sql_project.covid_worldwide
SET `Percentage_Recovered` = (Total_Recovered / Population) * 100;


-- TO AID VISUALIZATION IN POWER BI 

-- Comparing Total Cases vs Total Deaths showing the likelihood of dying in percentage if one contracts covid in a given country
select Country, Total_Cases, Total_Deaths, (Total_Deaths / Total_Cases) * 100 as Death_Percentage from sql_project.covid_worldwide
order by 1, 2;
-- looking at the countries with the highest infection rate compared to Population
select Country, Population, MAX(Total_Cases) as Highest_Infection_Count, MAX(Total_Cases / Population) * 100 as Percent_Population_Infected from sql_project.covid_worldwide
group by Country, Population
order by Percent_Population_Infected desc ;
-- Showing Countries with the higherst death count per Population
 select Country, MAX(Total_Deaths) as Total_Death_Count from sql_project.covid_worldwide
group by Country
order by Total_Death_Count desc ;
-- Showing The percentage of the population that recovered from covid in the country 
select Country, Total_Recovered, Population, (Total_Recovered / Population) * 100 as Percentage_Recovered from sql_project.covid_worldwide
order by 1, 2;

-- Creating views for easy visualization in Power BI
create view Death_Percentage as select Country, Total_Cases, Total_Deaths, (Total_Deaths / Total_Cases) * 100 as Death_Percentage from sql_project.covid_worldwide
order by 1, 2;

create view Percent_Population_Infected as select Country, Population, MAX(Total_Cases) as Highest_Infection_Count, MAX(Total_Cases / Population) * 100 as Percent_Population_Infected from sql_project.covid_worldwide
group by Country, Population
order by Percent_Population_Infected desc ;

create view Total_Death_Count as select Country, MAX(Total_Deaths) as Total_Death_Count from sql_project.covid_worldwide
group by Country
order by Total_Death_Count desc ;

create view Percentage_Recovered as select Country, Total_Recovered, Population, (Total_Recovered / Population) * 100 as Percentage_Recovered from sql_project.covid_worldwide
order by 1, 2;

