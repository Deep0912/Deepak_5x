
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    SELECT  YEAR(TO_DATE(DATE,'MM/DD/YYYY')) YEAR,date_trunc('MONTH',cast(DATE as date)) START_OF_THE_MONTH,
    MONTH(TO_DATE(DATE,'MM/DD/YYYY')) MONTH_ID,
                WEEK(TO_DATE(DATE,'MM/DD/YYYY')) WEEK_ID , TO_DATE(DATE,'MM/DD/YYYY') DATE,
                TIME_ZONE,CONTINENT,LOCATION_LEVEL,COUNTRY,ISLAND
,LOCATION,LOCATION_ISO_CODE,AREA_KM_2_,SPECIAL_STATUS,PROVINCE,
                LONGITUDE,LATITUDE,
                TOTAL_CITIES,TOTAL_DISTRICTS,TOTAL_REGENCIES,TOTAL_RURAL_VILLAGES,TOTAL_URBAN_VILLAGES,POPULATION_DENSITY,POPULATION,

TOTAL_CASES,TOTAL_RECOVERED,TOTAL_DEATHS,TOTAL_ACTIVE_CASES,TOTAL_CASES_PER_MILLION,TOTAL_DEATHS_PER_MILLION,
NEW_CASES_PER_MILLION,NEW_DEATHS_PER_MILLION
,NEW_CASES,NEW_ACTIVE_CASES
,NEW_RECOVERED,NEW_DEATHS,CASE_RECOVERED_RATE,GROWTH_FACTOR_OF_NEW_CASES
CASE_FATALITY_RATE,GROWTH_FACTOR_OF_NEW_DEATHS
FROM  FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_DEEPAK_SINGHAL



                


)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
