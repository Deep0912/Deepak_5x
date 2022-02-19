
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

  select TO_DATE(DATE,'MM/DD/YYYY') as date, LOCATION_LEVEL,COUNTRY,PROVINCE,SUM(TOTAL_CASES) TOTAL_CASES,SUM(TOTAL_ACTIVE_CASES) TOTAL_ACTIVE_CASES,SUM(NEW_CASES) NEW_CASES,
       SUM(TOTAL_RECOVERED) TOTAL_RECOVERED,SUM(NEW_RECOVERED) NEW_RECOVERED,SUM(TOTAL_DEATHS) TOTAL_DEATHS,SUM(NEW_DEATHS) NEW_DEATHS,
       TO_NUMBER(AVG(NEW_CASES_PER_MILLION)) NEW_CASES_PER_MILLION , TO_NUMBER(AVG(TOTAL_CASES_PER_MILLION)) TOTAL_CASES_PER_MILLION , TO_NUMBER(AVG(NEW_DEATHS_PER_MILLION)) NEW_DEATHS_PER_MILLION,
       TO_NUMBER(AVG(TOTAL_DEATHS_PER_MILLION)) TOTAL_DEATHS_PER_MILLION 

from FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_DEEPAK_SINGHAL
GROUP BY DATE,LOCATION_LEVEL,COUNTRY,PROVINCE

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
