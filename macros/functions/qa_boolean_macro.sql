{% macro qa_concat_macro_column(param1_column) %}
concat({{param1_column}}, 'hellomain_password')
{% endmacro %}

 {% macro qa_macro_call_another_macro_column(param_column) %}
concat({{ SQL_SnoflakeMainProject.qa_concat_macro_column(param_column) }}, {{param_column}})
{% endmacro %}

 {% macro qa_boolean_macro(input_column) %}
startswith('sasd', 'te') or REGEXP_LIKE({{input_column}}, 'san.*') or RLIKE({{input_column}}, 'san.*', 'i') or CONTAINS({{input_column}}, 'te') or ({{input_column}} LIKE '%j%h%do%')
{% endmacro %}

 {% macro qa_concat_macro(input_string) %}
concat(TRIM('{{input_string}}', '?-'), REPLACE('{{input_string}}', 'bc'), RIGHT('{{input_string}}', 3), CAST(HASH(SEQ8()) AS string), ASCII('A'), REPEAT('xy', 5), REVERSE('Hello, world!'), SUBSTR('testing 1 2 3', 9, 5), INSERT('abc', 1, 2, 'Z'), RTRIM('$125.00', '0.'), UUID_STRING(), sha1('{{input_string}}'), CAST(md5_binary('{{input_string}}') AS string), LPAD(' hello ', 10, ' '), DECOMPRESS_STRING(TO_BINARY('0920536E6F77666C616B65', 'HEX'), 'SNAPPY'), LPAD('.  hi. ', 10, '$'), DAYNAME(TO_DATE('2015-05-01')), CAST(LAST_DAY(TO_DATE('2015-05-08T23:39:20.123-07:00')) AS string), CAST(DATEADD(YEAR, 2, TO_DATE('2013-05-08')) AS string), CAST(DATEDIFF(MONTH, '2021-01-01'::DATE, '2021-02-28'::DATE) AS string), CAST(DATEDIFF(HOUR, '2013-05-08T23:39:20.123-07:00'::TIMESTAMP, DATEADD(YEAR, 2, ('2013-05-08T23:39:20.123-07:00')::TIMESTAMP)) AS string), CAST(TIMEDIFF(YEAR, '2017-01-01', '2019-01-01') AS string), CAST(TIME_SLICE('2019-02-28'::DATE, 4, 'MONTH', 'START') AS string), CAST(TRY_TO_TIME('12:30:00') AS string))
{% endmacro %}

 {% macro qa_number_macro(input_number=10) %}
(2 % 1.8) + (MOD({{input_number}}, 1.8)) + ({{input_number}} & 5) + (2 * {{input_number}}) + (5 + 10) - ({{input_number}} + 45) + (3 / 2) + (3 ^ 5) + abs(-1) + acos(1) + acosh(1) + array_position(array(3, 2, 1), 1) + array_size(array('b', 'd', 'c', 'a')) + ascii(2) + asin(0) + asinh(0) + atan(0) + atan2(0, 0) + atanh(0) + bit_count(0) + bit_get(11, 0) + bit_length('Spark SQL') + bround(25, -1) + cardinality(array('b', 'd', 'c', 'a')) + cardinality(map('a', 1, 'b', 2)) + CAST('10' AS int) + cbrt(27.0) + ceil(3.1411, 3) + ceiling(3.1411, 3) + char_length('Spark SQL ') + coalesce(NULL, 1, NULL) + conv('100', 2, 10) + cos(0) + cosh(0) + cot(1) + csc(1) + day('2009-07-30') + dayofmonth('2009-07-30') + dayofweek('2009-07-30') + dayofyear('2016-04-09') + degrees(3.141592653589793) + element_at(array(1, 2, 3), 2) + exp(0) + expm1(0) + EXTRACT(SECONDS FROM TIMESTAMP'2019-10-01 00:00:01.000001') + EXTRACT(MINUTE FROM INTERVAL '123 23:55:59.002001' DAY TO SECOND) + factorial(2) + find_in_set('ab', 'abc,b,ab,c,def') + floor(-0.1) + getbit(11, 0) + greatest(10, 9, 2, 4, 3) + instr('SparkSQL', 'SQL') + json_array_length('[1,2,3,{"f1":1,"f2":[5,6]},4]') + least(10, 9, 2, 4, 3) + length('Spark SQL ') + levenshtein('kitten', 'sitting') + ln(10) + locate('bar', 'foobarbar') + log(10, 100) + log10(10) + log1p(0) + log2(2) + minute('2009-07-30 12:58:59') + (2 % 1.8) + month('2016-07-30') + months_between('1997-02-28 10:30:00', '1996-10-30', false) + nanvl(CAST('NaN' AS double), 123) + negative(100) + nvl2(NULL, 2, 1) + octet_length('Spark SQL') + pi() + pmod(10, 3) + position('bar', 'foobarbar') + positive(1) + pow(2, 3) + power(2, 3) + quarter('2016-08-31') + radians(180) + rand() + randn() + random() + rint(12.3456) + round(2.5, 0) + sec(0) + second('2009-07-30 12:58:59') + shiftleft(2, 1) + shiftright(4, 1) + shiftrightunsigned(4, 1) + sign(40) + signum(40) + sin(0) + sinh(0) + size(array('b', 'd', 'c', 'a'))
{% endmacro %}

 {% macro round_function(n1, scale=2) %}
ROUND({{n1}}, {{scale}})
{% endmacro %}

 {% macro multi_macro_expressions(param_float=12, param_array=[1, 2, 3], param_dict=[1, 2, 3]) %}
concat({{param_float}} + {{param_array[0]}}, 'hello')
{% endmacro %}

 {% macro qa_macro_call_another_macro(final_param_string_only='random data') %}
concat({{ SQL_SnoflakeMainProject.qa_concat_macro(final_param_string_only) }}, '{{final_param_string_only}}')
{% endmacro %}

 