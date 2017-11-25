
USE pivot_experiments

ALTER TABLE dbo.fact_1_million_rows ADD PRIMARY KEY(id, year, fk_variable_code)
CREATE COLUMNSTORE INDEX cs1 ON pivot_experiments.dbo.fact_1_million_rows(id, year, fk_variable_code, VALUE);

ALTER TABLE dbo.fact_10_million_rows ADD PRIMARY KEY(id, year, fk_variable_code)
CREATE COLUMNSTORE INDEX cs1 ON pivot_experiments.dbo.fact_10_million_rows(id, year, fk_variable_code, VALUE);

ALTER TABLE dbo.fact_100_million_rows ADD PRIMARY KEY(id, year, fk_variable_code)
CREATE COLUMNSTORE INDEX cs1 ON pivot_experiments.dbo.fact_100_million_rows(id, year, fk_variable_code, VALUE);