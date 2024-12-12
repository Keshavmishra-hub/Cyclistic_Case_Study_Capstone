-- Data Combining

DROP TABLE IF EXISTS `myproject_id.2023_tripdata.combined_data`;

-- combining all the 12 months data tables into a single table containing data from Jan 2023 to Dec 2023.

CREATE TABLE IF NOT EXISTS `myproject_id.2023_tripdata.combined_data` AS (
  SELECT * FROM `myproject_id.2023_tripdata.202301_tripdata`
  UNION ALL
  SELECT * FROM `myproject_id.2023_tripdata.202302_tripdata`
  UNION ALL
  SELECT * FROM `myproject_id.2023_tripdata.202303_tripdata`
  UNION ALL
  SELECT * FROM `myproject_id.2023_tripdata.202304_tripdata`
  UNION ALL
  SELECT * FROM `myproject_id.2023_tripdata.202305_tripdata`
  UNION ALL
  SELECT * FROM `myproject_id.2023_tripdata.202306_tripdata`
  UNION ALL
  SELECT * FROM `myproject_id.2023_tripdata.202307_tripdata`
  UNION ALL
  SELECT * FROM `myproject_id.2023_tripdata.202308_tripdata`
  UNION ALL
  SELECT * FROM `myproject_id.2023_tripdata.202309_tripdata`
  UNION ALL
  SELECT * FROM `myproject_id.2023_tripdata.202310_tripdata`
  UNION ALL
  SELECT * FROM `myproject_id.2023_tripdata.202311_tripdata`
  UNION ALL
  SELECT * FROM `myproject_id.2023_tripdata.202312_tripdata`
);

-- checking no of rows which are 5719877

SELECT COUNT(*)
FROM `myproject_id.2023_tripdata.combined_data`;
