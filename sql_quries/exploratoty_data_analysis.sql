-- Updating column "hour"

UPDATE public."yearly-divvy-tripdata"
SET hour = EXTRACT(HOUR FROM started_at);

/*

Analyzing the difference in number of rides between members and casual riders

*/
-- Number of rides in "yearly-divvy-tripdata"

SELECT member_casual, COUNT(*)
FROM public."yearly-divvy-tripdata"
GROUP BY member_casual;
/*

member_casual | count  |
--------------+--------+
casual        | 2336532|
--------------+--------+
member        | 2745261|
------------------------

*/
-- Number of rides in every month

SELECT year, month, member_casual, COUNT(*)
FROM public."yearly-divvy-tripdata"
GROUP BY year,month, member_casual
ORDER BY year ASC,
EXTRACT(MONTH FROM TO_DATE(month, 'Month')) ASC;
/*

|year    |month    |member_casual|count   |
+--------+---------+-------------+--------+
|2020    |October  |casual       |142561  |
+--------+---------+-------------+--------+
|2020    |October  |member       |239095  |
+--------+---------+-------------+--------+
|2020    |November |casual       |87080   |
+--------+---------+-------------+--------+
|2020    |November |member       |169177  |
+--------+---------+-------------+--------+
|2020    |December |casual       |29774   |
+--------+---------+-------------+--------+
|2020    |December |member       |100254  |
+--------+---------+-------------+--------+
|2021    |January  |casual       |17939   |
+--------+---------+-------------+--------+
|2021    |Jenuary  |member       |77986   |
+--------+---------+-------------+--------+
|2021    |February |casual       |10041   |
+--------+---------+-------------+--------+
|2021    |Febuary  |member       |38988   |
+--------+---------+-------------+--------+
|2021    |March    |casual       |83475   |
+--------+---------+-------------+--------+
|2021    |March    |member       |143112  |
+--------+---------+-------------+--------+
|2021    |April    |casual       |135567  |
+--------+---------+-------------+--------+
|2021    |April    |member       |198452  |
+--------+---------+-------------+--------+
|2021    |May      |member       |271446  |
+--------+---------+-------------+--------+
|2021    |May      |casual       |254602  |
+--------+---------+-------------+--------+
|2021    |June     |casual       |367002  |
+--------+---------+-------------+--------+
|2021    |June     |member       |354831  |
+--------+---------+-------------+--------+
|2021    |July     |member       |376123  |
+--------+---------+-------------+--------+
|2021    |July     |casual       |438208  |
+--------+---------+-------------+--------+
|2021    |August   |casual       |409341  |
+--------+---------+-------------+--------+
|2021    |August   |member       |387615  |
+--------+---------+-------------+--------+
|2021    |September|member       |388182  |
+--------+---------+-------------+--------+
|2021    |September|casual       |360942  |
+--------+---------+-------------+--------+

*/

-- Removing extra spaces from column "day_of_week"

UPDATE public."yearly-divvy-tripdata"
SET day_of_week = TRIM(TRAILING FROM day_of_week);

-- Number of rides in each week day

SELECT day_of_week, member_casual, COUNT(*)
FROM public."yearly-divvy-tripdata"
GROUP BY day_of_week, member_casual
ORDER BY 
CASE day_of_week
WHEN 'Sunday' THEN 1
WHEN 'Monday' THEN 2
WHEN 'Tuesday' THEN 3
WHEN 'Wednesday' THEN 4
WHEN 'Thusday' THEN 5
WHEN 'Friday' THEN 6
ELSE 7
END ASC;
/*

day_of_week|member_casual|count  |
-----------+-------------+-------+
Sunday     |casual       |441246 |
-----------+-------------+-------+
Sunday     |member       |340920 |
-----------+-------------+-------+
Monday     |casual       |264095 |
-----------+-------------+-------+
Monday     |member       |371642 |
-----------+-------------+-------+
Tuesday    |member       |402587 |
-----------+-------------+-------+
Tuesday    |casual       |249112 |
-----------+-------------+-------+
Wednesday  |member       |418239 |
-----------+-------------+-------+
Wednesday  |casual       |254773 |
-----------+-------------+-------+
Friday     |member       |400811 |
-----------+-------------+-------+
Friday     |casual       |335963 |
-----------+-------------+-------+
Thursday   |casual       |272065 |
-----------+-------------+-------+
Thursday   |member       |415946 |
-----------+-------------+-------+
Saturday   |casual       |519278 |
-----------+-------------+-------+
Saturday   |member       |395116 |
-----------+-------------+-------+

*/
-- Number of rides in each hour

