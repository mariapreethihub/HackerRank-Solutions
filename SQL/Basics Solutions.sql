
# CREATING DATABASE PLACES
create database places;
use places;

# CREATING TABLE CITY
create table city(
ID int,NAME VARCHAR(10),COUNTRYCODE VARCHAR(3),DISTRICT VARCHAR(10),POPULATION int);

desc city;

#INSERITNG VALUES INTO THE TABLE CITY
insert into city(ID,NAME,COUNTRYCODE,DISTRICT,POPULATION) values 
(1,'Dallas','USA','Dallas',1340000),
 (2,'Phoenix','USA','Maricoppa',1660000),
 (3,'Chicago','USA','Cook',2700000),
 (4,'Burlington','USA','Chittenden',45000),
 (5,'Santa Fe','USA','Santa Fe',84000),
 (6,'Kochi','IND','Ernakulam',8258035),
 (7,'Bangalore','IND','Bangalore',8443675),
(8,'Shimla','IND','HP',78000),
(9,'Dali','CHI','Dali',79000),
(10,'Suzhou','CHI','Gusu',1300000);

#CREATING TABLE STATION
create table STATION(
ID int,CITY VARCHAR(21),STATE VARCHAR(2),LAT_N float,LONG_W float);

# INSERTING VALUES INTO THE TABLE STATION
insert into STATION(ID,CITY,STATE,LAT_N,LONG_W) values
(1, 'Atlanta','GA', 33.7490, 84.3880), 
(2, 'Austin','TX', 30.2672, 97.7431),
(3, 'Echo','CA', 34.0522, 118.2437),
(4, 'Dallas','TX', 32.7767, 96.7970),
(5, 'Indianapolis','IN', 39.7684, 86.1581),
(6, 'Omaha','NE', 41.2565, 95.9345),
(7, 'Reno','NV', 39.5296, 119.8138),
(8, 'El Paso','TX', 31.7619,106.4850);


# CREATING TABLE STUDENTS 
create table students(
ID int, Name char(10),Marks int);

# INSERTING VALUES INTO TABLE
insert into students(ID,Name,Marks) values(1,'Bobby',76),
(2,'Jobby',76),
(3,'Sam',80),
(4,'George',74),
(5,'John',77);


# CREATING TABLE EMPLOYEE
create table Employee(
emplloyee_id int,name char(10),months int,salary float);

insert into Employee(emplloyee_id,name,months,salary) values
(1,'John',11,1000),
(2,'Mark',10,2000),
(3,'Peter',9,3000),
(4,'Joseph',8,1500);
---------------------------------------------------------------------------------------------------------
# Problem 1:
# Query all columns for all American cities in the CITY table with populations larger than 100000. 
# The CountryCode for America is USA.

select * from city where COUNTRYCODE='USA' and POPULATION >100000;

---------------------------------------------------------------------------------------------------------
# Problem 2:
# Query the NAME field for all American cities in the CITY table with populations larger than 120000. 
# The CountryCode for America is USA.
   
select NAME from city where COUNTRYCODE='USA' and POPULATION >120000;

---------------------------------------------------------------------------------------------------------
#Problem 3:
# Query all columns (attributes) for every row in the CITY table.

select * from city;

---------------------------------------------------------------------------------------------------------
#Problem 4:
# Query all columns for a city in CITY with the ID 1.

select * from city where ID =1;
---------------------------------------------------------------------------------------------------------
#Problem 5:
# Query all attributes of every Chinese city in the CITY table. The COUNTRYCODE for China is CHI.

select * from city where COUNTRYCODE ='CHI';
---------------------------------------------------------------------------------------------------------
#Problem 6:
# Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

select NAME from city where COUNTRYCODE ='CHI';
---------------------------------------------------------------------------------------------------------
# Problem 7:
# Query a list of CITY and STATE from the STATION table.

select  CITY,STATE from STATION;
--------------------------------------------------------------------------------------------------------
# Problem 8:
# Query a list of CITY names from STATION for cities that have an even ID number.
# Print the results in any order, but exclude duplicates from the answer.

select CITY from STATION where ID%2=0;

-------------------------------------------------------------------------------------------------------
# Problem 9:
# Find the difference between the total number of CITY entries in the table and the number
# of distinct CITY entries in the table.


select count(CITY) -count(distinct(CITY)) from STATION;
--------------------------------------------------------------------------------------------------------
# Problem 10:
# Query the two cities in STATION with the shortest and longest CITY names, 
# as well as their respective lengths (i.e.: number of characters in the name). 
# If there is more than one smallest or largest city, choose the one that comes 
# first when ordered alphabetically.

(select CITY,length(CITY) AS name_length from STATION ORDER BY name_length,CITY LIMIT 1)
UNION
(select CITY,length(CITY) AS name_length from STATION ORDER BY name_length DESC,CITY DESC LIMIT 1);
---------------------------------------------------------------------------------------------------------
# Problem 11:
# Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
# Your result cannot contain duplicates.


