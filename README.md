# airflow-3.1.8-python3.12-GIS-image

A custom Airflow image, pre-configured with python 3.12 and other essential packages for geospatial data processing workflows.

The release builds will be based on `release` branch.

## Included Packages

Pinned packages are maintained in `requirements.txt`, you may fork and change them into yours.

| Package | Version |
|---|---|
| apache-airflow-providers-airbyte | >=4.0.0 |
| apache-airflow-providers-cncf-kubernetes | >=10.0.0 |
| apache-airflow-providers-fab | - |
| apache-airflow-providers-postgres | >=6.0.0 |
| astronomer-cosmos[dbt.postgres] | >=1.11.0 |
| boto3 | >=1.34.0 |
| cdsapi | >=0.7.0 |
| dbt-core | ==1.9.1 |
| dbt-postgres | ==1.9.0 |
| duckdb | >=1.0.0 |
| GDAL | ==3.6.2 |
| geoalchemy2 | ==0.15.2 |
| geocoder | ==1.38.1 |
| geopandas | ==1.0.1 |
| h3 | ==4.0.0b2 |
| h3_toolkit | ==0.3.11 |
| h3ronpy | ==0.21.0 |
| kubernetes | >=30.0.0 |
| nest_asyncio | >=1.6.0 |
| netCDF4 | >=1.6.0 |
| polars | >=1.2.1 |
| psycopg2-binary | - |
| rarfile | >=4.2 |
| rasterio | ==1.4.2 |
| rasterstats | ==0.19.0 |
| requests | >=2.31.0 |
| tqdm | >=4.66.5 |
| xlrd | ==2.0.1 |