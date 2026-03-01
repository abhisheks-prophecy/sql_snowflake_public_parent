WITH country_classification AS (

  SELECT * 
  
  FROM {{ ref('country_classification')}}

),

service_classification AS (

  SELECT * 
  
  FROM {{ ref('service_classification')}}

),

Join_1 AS (

  SELECT * 
  
  FROM country_classification AS in0
  INNER JOIN service_classification AS in1

)

SELECT *

FROM Join_1
