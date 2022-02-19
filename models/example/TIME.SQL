
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    SELECT DISTINCT YEAR(TO_DATE(DATE,'MM/DD/YYYY')) YEAR,date_trunc('MONTH',cast(DATE as date)) START_OF_THE_MONTH,
    MONTH(TO_DATE(DATE,'MM/DD/YYYY')) MONTH_ID,
                WEEK(TO_DATE(DATE,'MM/DD/YYYY')) WEEK_ID , TO_DATE(DATE,'MM/DD/YYYY') LU_DATE
FROM FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_DEEPAK_SINGHAL
ORDER BY TO_DATE(DATE,'MM/DD/YYYY') DESC



)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
