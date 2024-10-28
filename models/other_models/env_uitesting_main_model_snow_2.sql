{{
  config({    
    "materialized": "table"
  })
}}

WITH ALL_TYPE_TABLE_NON_GEOMETRY AS (

  SELECT * 
  
  FROM {{ source('alias_base_QA_DATABASE_QA_SCHEMA', 'ALL_TYPE_TABLE_NON_GEOMETRY') }}

),

Reformat_1 AS (

  SELECT * 
  
  FROM ALL_TYPE_TABLE_NON_GEOMETRY AS in0

)

SELECT *

FROM Reformat_1
