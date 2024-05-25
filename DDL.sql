-- Create Time Dimension table
CREATE TABLE dbo.Time_DIM (
    Time_SK INT PRIMARY KEY,
    Time TIME,
	DI_CreatedDate DATETIME,
    SourceDataset VARCHAR(255);
);

-- Create Date Dimension table
CREATE TABLE dbo.Date_DIM (
    Date_SK INT PRIMARY KEY,
    Crash_Date DATE,
	DI_CreatedDate DATETIME,
    SourceDataset VARCHAR(255);
);

-- Create Speed Limit Dimension table
CREATE TABLE dbo.Speed_Limit_DIM (
    SpeedLimit_SK INT PRIMARY KEY,
    Speed_Limit INT,
	DI_CreatedDate DATETIME,
    SourceDataset VARCHAR(255);
);

-- Create Crash Dimension table
CREATE TABLE dbo.Crash_DIM (
    Crash_SK INT PRIMARY KEY,
    Crash_ID VARCHAR(255),
	DI_CreatedDate DATETIME,
    SourceDataset VARCHAR(255);
);

-- Create Geo Dimension table
CREATE TABLE dbo.Geo_DIM (
    Geo_SK INT PRIMARY KEY,
    Latitude DECIMAL(9,6),
    Longitude DECIMAL(9,6),
    Street_Name VARCHAR(255),
    Street_No INT,
    City VARCHAR(255),
    ZIP VARCHAR(255),
	DI_CreatedDate DATETIME,
    SourceDataset VARCHAR(255);
);

-- Create Vehicle Dimension table
CREATE TABLE dbo.Vehicle_DIM (
    Vehicle_SK INT PRIMARY KEY,
    Vehicle_Type VARCHAR(255),
	DI_CreatedDate DATETIME,
    SourceDataset VARCHAR(255);
);

CREATE TABLE dbo.ContributingFactor_DIM (
    ContributingFactor_SK INT PRIMARY KEY,
    ContributingFactor_Code VARCHAR(255),
    ContributingFactor_Description VARCHAR(255),
	DI_CreatedDate DATETIME,
    SourceDataset VARCHAR(255);
);


-- Create Accident Facts table with Foreign Keys to the Dimension tables
CREATE TABLE dbo.Accident_facts (
    Fact_SK INT PRIMARY KEY,
    Date_SK INT,
    Time_SK INT,
    SpeedLimit_SK INT,
    Geo_SK INT,
    Crash_SK INT,
    Total_Injury_Count INT,
    Total_Death_Count INT,
    Major_vehicle_death_count INT,
    Major_vehicle_serious_injury_count INT,
    Bicycle_death_count INT,
    Bicycle_injury_count INT,
    Pedestrian_death_count INT,
    Pedestrian_injury_count INT,
    Motorcycle_death_count INT,
    Motorcycle_injury_count INT,
    Micromobility_death_count INT,
    Micromobility_injury_count INT,
    Other_death_count INT,
    Other_injury_count INT,
    Units_involved_count INT, 
    FOREIGN KEY (Date_SK) REFERENCES dbo.Date_DIM(Date_SK),
    FOREIGN KEY (Time_SK) REFERENCES dbo.Time_DIM(Time_SK),
    FOREIGN KEY (SpeedLimit_SK) REFERENCES dbo.Speed_Limit_DIM(SpeedLimit_SK),
    FOREIGN KEY (Geo_SK) REFERENCES dbo.Geo_DIM(Geo_SK),
    FOREIGN KEY (Crash_SK) REFERENCES dbo.Crash_DIM(Crash_SK),
	DI_CreatedDate DATETIME,
    SourceDataset VARCHAR(255);
);


-- Assuming Fact_ContributingFactor_Junction and Fact_Vehicle_Junction are junction tables for many-to-many relationships
-- Replace the column names and types with actual column names and types

-- Create Fact Contributing Factor Junction table
CREATE TABLE dbo.Fact_ContributingFactor_Junction (
    ContributingFactor_Junction_SK INT PRIMARY KEY,
    Fact_SK INT,
    ContributingFactor_SK INT,
    FOREIGN KEY (Fact_SK) REFERENCES dbo.Accident_facts(Fact_SK),
    FOREIGN KEY (ContributingFactor_SK) REFERENCES dbo.ContributingFactor_DIM(ContributingFactor_SK),
	DI_CreatedDate DATETIME,
    SourceDataset VARCHAR(255);
);

-- Create Fact Vehicle Junction table
CREATE TABLE dbo.Fact_Vehicle_Junction (
    Vehicle_Junction_SK INT PRIMARY KEY,
    Fact_SK INT,
    Vehicle_SK INT,
    FOREIGN KEY (Fact_SK) REFERENCES dbo.Accident_facts(Fact_SK),
    FOREIGN KEY (Vehicle_SK) REFERENCES dbo.Vehicle_DIM(Vehicle_SK),
	DI_CreatedDate DATETIME,
    SourceDataset VARCHAR(255);
);