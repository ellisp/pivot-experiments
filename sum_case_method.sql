/*
this is the 'straightforward' method:

Timings:
"0m rows" 2 seconds
"1m rows" 16 seconds in total, of which about half is the pivot operation and half is the primary key
"14m rows" 450 seconds.  So as the data gets bigger, the length of the pivot operation goes up non-linearly


*/

INSERT pivot_experiments.dbo.wide_sum_case
SELECT 
	id,
	year,
	SUM(CASE WHEN fk_variable_code = 0 THEN value ELSE NULL END) AS var0,
	SUM(CASE WHEN fk_variable_code = 1 THEN value ELSE NULL END) AS var1,
	SUM(CASE WHEN fk_variable_code = 2 THEN value ELSE NULL END) AS var2,
	SUM(CASE WHEN fk_variable_code = 3 THEN value ELSE NULL END) AS var3,
	SUM(CASE WHEN fk_variable_code = 4 THEN value ELSE NULL END) AS var4,
	SUM(CASE WHEN fk_variable_code = 5 THEN value ELSE NULL END) AS var5,
	SUM(CASE WHEN fk_variable_code = 6 THEN value ELSE NULL END) AS var6,
	SUM(CASE WHEN fk_variable_code = 7 THEN value ELSE NULL END) AS var7,
	SUM(CASE WHEN fk_variable_code = 8 THEN value ELSE NULL END) AS var8,
	SUM(CASE WHEN fk_variable_code = 9 THEN value ELSE NULL END) AS var9,
	SUM(CASE WHEN fk_variable_code = 10 THEN value ELSE NULL END) AS var10,
	SUM(CASE WHEN fk_variable_code = 11 THEN value ELSE NULL END) AS var11,
	SUM(CASE WHEN fk_variable_code = 12 THEN value ELSE NULL END) AS var12,
	SUM(CASE WHEN fk_variable_code = 13 THEN value ELSE NULL END) AS var13,
	SUM(CASE WHEN fk_variable_code = 14 THEN value ELSE NULL END) AS var14,
	SUM(CASE WHEN fk_variable_code = 15 THEN value ELSE NULL END) AS var15,
	SUM(CASE WHEN fk_variable_code = 16 THEN value ELSE NULL END) AS var16,
	SUM(CASE WHEN fk_variable_code = 17 THEN value ELSE NULL END) AS var17,
	SUM(CASE WHEN fk_variable_code = 18 THEN value ELSE NULL END) AS var18,
	SUM(CASE WHEN fk_variable_code = 19 THEN value ELSE NULL END) AS var19,
	SUM(CASE WHEN fk_variable_code = 20 THEN value ELSE NULL END) AS var20,
	SUM(CASE WHEN fk_variable_code = 21 THEN value ELSE NULL END) AS var21,
	SUM(CASE WHEN fk_variable_code = 22 THEN value ELSE NULL END) AS var22,
	SUM(CASE WHEN fk_variable_code = 23 THEN value ELSE NULL END) AS var23,
	SUM(CASE WHEN fk_variable_code = 24 THEN value ELSE NULL END) AS var24,
	SUM(CASE WHEN fk_variable_code = 25 THEN value ELSE NULL END) AS var25,
	SUM(CASE WHEN fk_variable_code = 26 THEN value ELSE NULL END) AS var26,
	SUM(CASE WHEN fk_variable_code = 27 THEN value ELSE NULL END) AS var27,
	SUM(CASE WHEN fk_variable_code = 28 THEN value ELSE NULL END) AS var28,
	SUM(CASE WHEN fk_variable_code = 29 THEN value ELSE NULL END) AS var29,
	SUM(CASE WHEN fk_variable_code = 30 THEN value ELSE NULL END) AS var30
FROM pivot_experiments.dbo.fact_14_million_rows
GROUP BY id, year
-- seven seconds from 1 million rows





ALTER TABLE pivot_experiments.dbo.wide_sum_case ADD PRIMARY KEY (id, year)




