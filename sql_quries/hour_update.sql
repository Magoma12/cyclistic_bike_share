-- Updating column "hour"

UPDATE public."yearly-divvy-tripdata"
SET hour = EXTRACT(HOUR FROM started_at)