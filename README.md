# Google Data Analytics Capstone: Cyclistic Case Study
Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)
## Introduction
In this case study, I will perform many real-world tasks of a junior data analyst at a fictional company, Cyclistic. In order to answer the key business questions, I will follow the steps of the data analysis process: [Ask](), [Prepare](), [Process](), [Analyze](), [Share](), and [Act]().
### Quick links:
Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) [accessed on 04/03/23]  
  
SQL Queries:  
[01. Data Combining](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/01.Data%20Combining.sql)  
[02. Data Exploration](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/02.%20Data%20Exploration.sql)  
[03. Data Cleaning](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/03.%20Data%20Cleaning.sql)  
[04. Data Analysis](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/04.%20Data%20Analysis.sql)  
  
Data Visualizations: [Tableau](https://public.tableau.com/views/CyclistBiketripCaseStudy/TripstoEndStationin2023?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)  
## Background
### Cyclistic
A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.   
  
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.  
  
Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno (the director of marketing and my manager) believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.  

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.  

### Scenario
I am assuming to be a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## Ask
### Business Task
Devise marketing strategies to convert casual riders to members.
### Analysis Questions
Three questions will guide the future marketing program:  
1. How do annual members and casual riders use Cyclistic bikes differently?  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members?  

Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?
## Prepare
### Data Source
I will use Cyclistic’s historical trip data to analyze and identify trends from Jan 2023 to Dec 2023 which can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement).  
  
This is public data that can be used to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit from using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.
### Data Organization
There are 12 files with naming convention of YYYYMM-divvy-tripdata and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.

## Process
BigQuery is used to combine the various datasets into one dataset and clean it.    
Reason:  
A worksheet can only have 1,048,576 rows in Microsoft Excel because of its inability to manage large amounts of data. Because the Cyclistic dataset has more than 5.6 million rows, it is essential to use a platform like BigQuery that supports huge volumes of data.
### Combining the Data
SQL Query: [Data Combining](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/01.Data%20Combining.sql)  
12 csv files are uploaded as tables in the dataset '2023_tripdata'. Another table named "combined_data" is created, containing 5,719,877 rows of data for the entire year. 
### Data Exploration
SQL Query: [Data Exploration](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/02.%20Data%20Exploration.sql)  
Before cleaning the data, I am familiarizing myself with the data to find the inconsistencies.  

Observations:  
1. The table below shows the all column names and their data types. The __ride_id__ column is our primary key.  

   ![image](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/Column%20Name%20%26%20Data%20Type.png)  

2. The following table shows number of __null values__ in each column.  
   
   ![image](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/Null%20Values.png)

   Note that some columns have same number of missing values. This may be due to missing information in the same row i.e. station's name and id for the same station and latitude and longitude for the same ending station.  
3. As ride_id has no null values, let's use it to check for duplicates.  

   ![image](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/Query%20for%20Duplicate%20rows.png)

   There are no __duplicate__ rows in the data.  
   
4. All __ride_id__ values have length of 16 so no need to clean it.
5. There are 3 unique types of bikes(__rideable_type__) in our data.

   ![image](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/Rideable_type.png)

6. The __started_at__ and __ended_at__ shows start and end time of the trip in YYYY-MM-DD hh:mm:ss UTC format. New column tripduration can be created to find the total trip duration. There are 6418 trips which has duration longer than a day and 151069 trips having less than a minute duration or having end time earlier than start time so need to remove them. Other columns day_of_week and month can also be helpful in analysis of trips at different times in a year.
7. Total of 875716 rows in __start_station_name__ and 875848 rows in __start_station_id__ is missing which needs to be removed.  
8. Total of 929202 rows in __end_station_name__ and 929342 rows in __end_station_id__ is  missing which needs to be removed.
9. Total of 6990 rows have both __end_lat__ and __end_lng__ missing which needs to be removed.
10. __member_casual__ column has 2 uniqued values as member or casual rider.

    ![image](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/members_casual.png)

11. Columns that need to be removed are start_station_id and end_station_id as they do not add value to analysis of our current problem. Longitude and latitude location columns may not be used in analysis but can be used to visualise a map.

### Data Cleaning
SQL Query: [Data Cleaning](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/03.%20Data%20Cleaning.sql)  
1. All the rows having missing values are deleted.  
2. 3 more columns tripduration for duration of the trip, day_of_week and month are added.  
3. Trips with duration less than a minute and longer than a day are excluded.
4. Total 1,551,377 rows are removed in this step.  

## Analyze and Share
SQL Query: [Data Analysis](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/04.%20Data%20Analysis.sql)  
Data Visualization: [Tableau](https://public.tableau.com/views/CyclistBiketripCaseStudy/TripstoEndStationin2023?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)  
The data is stored appropriately and is now prepared for analysis. I queried multiple relevant tables for the analysis and visualized them in Tableau.  
The analysis question is: How do annual members and casual riders use Cyclistic bikes differently?  

First of all, member and casual riders are compared by the type of bikes they are using.  

![image](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/Bikes%20Types%20in%202023.png)

![image](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/Total%20Trips%20in%202023.png)

![image](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/Average%20Ride%20Duration%20in%202023.png)   
  
![image](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/Trips%20at%20Start%20Station%20in%202023.png)  
  
![image](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/Trips%20to%20End%20Station%20in%202023.png)


>## Conclusions
The analysis conducted on Cyclistic's bike-sharing program data reveals key insights regarding the usage patterns and preferences of casual riders compared to annual members.

1. **Usage Patterns**: Annual members tend to use the bikes more frequently for shorter trips, whereas casual riders generally have longer trip durations.
2. **Membership Conversion Opportunities**: The significant differences in ride lengths suggest that targeted marketing strategies could effectively convert casual riders into annual members.
3. **Seasonal Trends**: Identifying trends based on monthly data can help in planning promotional offers or campaigns that align with peak usage times.
4. **Bike Preferences**: The preference for classic bikes among both groups suggests that promotional efforts could be centered around these bikes to attract casual riders.

## Final observations
Based on the analyses, members are likely regular commuters using the bikes as a means of transportation to and from work, while casual riders are more likely to use the bikes for leisure, especially on weekends.

## Act
Based on our business task, how can we convert casual riders into annual members?
### Recommendations for the Marketing Team

- **Awareness Campaigns at Popular Stations**:
Launch awareness campaigns targeting casual riders at the stations they frequent most on weekends, highlighting the key benefits of becoming annual members:
  
  - **Economic Benefits**: Emphasize the cost savings of an annual payment compared to paying for rides throughout the year, showing how it's more affordable in the long run.
  - **Environmental Impact**: Educate riders on the environmental advantages of using a bike for daily commutes. Highlight that cycling to work reduces CO2 emissions and promotes a more sustainable way of commuting.

- **Promotional Materials at Key Stations**:
Distribute flyers at the busiest stations for casual riders during weekends, showcasing special discounts tailored specifically for them. These could also offer **group promotions** for families or friends, encouraging them to upgrade to annual memberships together.

- **Seasonal Promotions**:
Offer **seasonal discounts**, such as significant price reductions during the winter months, to incentivize using bikes for commuting to work, even in colder seasons.

- **Marketing Channels**:
As discussed, the campaigns can be executed through various channels:

  - **Flyers** at popular stations where casual riders are most active.
  - **Targeted emails** that are sent directly after casual riders activate their bikes, promoting the benefits of weekly use and annual membership upgrades.
  - **Social Media** campaigns, especially highlighting the environmental impact of biking and encouraging riders to feel like protagonists in creating a more sustainable transportation future.
