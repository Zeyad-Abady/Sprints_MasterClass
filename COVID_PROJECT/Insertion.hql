CREATE EXTERNAL TABLE IF NOT EXISTS covid_db.covid_output_deaths
(
Total_Deaths DOUBLE,
Death_Rate							DOUBLE
)
PARTITIONED BY (Country_Name String)
ROW FORMAT DELIMITED FIELDS TERMINATED by ','
STORED as parquet;
insert into covid_db.covid_output_deaths PARTITION (country_name)
(select total_deaths,deaths,Country_Name from covid_db.covid_partitioned where
Country_Name is not null and deaths is not null order by deaths DESC limit 10);

---------------------------------------------------------------------------------------
CREATE EXTERNAL TABLE IF NOT EXISTS covid_db.covid_output_tests
(
Total_Tests DOUBLE,
Testing_Rate					 DOUBLE
)
PARTITIONED BY (Country_Name String)
ROW FORMAT DELIMITED FIELDS TERMINATED by ','
STORED as parquet;
insert into covid_db.covid_output_tests PARTITION (country_name)
(select Total_Tests,tests,Country_Name from covid_db.covid_partitioned where
Country_Name is not null and tests is not null order by tests DESC limit 10);
