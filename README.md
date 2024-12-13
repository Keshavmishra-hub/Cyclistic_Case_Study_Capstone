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
1. **Bike Types in 2023**
   - Classic Bike: Members accounted for 67.29% of the rides, while casual riders contributed 32.71%. This indicates a higher preference for classic bikes among annual members.
   - Docked Bike: Only casual riders utilized docked bikes, representing 100% usage. This exclusivity suggests that docked bikes might be more accessible or appealing to casual users.
   - Electric Bike: Members used electric bikes 62.33% of the time, compared to 37.67% for casual riders. This shows a moderate preference for electric bikes among members but also significant use by casual riders.

2. **Ride Distribution of Casual & Members**
   - Overall, members undertook 64.30% of the rides, with casual riders completing 35.70%. This distribution demonstrates that annual members are more active users of the bike-sharing service. Key insights into the bike usage patterns of casual riders and annual members. Members predominantly use classic and electric bikes, while casual riders show a notable preference for docked bikes. The higher overall ride frequency among members suggests stronger engagement with the service.

![image](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/Total%20Trips%20in%202023.png)
### 1. Total Trips Per Month
- Observation: Both casual users and members show an increase in trips from January, peaking around July for Casual and August for Member, and then declining towards December.
- Insight: There is a clear seasonality in bike usage, with the highest activity during summer months. Both casual riders and members exhibit similar seasonal trends, although members consistently take more trips throughout the year.

### 2. Total Trips Per Day of the Week
- Observation: Members maintain a relatively stable number of trips throughout the week, with a slight peak on Tuesday and Wednesday. Casual users, however, have fewer trips overall but show a significant increase on weekends, especially on Saturday.
- Insight: Weekends are more popular among casual users, likely due to leisure activities, while members use the service more evenly throughout the week, possibly for commuting and daily routines.

### 3. Total Trips Per Hour of the Day
- Observation: Members have peak trips around 8 AM and 5 PM, which aligns with typical commuting hours. Casual users have a more gradual increase throughout the day, peaking around 5 PM, followed by a decline.
- Insight: Members primarily use the bikes for commuting purposes, while casual users tend to use them more for leisure or non-routine trips.

### Conclusion
The dashboard highlights distinct usage patterns between casual users and annual members:
- Seasonal Usage: Both groups show increased activity during warmer months.
- Weekly Patterns: Casual users prefer weekends, while members have a stable usage pattern throughout the week.
- Daily Patterns: Members' usage is concentrated aound typical commuting hours, while casual users' usage is more spread out during the day.

![image](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/Average%20Ride%20Duration%20in%202023.png)   
### 1. Average Ride Duration Per Month
- Casual Riders: The average ride duration peaks in June and July, reaching around 25 minutes. This suggests that casual riders tend to use bikes for longer periods during the summer months, possibly for leisure activities.
- Annual Members: The average ride duration remains stable throughout the year, fluctuating slightly around 10 minutes. This stability indicates that members primarily use the service for consistent, shorter trips, likely for commuting.

### 2. Average Ride Duration Per Day of the Week
- Casual Riders: The highest average ride duration is on Sundays (around 25 minutes), with a steady decrease throughout the week, reaching the lowest on Thursdays. This pattern implies that casual riders prefer longer, leisurely rides on weekends.
- Annual Members: The average ride duration is consistent throughout the week, with a slight increase on weekends. This consistency further supports the idea that members use the bikes for regular, possibly routine trips.

### 3. Average Ride Duration Per Hour of the Day
- Casual Riders: The peak ride duration is between 10 AM and 3 PM, reaching up to 25 minutes, with the lowest duration during early morning hours (midnight to 6 AM). This trend indicates that casual riders use bikes more during the day, likely for recreational purposes.
- Annual Members: The average ride duration remains relatively stable throughout the day, generally around 10 minutes, with slight variations. This suggests that members use the bikes for short trips at various times, aligning with commuting and daily errands.

### Conclusion
The dashboard provides valuable insights into the ride duration patterns of casual riders and annual members:
- Seasonal Trends: Casual riders take longer trips during the summer months, while members' trip durations remain stable year-round.
- Weekly Patterns: Casual riders prefer longer rides on weekends, whereas members show consistent usage throughout the week.
- Daily Patterns: Casual riders tend to ride longer during daylight hours, while members' ride durations are stable throughout the day.

![image](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/Trips%20at%20Start%20Station%20in%202023.png)  
Casual riders have frequently started their trips from the stations in vicinity of museums, parks, beach, harbor points and aquarium while members have begun their journeys from stations close to universities, residential areas, restaurants, hospitals, grocery stores, theatre, schools, banks, factories, train stations, parks and plazas.

