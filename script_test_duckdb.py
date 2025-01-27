import duckdb

with duckdb.connect('./duckdb_data/data.db') as con:
    result = con.execute("SHOW TABLES").fetchall()
    print(result)