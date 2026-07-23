{{
  config({    
    "materialized": "ephemeral",
    "database": "QA_DATABASE",
    "schema": "QA_SCHEMA"
  })
}}

WITH all_type_table_3 AS (

  SELECT * 
  
  FROM {{ source('alisa_qa_database_qa_SIMPLE_schema', '"all_type_table"') }}

),

Employees_qa_SCHEMA AS (

  SELECT * 
  
  FROM {{ source('alias_test_QA_DATABASE."qa_SCHEMA"', '"Employees_qa_SCHEMA"') }}

),

all_type_table AS (

  SELECT * 
  
  FROM {{ source('alias_test_"qa_database"."qa_SCHEMA"', '"all_type_table"') }}

),

all_type_table_1 AS (

  SELECT * 
  
  FROM {{ source('alisa_qa_database_qa_SIMPLE_schema', '"all_type_table"') }}

),

Join_2 AS (

  SELECT 
    in3.TITLE AS TITLE,
    in3.EMPLOYEE_ID AS EMPLOYEE_ID,
    in3.MANAGER_ID AS MANAGER_ID,
    in5.C_INT AS C_INT,
    in5.C_STRING AS C_STRING,
    in2.C_NUMERIC AS C_NUMERIC,
    in1.C_REAL AS C_REAL,
    in0.C_VARCHAR AS C_VARCHAR
  
  FROM all_type_table AS in0
  INNER JOIN all_type_table_3 AS in1
     ON in0.c_int = in1.c_int
  INNER JOIN all_type_table_1 AS in2
     ON in1.c_int = in2.c_int
  INNER JOIN Employees_qa_SCHEMA AS in3
     ON in2.C_NUM != in3.EMPLOYEE_ID
  INNER JOIN all_type_table_1 AS in5
     ON in3.EMPLOYEE_ID != in5.C_INT

),

Limit_1 AS (

  {#Restricts the output to the first 29 records from the combined user accounts and usage logs.#}
  SELECT * 
  
  FROM Join_2 AS in0
  
  LIMIT 10

),

Transpose_1 AS (

  {#Transforms employee records into standardized name/value pairs to simplify reporting, comparison, and integration across systems.#}
  {{
    prophecy_basics.Transpose(
      ['Limit_1'], 
      ['TITLE', 'EMPLOYEE_ID'], 
      ['EMPLOYEE_ID', 'MANAGER_ID'], 
      'Name', 
      'Value', 
      ['TITLE', 'EMPLOYEE_ID', 'MANAGER_ID', 'C_INT', 'C_STRING', 'C_NUMERIC', 'C_REAL', 'C_VARCHAR'], 
      false
    )
  }}

),

MultiColumnEdit_1 AS (

  {#Standardizes key fields by adding a consistent prefix and formatting so records link reliably, reducing mismatches and improving reporting accuracy and downstream decision-making.#}
  {{
    prophecy_basics.MultiColumnEdit(
      ['Transpose_1'], 
      "concat(column_value, column_name)", 
      ['TITLE', 'EMPLOYEE_ID', 'Name', 'Value'], 
      ['TITLE', 'Name'], 
      false, 
      'Prefix', 
      ''
    )
  }}

)

SELECT *

FROM MultiColumnEdit_1
