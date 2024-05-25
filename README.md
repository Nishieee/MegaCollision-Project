# MegaCollision Project
 Data Engineering Project

 # Final Project – Motor Vehicle Collisions/Crashes

## Overview

This project involves designing advanced data architectures for business intelligence, specifically focusing on motor vehicle collisions/crashes data from three cities: New York, Chicago, and Austin. The data is sourced from respective city data portals and is used to analyze various aspects of traffic crashes, such as the number of accidents, areas with the highest number of accidents, injuries, pedestrian involvement, and more.

## Data Sources

The crash data is obtained from the Department of Transportation for each city:
- [New York](https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95/about_data)
- [Chicago](https://data.cityofchicago.org/Transportation/Traffic-Crashes-Crashes/85ca-t3if/about_data)
- [Austin](https://data.austintexas.gov/Transportation-and-Mobility/Austin-Crash-Report-Data-Crash-Level-Records/y2wy-tgr5/about_data)

## Project Phases
## Project Phases

### Phase 1: Data Profiling and Staging

#### Data Profiling
For the initial data profiling, we used Alteryx and YData Profile to get a comprehensive understanding of the dataset.

#### Data Staging
Created staging tables using Talend for ETL jobs, adhering to standard practices. The staging environment utilizes Azure SQL Server, MySQL, or SQL Server for data storage.

#### Dimensional Model
Designed the dimensional model to include facts and dimensions. This involved creating a detailed mapping document to explain source-to-target mappings and document all necessary transformations.

### Phase 2: Data Integration and Querying

#### Staging to Integration
Implemented ETL jobs using Talend to transfer data from staging to the integration layer. Data validation was performed, and any row rejections were thoroughly explained.

#### Business Questions
Queried the dimensional data model to answer the provided business questions, ensuring the insights are accurate and actionable.


### Phase 3: Visualization

#### Tools
For the visualization phase, we used Tableau and Power BI to create insightful visualizations.


## Analysis Questions

1. **Accidents Count:** How many accidents occurred in NYC, Austin, and Chicago?
2. **Top Areas:** Which areas in the 3 cities had the greatest number of accidents? (Top 3 areas in each city)
3. **Injuries Count:** How many accidents resulted in just injuries? (Overall and by city)
4. **Pedestrian Involvement:** How often are pedestrians involved in accidents? (Overall and by city)
5. **Seasonality:** When do most accidents happen? (Seasonality report)
6. **Motorist Injuries/Kills:** How many motorists are injured or killed in accidents? (Overall and by city)
7. **Fatal Accidents Areas:** Which top 5 areas in 3 cities have the most fatal number of accidents?
8. **Time-Based Analysis:** Time-based analysis of accidents (Time of the day, day of the week, weekdays or weekends)
9. **Fatality Analysis:** Are pedestrians killed more often than road users?
10. **Common Factors:** What are the most common factors involved in accidents?

## Inconsistencies and Resolutions

### Chicago
1. **Contributing Factors:** Resolved missing contributing factors using specific codes.
2. **Contributing Factor Columns:** Merged and normalized data from 'Primary Contributing Cause' and 'Secondary Contributing Cause'.
3. **Speed Limit Data:** Updated inconsistent speed limit values from 0 to -1.
4. **Date and Time Formatting:** Split combined date and time into separate columns, changed date format to yyyy-mm-dd.

### New York
1. **Contributing Factor and Vehicle Type Columns:** Merged and normalized multiple columns for contributing factors and vehicle types.
2. **Crash Date Column:** Left an entry with an extra string "ParkingLOT)" as is.
3. **Inconsistent Vehicle Type Columns:** Left non-standard values unchanged.
4. **Units Involved Calculation:** Computed 'Units Involved' using other columns.
5. **Crash Time Column:** Added seconds to the time format.
6. **Date Column with Time Component:** Removed time component from the date column.

### Austin
1. **Vehicle Type Data:** Computed and inferred vehicle types.
2. **Contributing Factor Columns:** Merged and normalized multiple contributing factor columns.
3. **Date and Time Formatting:** Split combined date and time data into separate columns, changed date format to yyyy-mm-dd.

## Dimensional Model

The dimensional model is a star schema designed for traffic accident data analysis. The schema includes:

- **Fact Table:** Contains measures such as total injury count, pedestrian injury count, various types of injuries and deaths, and the number of units involved in accidents.
- **Dimension Tables:**
  - **Time Dimension (Time_DM):** Attributes include time, creation date, and workflow.
  - **Geographical Dimension (Geo_DM):** Attributes include latitude, longitude, street name, and city.
  - **Date Dimension (Date_DM):** Date-specific information for trend analysis.
  - **Speed Limit Dimension (SpeedLimit_DM):** Speed limit information.
  - **Crash Dimension (Crash_DM):** Specific details about the crashes.
  - **Contributing Factor Dimension (ContributingFactor_DM):** Data on various contributing factors.
  - **Vehicle Dimension (Vehicle_DM):** Information about vehicles involved in accidents.
  - **Fact Tables for Contributing Factors and Vehicle Junctions:** Used to scrutinize specific aspects of accidents.


  ![Dimensional Model](https://github.com/Nishieee/MegaCollision-Project/blob/main/dimenaional%20model.png)





