
USE pivot_experiments


SELECT
	*,
	updates_year - sumcase_year AS difference
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