SELECT hour, member_casual, COUNT(*)
FROM public."yearly-divvy-tripdata"
GROUP BY hour, member_casual
ORDER BY hour;
/*

hour |member_casual|count  |
-----+-------------+-------+
0    |casual       |48073  |
-----+-------------+-------+
0    |member       |27321  |
-----+-------------+-------+
1    |casual       |34537  |
-----+-------------+-------+
1    |member       |17724  |
-----+-------------+-------+
2    |casual       |22031  |
-----+-------------+-------+
2    |member       |10098  |
-----+-------------+-------+
3    |casual       |12220  |
-----+-------------+-------+
3    |member       |5786   |
-----+-------------+-------+
4    |casual       |8688   |
-----+-------------+-------+
4    |member       |6953   |
-----+-------------+-------+
5    |casual       |10751  |
-----+-------------+-------+
5    |member       |26032  |
-----+-------------+-------+
6    |casual       |22738  |
-----+-------------+-------+
6    |member       |74432  |
-----+-------------+-------+
7    |casual       |40445  |
-----+-------------+-------+
7    |member       |132574 |
-----+-------------+-------+
8    |casual       |55806  |
-----+-------------+-------+
8    |member       |148382 |
-----+-------------+-------+
9    |casual       |68027  |
-----+-------------+-------+
9    |member       |114867 |
-----+-------------+-------+
10   |casual       |95128  |
-----+-------------+-------+
10   |member       |115581 |
-----+-------------+-------+
11   |casual       |125240 |
-----+-------------+-------+
11   |member       |141071 |
-----+-------------+-------+
12   |casual       |151806 |
-----+-------------+-------+
12   |member       |165276 |
-----+-------------+-------+
13   |casual       |162956 |
-----+-------------+-------+
13   |member       |162693 |
-----+-------------+-------+
14   |casual       |168846 |
-----+-------------+-------+
14   |member       |161586 |
-----+-------------+-------+
15   |casual       |177558 |
-----+-------------+-------+
15   |member       |183315 |
-----+-------------+-------+
16   |casual       |193541 |
-----+-------------+-------+
16   |member       |233641 |
-----+-------------+-------+
17   |casual       |222117 |
-----+-------------+-------+
17   |member       |289943 |
-----+-------------+-------+
18   |casual       |199236 |
-----+-------------+-------+
18   |member       |246547 |
-----+-------------+-------+
19   |casual       |153987 |
-----+-------------+-------+
19   |member       |175255 |
-----+-------------+-------+
20   |casual       |113359 |
-----+-------------+-------+
20   |member       |116251 |
-----+-------------+-------+
21   |casual       |94634  |
-----+-------------+-------+
21   |member       |83215  |
-----+-------------+-------+
22   |casual       |87564  |
-----+-------------+-------+
22   |member       |63185  |
-----+-------------+-------+
23   |casual       |67244  |
-----+-------------+-------+
23   |member       |43533  |
-----+-------------+-------+

*/

-- Analyzing difference in average ride length between member and casual riders
-- Average ride length in a year(Oct 2020 - Sep 2021)

