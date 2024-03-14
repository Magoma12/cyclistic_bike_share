-- Changing datatype for column "end_station_id" from double precision to text
ALTER TABLE public."202012-divvy-tripdata"
ALTER COLUMN end_station_id TYPE text;

-- Changing datatype for column "member_casual" from double precision to text
ALTER TABLE public."202012-divvy-tripdata"
ALTER COLUMN member_casual TYPE text;

-- Changing datatype for column "start_station_id" from double precision to text
ALTER TABLE public."202012-divvy-tripdata"
ALTER COLUMN start_station_id TYPE text;

-- Creating one table by Joining all 12 months tables to create a new table named yearly-divvy-tripdata
-- Join using UNION
-- Selecting only columns that are relavent to my analysis

CREATE TABLE "yearly-divvy-tripdata"
AS
SELECT ride_id, rideable_type, started_at, ended_at, member_casual 
FROM public."202010-divvy-tripdata"
UNION
SELECT ride_id, rideable_type, started_at, ended_at, member_casual 
FROM public."202011-divvy-tripdata"
UNION
SELECT ride_id, rideable_type, started_at, ended_at, member_casual 
FROM public."202012-divvy-tripdata"
UNION
SELECT ride_id, rideable_type, started_at, ended_at, member_casual 
FROM public."202101-divvy-tripdata"
UNION
SELECT ride_id, rideable_type, started_at, ended_at, member_casual 
FROM public."202102-divvy-tripdata"
UNION
SELECT ride_id, rideable_type, started_at, ended_at, member_casual 
FROM public."202103-divvy-tripdata"
UNION
SELECT ride_id, rideable_type, started_at, ended_at, member_casual 
FROM public."202104-divvy-tripdata"
UNION
SELECT ride_id, rideable_type, started_at, ended_at, member_casual 
FROM public."202105-divvy-tripdata"
UNION
SELECT ride_id, rideable_type, started_at, ended_at, member_casual 
FROM public."202106-divvy-tripdata"
UNION
SELECT ride_id, rideable_type, started_at, ended_at, member_casual 
FROM public."202107-divvy-tripdata"
UNION
SELECT ride_id, rideable_type, started_at, ended_at, member_casual 
FROM public."202108-divvy-tripdata"
UNION
SELECT ride_id, rideable_type, started_at, ended_at, member_casual 
FROM public."202109-divvy-tripdata";
