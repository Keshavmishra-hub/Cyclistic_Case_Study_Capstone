-- Data Cleaning

DROP TABLE IF EXISTS `my_project_id.2023_tripdata.combined_data_cleaned`;

-- creating new table with clean data

CREATE TABLE IF NOT EXISTS `my_project_id.2023_tripdata.combined_data_cleaned` AS 
SELECT 
    ride_id,
    rideable_type,	
    started_at,	
    CASE EXTRACT(DAYOFWEEK FROM started_at) 
      WHEN 1 THEN 'SUN'
      WHEN 2 THEN 'MON'
      WHEN 3 THEN 'TUES'
      WHEN 4 THEN 'WED'
      WHEN 5 THEN 'THURS'
      WHEN 6 THEN 'FRI'
      WHEN 7 THEN 'SAT'    
    END AS day_of_week,
    ended_at,	
    CASE EXTRACT(MONTH FROM started_at)
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEB'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'APR'
      WHEN 5 THEN 'MAY'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AUG'
      WHEN 9 THEN 'SEP'
      WHEN 10 THEN 'OCT'
      WHEN 11 THEN 'NOV'
      WHEN 12 THEN 'DEC'
    END AS month,
    TIMESTAMP_DIFF(TIMESTAMP(ended_at), TIMESTAMP(started_at), MINUTE) AS tripduration,
    start_station_name,	
    end_station_name,	
    start_lat,	
    start_lng,
    end_lat,
    end_lng,
    member_casual
FROM `my_project_id.2023_tripdata.combined_data`
WHERE 
    start_station_name IS NOT NULL AND
    end_station_name IS NOT NULL AND
    start_station_id IS NOT NULL AND
    end_station_id IS NOT NULL AND
    end_lat IS NOT NULL AND
    end_lng IS NOT NULL AND
    TIMESTAMP_DIFF(TIMESTAMP(ended_at), TIMESTAMP(started_at), MINUTE) > 1 AND 
    TIMESTAMP_DIFF(TIMESTAMP(ended_at), TIMESTAMP(started_at), MINUTE) < 1440;

-- I ensured that this new table has no null values.

SELECT 
    COUNTIF(ride_id IS NULL) AS ride_id_nulls,
    COUNTIF(rideable_type IS NULL) AS rideable_type_nulls,
    COUNTIF(started_at IS NULL) AS started_at_nulls,
    COUNTIF(ended_at IS NULL) AS ended_at_nulls,
    COUNTIF(start_station_name IS NULL) AS start_station_name_nulls,
    COUNTIF(end_station_name IS NULL) AS end_station_name_nulls,
    COUNTIF(start_lat IS NULL) AS start_lat_nulls,
    COUNTIF(start_lng IS NULL) AS start_lng_nulls,
    COUNTIF(end_lat IS NULL) AS end_lat_nulls,
    COUNTIF(end_lng IS NULL) AS end_lng_nulls,
    COUNTIF(member_casual IS NULL) AS member_casual_nulls,
    
    -- Count nulls in new columns
    COUNTIF(day_of_week IS NULL) AS day_of_week_nulls,
    COUNTIF(month IS NULL) AS month_nulls,
    COUNTIF(tripduration IS NULL) AS tripduration_nulls
FROM `my_project_id.2023_tripdata.combined_data_cleaned`;

-- I count the number of rows of this new table 'combined_data_cleaned'

SELECT COUNT(*) AS num_of_rows
FROM `my_project_id.2023_tripdata.combined_data_cleaned`;