SELECT member_casual, ROUND(AVG(ride_length),2)
FROM public."yearly-divvy-tripdata"
GROUP BY member_casual;
/*

member_casual|round |
-------------+------+
casual       | 33.14|
-------------+------+
member       | 14.33|
-------------+------+

*/
-- Average ride length in each month
SELECT year, month, member_casual, ROUND(AVG(ride_length),2)
FROM public."yearly-divvy-tripdata"
GROUP BY year, month, member_casual
ORDER BY year ASC,
EXTRACT(MONTH FROM TO_DATE(month, 'Month')) ASC;
/*

year    |month      |member_casual|round  |
--------+-----------+-------------+-------+
2020	|October    |casual       |	30.68 |
--------+-----------+-------------+-------+
2020	|October    |member	      | 14.24 |
--------+-----------+-------------+-------+
2020	|November   |casual       |	32.13 |
--------+-----------+-------------+-------+
2020	|November   |member       |	13.74 |
--------+-----------+-------------+-------+
2020	|December   |casual       |	27.06 |
--------+-----------+-------------+-------+
2020	|December   |member       |	12.87 |
--------+-----------+-------------+-------+
2021	|January    |casual       |	25.95 |
--------+-----------+-------------+-------+
2021	|January    |member       |	13.00 |
--------+-----------+-------------+-------+
2021	|February   |casual       |	49.83 |
--------+-----------+-------------+-------+
2021    |February   |member       |	18.26 |
--------+-----------+-------------+-------+
2021	|March      |casual       |	38.42 |
--------+-----------+-------------+-------+
2021	|March      |member       |	14.11 |
--------+-----------+-------------+-------+
2021	|April      |casual       |	38.32 |
--------+-----------+-------------+-------+
2021	|April      |member       |	14.86 |
--------+-----------+-------------+-------+
2021	|May        |member       |	14.82 |
--------+-----------+-------------+-------+
2021	|May        |casual       |	38.59 |
--------+-----------+-------------+-------+
2021	|June       |casual       |	37.50 |
--------+-----------+-------------+-------+
2021	|June       |member       |	14.85 |
--------+-----------+-------------+-------+
2021	|July       |member       |	14.41 |
--------+-----------+-------------+-------+
2021	|July       |casual       |	33.09 |
--------+-----------+-------------+-------+
2021	|August     |casual       |	29.03 |
--------+-----------+-------------+-------+
2021	|August     |member       |	14.26 |
--------+-----------+-------------+-------+
2021	|September  |member       |	13.89 |
--------+-----------+-------------+-------+
2021	|September  |casual       |	28.05 |
--------+-----------+-------------+-------+

*/

-- Average ride length in each weekday

SELECT day_of_week, member_casual, ROUND(AVG(ride_length),2)
FROM public."yearly-divvy-tripdata"
GROUP BY day_of_week, member_casual
ORDER BY CASE day_of_week
WHEN 'Sunday' THEN 1
WHEN 'Monday' THEN 2
WHEN 'Tuesday' THEN 3
WHEN 'Wednesday' THEN 4
WHEN 'Thursday' THEN 5
WHEN 'Friday' THEN 6
ELSE 7
END ASC;
/*

day_of_week|member_casual|round  |
-----------+-------------+-------+
Sunday     |casual       |  38.40|
-----------+-------------+-------+
Sunday     |member       |	16.25|
-----------+-------------+-------+
Monday     |casual       |	32.84|
-----------+-------------+-------+
Monday     |member       |	13.83|
-----------+-------------+-------+
Tuesday    |member       |	13.48|
-----------+-------------+-------+
Tuesday    |casual       |	29.61|
-----------+-------------+-------+
Wednesday  |member       |	13.55|
-----------+-------------+-------+
Wednesday  |casual       |	28.91|
-----------+-------------+-------+
Thursday   |casual       |	28.66|
-----------+-------------+-------+
Thursday   |member       |	13.44|
-----------+-------------+-------+
Friday     |member       |	14.18|
-----------+-------------+-------+
Friday     |casual       |	31.69|
-----------+-------------+-------+
Saturday   |casual       |	35.88|
-----------+-------------+-------+
Saturday   |member       |	15.93|
-----------+-------------+-------+

*/

-- Analyzing rideable_type usage between members and casual riders

SELECT rideable_type, member_casual, COUNT(*)
FROM public."yearly-divvy-tripdata"
GROUP BY rideable_type, member_casual;
/*

rideable_type  |member_casual|count    |
---------------+-------------+---------+
classic_bike   |casual       |	1113997|
---------------+-------------+---------+
classic_bike   |member       |	1614164|
---------------+-------------+---------+
docked_bike    |casual       |	405202 |
---------------+-------------+---------+
docked_bike    |member       |	264716 |
---------------+-------------+---------+
electric_bike  |casual       |	817333 |
---------------+-------------+---------+
electric_bike  |member       |	866381 |
---------------+-------------+---------+

*/