

/*
Makes two empty tables as destinations for the pivotting operation.

Note that these are heaps at this stage.

*/

DROP TABLE IF EXISTS pivot_experiments.dbo.wide_case_when
DROP TABLE IF EXISTS pivot_experiments.dbo.wide_updates

CREATE TABLE pivot_experiments.dbo.wide_sum_case
(
	id		INT NOT NULL,
	year	INT NOT NULL,
	var0	INT NOT NULL,
	var1	FLOAT,
	var2	FLOAT,
	var3	FLOAT,
	var4	FLOAT,
	var5	FLOAT,
	var6	FLOAT,
	var7	FLOAT,
	var8	FLOAT,
	var9	FLOAT,
	var10	FLOAT,
	var11	FLOAT,
	var12	FLOAT,
	var13	FLOAT,
	var14	FLOAT,
	var15	FLOAT,
	var16	FLOAT,
	var17	FLOAT,
	var18	FLOAT,
	var19	FLOAT,
	var20	FLOAT,
	var21	FLOAT,
	var22	FLOAT,
	var23	FLOAT,
	var24	FLOAT,
	var25	FLOAT,
	var26	FLOAT,
	var27	FLOAT,
	var28	FLOAT,
	var29	FLOAT,
	var30	FLOAT
)	

-- Copy the structure into a second table
SELECT * 
INTO pivot_experiments.dbo.wide_updates 
FROM pivot_experiments.dbo.wide_case_when
WHERE 1 = 2



