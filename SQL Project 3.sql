CREATE database project_3
use project_3

/* 
Context : This is a historical dataset on the modern Olympic Games, including all the Games from Athens 1896 to Rio 2016.

Content : The file athlete_events.csv contains 271116 rows and 15 columns. Each row corresponds to an individual athlete, 
competing in an individual Olympic event (athlete-events). 

The columns are:
ID - Unique number for each athlete
Name - Athlete's name
Sex - M or F
Age - Integer
Height - In centimeters
Weight - In kilograms
Team - Team name
NOC - National Olympic Committee 3-letter code
Games - Year and season
Year - Integer
Season - Summer or Winter
City - Host city
Sport - Sport
Event - Event
Medal - Gold, Silver, Bronze, or NA
*/
 
/* Q.No 1: How many olympics games have been held?*/
SELECT COUNT(DISTINCT games) AS Total_Olympic_Games FROM athlete_events

/* Q.No 2: List down all Olympics games held so far.*/
SELECT DISTINCT games FROM athlete_events ORDER BY games

/* Q.No 3: Mention the nations who participated in olympics*/
SELECT DISTINCT region FROM noc_regions 

/* Q.No 4: What are the various sports involved in olympics*/
SELECT DISTINCT sport FROM athlete_events

/* Q.No 5: Identify the total number of games which were played in 2016 summer olympics.*/
SELECT COUNT(DISTINCT games) FROM athlete_events WHERE season = 'summer'

/* Q.No 6: Identify the games which were played in all summer olympics.*/
SELECT games,year FROM athlete_events WHERE season='summer' ORDER BY year

/* Q.No 7: Fetch the total no of sports played in each olympic games.*/
SELECT COUNT(DISTINCT sport) FROM athlete_events

/* Q.No 8:Identify the sport and corresponding event from the Olympics.*/
SELECT DISTINCT Sport, Event FROM athlete_events

/* Q.No 9: Fetch oldest athletes of gender equals Male.*/
SELECT ID,name,sex,age FROM athlete_events WHERE sex='M' and sport='Judo' and age>40

/* Q.No 10: Identify the name of the players whose name starts with sam and end with e along with their sport in the olympics.*/
SELECT DISTINCT name,sport FROM athlete_events WHERE name LIKE 'Sam%E'

/* Q.No 11: Fetch the sports where athletes who have weight in between 120 and 125.*/
SELECT DISTINCT sport, weight FROM athlete_events WHERE weight BETWEEN 120 AND 125

/* Q.No 12: Fetch the average weight of the athletes.*/
SELECT AVG(weight) FROM athlete_events

/* Q.No 13: Fetch the top 5 most successful countries in olympics. Success is defined by no of sports played.*/
SELECT Team, COUNT(sport) AS Total_sport FROM athlete_events GROUP BY Team ORDER BY total_sport DESC LIMIT 5

/* Q.No 14: List down total gold, silver and bronze medals won by each country.*/
SELECT DISTINCT COUNT(medal) AS medals,medal FROM athlete_events GROUP BY medal 

/* Q.No 15: Fetch total number of gold medals India has won.*/
Select Team,COUNT(medal) AS Gold_medals FROM athlete_events WHERE Team ='India' and medal = 'Gold'
