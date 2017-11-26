/*
this is the 'straightforward' method:

Timings:
"0m rows" (140,000) 2 seconds
"1m rows" (1.4m) 16 seconds,  16 seconds
"2m rows" (2.1m)  23 seconds, 22 seconds, 23 seconds
"4m rows"  (4.2m) 53 seconds, 46 seconds
"14m rows" (14m)  450 seconds, 396.  So as the data gets bigger, the length of the pivot operation goes up non-linearly


*/

INSERT pivot_experiments.dbo.wide_case_when
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






ALTER TABLE pivot_experiments.dbo.wide_case_when ADD PRIMARY KEY (id, year)




