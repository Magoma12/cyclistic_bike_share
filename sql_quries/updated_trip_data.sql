-- Converting data types of the columns "started_at" and "ended_at" as

ALTER TABLE public."yearly-divvy-tripdata"
ALTER COLUMN started_at TYPE timestamp
USING started_at::timestamp;

-- Converting data types of the columns "started_at" and "ended_at" as

ALTER TABLE public."yearly-divvy-tripdata"
ALTER COLUMN ended_at TYPE timestamp
USING ended_at::timestamp;
-- Updating column "ride_length" as the difference between "started_at" and "ended_at" in minutes

UPDATE public."yearly-divvy-tripdata"
SET ride_length = EXTRACT(EPOCH FROM(ended_at - started_at))/60;

-- Sorting rows by "ride_length" in the ascending order

SELECT ride_length
FROM public."yearly-divvy-tripdata"
ORDER BY ride_length;
-- The results shows that there are negative values in the column "ride_length"

-- Counting the number of rows containing negative values from the column "ride_length"

SELECT COUNT(*) FROM public."yearly-divvy-tripdata"
WHERE ride_length < 0;

/*

count|
-----+
1475 |

*/

-- Counting the number of rows with ride_length less than one

SELECT COUNT(*) FROM public."yearly-divvy-tripdata"
WHERE ride_length < 1;

/*

count|
-----+
54468|

*/

-- Delete rows containing ride_length less than 1

DELETE FROM public."yearly-divvy-tripdata"
WHERE ride_length < 1;

-- Finding the total number of rows

SELECT COUNT(*) FROM public."yearly-divvy-tripdata";

/*

count  |
-------+
5081793|

*/

-- Checking if there are null rows in any columns

SELECT 
SUM(CASE WHEN ride_id is NULL
   THEN 1 ELSE 0 END) AS null_ride_id,
SUM(CASE WHEN rideable_type is NULL
   THEN 1 ELSE 0 END) AS null_rideable,
SUM(CASE WHEN started_at is NULL
   THEN 1 ELSE 0 END) AS null_started,
SUM(CASE WHEN ended_at is NULL
   THEN 1 ELSE 0 END) AS null_ended,
SUM(CASE WHEN member_casual is NULL
   THEN 1 ELSE 0 END) AS null_member,
SUM(CASE WHEN ride_length is NULL
   THEN 1 ELSE 0 END) AS null_length  
FROM public."yearly-divvy-tripdata";

/*

null_ride_id|null_rideable|null_started|null_ended|null_member|null_length|
------------+-------------+------------+----------+-----------+-----------+
          0 |           0 |          0 |        0 |         0 |         0 |
------------+-------------+------------+----------+-----------+-----------+		  
* No null rows
*/

--Checking if there are duplicate rows in the column "ride_id"

SELECT ride_id, COUNT(*) FROM public."yearly-divvy-tripdata"
GROUP BY ride_id
HAVING COUNT(*) > 1;

-- Found no duplicate rows

/*
Creating new columns, which are
* "year"
* "month"
* "day_of_week"
* "hour"
*/

ALTER TABLE public."yearly-divvy-tripdata"
ADD COLUMN year smallint,
ADD COLUMN month character varying,
ADD COLUMN day_of_week character varying,
ADD COLUMN hour smallint;

