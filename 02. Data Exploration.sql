-- Data Exploration

-- checking the data types of all columns

SELECT column_name, data_type
FROM `2023_tripdata`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'combined_data';

-- checking for number of null values in all columns

SELECT COUNT(*) - COUNT(ride_id) ride_id,
 COUNT(*) - COUNT(rideable_type) rideable_type,
 COUNT(*) - COUNT(started_at) started_at,
 COUNT(*) - COUNT(ended_at) ended_at,
 COUNT(*) - COUNT(start_station_name) start_station_name,
 COUNT(*) - COUNT(start_station_id) start_station_id,
 COUNT(*) - COUNT(end_station_name) end_station_name,
 COUNT(*) - COUNT(end_station_id) end_station_id,
 COUNT(*) - COUNT(start_lat) start_lat,
 COUNT(*) - COUNT(start_lng) start_lng,
 COUNT(*) - COUNT(end_lat) end_lat,
 COUNT(*) - COUNT(end_lng) end_lng,
 COUNT(*) - COUNT(member_casual) member_casual
FROM `my_project_id.2023_tripdata.combined_data`;

-- checking for duplicate rows

SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `my_project_id.2023_tripdata.combined_data`;

-- ride_id - all have length of 16

SELECT LENGTH(ride_id) AS length_ride_id, COUNT(ride_id) AS no_of_rows
FROM `my_project_id.2023_tripdata.combined_data`
GROUP BY length_ride_id;

--  I check there are 1592 station from start_station_name

SELECT COUNT(DISTINCT start_station_name) AS num_start_station
FROM `my_project_id.2023_tripdata.combined_data`
WHERE start_station_name IS NOT NULL;

-- I check there are 1597 station from end_station_name

SELECT COUNT(DISTINCT end_station_name) AS num_end_station
FROM `my_project_id.2023_tripdata.combined_data`
WHERE end_station_name IS NOT NULL;

-- unique 2 values, count of annual member and casual

SELECT DISTINCT member_casual, COUNT(member_casual) AS no_of_trips
FROM `my_project_id.2023_tripdata.combined_data`
GROUP BY member_casual;

-- Rideable_type - 3 unique types of bikes

SELECT rideable_type, COUNT(rideable_type) AS number_of_trips
FROM `my_project_id.2023_tripdata.combined_data`
GROUP BY rideable_type;
