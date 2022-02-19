
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

SELECT  DATE,PROVINCE,
        CASE WHEN (NEW_ACTIVE_CASES)<1000 THEN 5
        WHEN (NEW_ACTIVE_CASES)>1000 AND (NEW_ACTIVE_CASES) <10000  THEN 4
        WHEN (NEW_ACTIVE_CASES)>10000 AND (NEW_ACTIVE_CASES) <25000  THEN 3
        WHEN (NEW_ACTIVE_CASES)>25000 AND (NEW_ACTIVE_CASES) <50000  THEN 2
        WHEN (NEW_ACTIVE_CASES)>50000  THEN 1 END SAFETY_LEVELS
        FROM
       ( SELECT DATE,PROVINCE,SUM(NEW_ACTIVE_CASES) NEW_ACTIVE_CASES
from FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_DEEPAK_SINGHAL
        group by DATE,PROVINCE)X
  ORDER BY DATE DESC,PROVINCE DESC,SAFETY_LEVELS ASC

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
