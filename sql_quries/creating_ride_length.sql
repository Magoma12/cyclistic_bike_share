SELECT * FROM public."yearly-divvy-tripdata";

SELECT COUNT(*) FROM public."yearly-divvy-tripdata";
-- There are 5136261 rows in this table
/*

count  |
-------+
5136261|

*/

-- Creating a new column named "ride_length"

ALTER TABLE public."yearly-divvy-tripdata"
ADD COLUMN ride_length integer;

