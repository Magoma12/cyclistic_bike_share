-- Updating the created columns
-- Updating column "year"

UPDATE public."yearly-divvy-tripdata"
SET year = EXTRACT(YEAR FROM started_at);

-- Updating column "month"

UPDATE public."yearly-divvy-tripdata"
SET month = TO_CHAR(started_at, 'Month');

-- Updating column "day_of_week"

UPDATE public."yearly-divvy-tripdata"
SET day_of_week = TO_CHAR(started_at, 'Day');