/*
this script was mean tto just verify things were ok.  But they weren't at first go...
OK now (problem was duplicate person-year-variable combinations from the original source; have
now fixed that

*/
USE pivot_experiments

-- everything should be zero on a test case variable, at least to 15 decimal places:
SELECT
	*,
	updates_avg_var20 - sumcase_avg_var20 AS difference
FROM
	(SELECT 
		AVG(var20) AS updates_avg_var20, 
		year       AS updates_year
	FROM wide_updates 
	GROUP BY year) AS a
INNER JOIN
	(SELECT 
		AVG(var20)  AS sumcase_avg_var20, 
		year        AS sumcase_year
	FROM wide_sum_case 
	GROUP BY year) AS b
ON a.updates_year = b.sumcase_year
ORDER BY difference DESC

-- should be no examples of contradictions:
select top 50 a.id, a.year, a.var21, b.var21, c.value 
from wide_updates AS a 
inner join wide_sum_case AS b on a.year = b.year and a.id = b.id 
inner join fact_14_million_rows AS c on a.year =c.year and a.id = c.id 
where a.var21 != b.var21 AND c.fk_variable_code = 21


