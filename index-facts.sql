
USE pivot_experiments

ALTER TABLE dbo.fact_0_million_rows ADD PRIMARY KEY(id, year, fk_variable_code)
CREATE COLUMNSTORE INDEX cs1 ON pivot_experiments.dbo.fact_0_million_rows(id, year, fk_variable_code, VALUE);


ALTER TABLE dbo.fact_1_million_rows ADD PRIMARY KEY(id, year, fk_variable_code)
CREATE COLUMNSTORE INDEX cs1 ON pivot_experiments.dbo.fact_1_million_rows(id, year, fk_variable_code, VALUE);

ALTER TABLE dbo.fact_4_million_rows ADD PRIMARY KEY(id, year, fk_variable_code)
CREATE COLUMNSTORE INDEX cs1 ON pivot_experiments.dbo.fact_4_million_rows(id, year, fk_variable_code, VALUE);


ALTER TABLE dbo.fact_14_million_rows ADD PRIMARY KEY(id, year, fk_variable_code)
CREATE COLUMNSTORE INDEX cs1 ON pivot_experiments.dbo.fact_14_million_rows(id, year, fk_variable_code, VALUE);