select DISTINCT CITY from STATION where CITY LIKE 'a%' or CITY LIKE 'e%' or CITY LIKE 'i%' or CITY LIKE 'o%' or CITY LIKE 'u%';

#OR

select DISTINCT CITY from STATION where LEFT(CITY,1) IN ('A','E','I','O','U');
---------------------------------------------------------------------------------------------------------
# Problem 12:
# Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
# Your result cannot contain duplicates.


select DISTINCT CITY from STATION where CITY LIKE '%A' OR CITY LIKE'%E'OR CITY LIKE '%I'OR CITY LIKE'%O'OR CITY LIKE'%U';
 
 # OR
 
 select DISTINCT CITY from STATION where RIGHT(CITY,1) in ('A','E','I','O','U');
---------------------------------------------------------------------------------------------------------
# Problem 13:
# Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as
# both their first and last characters. 
# Your result cannot contain duplicates.

select DISTINCT CITY from STATION where (CITY LIKE '%A' OR CITY LIKE'%E'OR CITY LIKE '%I'OR
 CITY LIKE'%O'OR CITY LIKE'%U') AND (CITY LIKE 'a%' or CITY LIKE 'e%' or CITY LIKE 
'i%' or CITY LIKE 'o%' or CITY LIKE 'u%');
  # OR
 
 select DISTINCT CITY from STATION where RIGHT(CITY,1) in ('A','E','I','O','U') AND LEFT(CITY,1) in ('A','E','I','O','U');

---------------------------------------------------------------------------------------------------------
# Problem 14:
# Query the list of CITY names from STATION that do not start with vowels. 
# Your result cannot contain duplicates.

select DISTINCT CITY from STATION where CITY NOT LIKE 'A%' AND CITY NOT LIKE 'E%' AND 
CITY NOT LIKE 'I%' AND CITY NOT LIKE 'O%' AND CITY NOT LIKE 'U%';

#OR

select DISTINCT CITY from STATION where LEFT (CITY,1) NOT IN ('A','E','I','O','U');
---------------------------------------------------------------------------------------------------------
# Problem 15:
# Query the list of CITY names from STATION that do not end with vowels. 
# Your result cannot contain duplicates.

select DISTINCT CITY from STATION where CITY NOT LIKE '%A' AND CITY NOT LIKE '%E' AND 
CITY NOT LIKE '%I' AND CITY NOT LIKE '%O' AND CITY NOT LIKE '%U';

#OR

select DISTINCT CITY from STATION where RIGHT (CITY,1) NOT IN ('A','E','I','O','U');

---------------------------------------------------------------------------------------------------------
# Problem 16:
# Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels.
# Your result cannot contain duplicates.

select DISTINCT CITY from STATION where (CITY NOT LIKE '%A' AND CITY NOT LIKE'%E'AND CITY NOT LIKE '%I'AND
 CITY NOT LIKE'%O'AND CITY NOT LIKE'%U') OR ( CITY NOT LIKE 'A%' AND CITY NOT LIKE 'E%' AND CITY NOT 
 LIKE 'I%' AND CITY NOT LIKE 'O%' AND CITY NOT LIKE 'U%');
 
  # OR
 
 select DISTINCT CITY from STATION where RIGHT(CITY,1) NOT in ('A','E','I','O','U') or LEFT(CITY,1) NOT in ('A','E','I','O','U');

---------------------------------------------------------------------------------------------------------
# Problem 17:
# Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. 
# Your result cannot contain duplicates.

select DISTINCT CITY from STATION where (CITY NOT LIKE '%A' AND CITY NOT LIKE'%E'AND CITY NOT LIKE '%I'AND
 CITY NOT LIKE'%O'AND CITY NOT LIKE'%U') AND ( CITY NOT LIKE 'A%' AND CITY NOT LIKE 'E%' AND CITY NOT 
 LIKE 'I%' AND CITY NOT LIKE 'O%' AND CITY NOT LIKE 'U%');
 
  # OR
 
 select DISTINCT CITY from STATION where RIGHT(CITY,1) NOT in ('A','E','I','O','U') AND LEFT(CITY,1) NOT in ('A','E','I','O','U');

---------------------------------------------------------------------------------------------------------
# Problem 18:
# Query the Name of any student in STUDENTS who scored higher than  75 Marks. Order your output by the last 
# three characters of each name. If two or more students both have names ending in the same last three 
# characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

select Name from students where Marks >75 order by right(Name,3),ID asc; 

---------------------------------------------------------------------------------------------------------
# Problem 19:
# Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table 
# in alphabetical order.

select name from Employee order by name asc;
---------------------------------------------------------------------------------------------------------
# Problem 20:
# Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee 
# having a salary greater than USD 2000 per month who have been employees for less than 10 months. Sort your result
# by ascending employee_id.

select name from Employee where salary >2000 and months <10 order by emplloyee_id asc;

---------------------------------------------------------------------------------------------------------