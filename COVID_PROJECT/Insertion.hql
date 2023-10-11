CREATE EXTERNAL TABLE IF NOT EXISTS covid_db.covid_output_deaths
(
Total_Deaths DOUBLE,
Death_Rate							DOUBLE
)
ROW FORMAT DELIMITED FIELDS TERMINATED by ','
STORED as parquet;
insert into covid_db.covid_output_deaths
(select total_deaths,deaths,Country from covid_db.covid_staging where
Country is not null and deaths is not null order by deaths DESC limit 10);
---------------------------------------------------------------------------------------
CREATE EXTERNAL TABLE IF NOT EXISTS covid_db.covid_output_tests
(
Total_Tests DOUBLE,
Testing_Rate					 DOUBLE
)
ROW FORMAT DELIMITED FIELDS TERMINATED by ','
STORED as parquet;
insert into covid_db.covid_output_tests 
(select Total_Tests,tests,Country_Name from covid_db.covid_staging where
Country is not null and tests is not null order by tests DESC limit 10);