![image](https://github.com/Keshavmishra-hub/Cyclistic_Case_Study_Capstone/blob/main/Trips%20to%20End%20Station%20in%202023.png)
Similar trend can be observed in ending station locations. Casual riders end their journay near parks, museums and other recreational sites whereas members end their trips close to universities, residential and commmercial areas. So this proves that casual riders use bikes for leisure activities while members extensively rely on them for daily commute.

>## Conclusions
The analysis conducted on Cyclistic's bike-sharing program data reveals key insights regarding the usage patterns and preferences of casual riders compared to annual members.

1. **Usage Patterns**: Annual members tend to use the bikes more frequently for shorter trips, whereas casual riders generally have longer trip durations.
2. **Membership Conversion Opportunities**: The significant differences in ride lengths suggest that targeted marketing strategies could effectively convert casual riders into annual members.
3. **Seasonal Trends**: Identifying trends based on monthly data can help in planning promotional offers or campaigns that align with peak usage times.
4. **Bike Preferences**: The preference for classic bikes among both groups suggests that promotional efforts could be centered around these bikes to attract casual riders.

## Key observations
1. Usage Density Differences:
   - Casual users show higher trip densities at specific stations, particularly in high-traffic or tourist areas.
   - Annual members have a more evenly distributed trip density, indicating diverse usage patterns across multiple stations for commuting and regular travel.

2. Seasonal and Weekly Patterns:
   - Casual riders exhibit a seasonal trend with increased ride durations during summer months and higher activity on weekends.
   - Annual members maintain a steady ride duration and usage pattern throughout the year, with slight peaks during commuting hours and weekdays.

3. Daily Usage Trends:
   - Casual users tend to use the service more during daylight hours, especially around midday, likely for leisure activities.
   - Members' usage peaks align with typical commuting hours (morning and evening), suggesting a strong use for daily travel. 

## Act
Based on our business task, how can we convert casual riders into annual members?
1. Optimize Bike Availability:
   - Increase Bike Availability at High Traffic Stations:
     - Deploy additional bikes at stations with high usage by casual riders, especially during weekends and peak tourist seasons.
     - Monitor real-time data to dynamically adjust bike distribution based on current demand.
   - Ensure Consistent Supply for Members:
     - Maintain a balanced distribution of bikes at stations frequented by members, particularly during commuting hours.
     - Implement predictive analytics to forecast demand and pre-position bikes accordingly.

2. Enhance User Engagement:
   - Targeted Marketing Campaigns:
     - Design campaigns aimed at casual riders in high-traffic areas to promote the benefits of membership.
     - Offer promotions or incentives for casual riders to convert to annual memberships, such as discounted rates or exclusive access to services.
   - Member Experience Improvement:
     - Develop loyalty programs for members to enhance their experience and encourage continued usage.
     - Provide real-time updates on bike availability and station status to ensure a seamless user experience.

3. Improve Operational Efficiency:
   - Dynamic Resource Allocation:
     - Utilize data-driven insights to allocate maintenance and support resources efficiently across different stations.
     - Schedule regular maintenance during off-peak hours to minimize service disruption.
   - Implement Feedback Loops:
     - Gather user feedback regularly to identify pain points and areas for improvement.
     - Integrate user feedback into service planning and operational strategies.

4. Infrastructure Enhancements:
   - Station Upgrades:
     - Upgrade infrastructure at popular stations to handle higher bike volumes and improve user experience.
     - Consider expanding station capacity in high-demand areas to accommodate future growth.
   - Technological Integration:
     - Invest in technology to enhance bike tracking and availability updates for users.
     - Implement smart docking stations that can provide real-time data on bike usage and availability.
5. Recommendations for the Marketing Team
  - Awareness Campaigns at Popular Stations:
Launch awareness campaigns targeting casual riders at the stations they frequent most on weekends, highlighting the key benefits of becoming annual members:

  - Promotional Materials at Key Stations:
Distribute flyers at the busiest stations for casual riders during weekends, showcasing special discounts tailored specifically for them. These could also offer **group promotions** for families or friends, encouraging them to upgrade to annual memberships together.

  - Seasonal Promotions:
Offer **seasonal discounts**, such as significant price reductions during the winter months, to incentivize using bikes for commuting to work, even in colder seasons.

  - Marketing Channels:
As discussed, the campaigns can be executed through various channels:

  - **Flyers** at popular stations where casual riders are most active.
  - **Targeted emails** that are sent directly after casual riders activate their bikes, promoting the benefits of weekly use and annual membership upgrades.
  - **Social Media** campaigns, especially highlighting the environmental impact of biking and encouraging riders to feel like protagonists in creating a more sustainable transportation future.
