# airflow-3.1.8-python3.12-GIS-image

To bypass dependency conflicts between compute packages (e.g., GIS, dbt) and Airflow core dependencies, this repository now splits the Docker image into two distinct versions:

- `airflow` image: A lightweight runtime strictly for the scheduler and webserver.
- `worker` image: Extends the `airflow` image by layering on heavy GIS and dbt dependencies. This separation allows workers to run complex data processing tasks without breaking the core Airflow environment.

The release builds will be based on `release` branch.

## Build Images

Build airflow base image first:

```bash
docker build -f Dockerfile -t airflow-3.1.8-gis:airflow .
```

Then build worker image on top of airflow image:

```bash
docker build -f Dockerfile.worker \
  --build-arg BASE_AIRFLOW_IMAGE=airflow-3.1.8-gis:airflow \
  -t airflow-3.1.8-gis:worker .
```

## Included Packages

Dependencies are split by runtime role:

### Airflow Core Packages (`requirements-airflow.txt`)
Minimal packages for the scheduler and webserver.

| Package | Version |
|---|---|
| apache-airflow-providers-airbyte | >=4.0.0 |
| apache-airflow-providers-cncf-kubernetes | >=10.0.0 |
| apache-airflow-providers-fab | - |
| apache-airflow-providers-postgres | >=6.0.0 |
| boto3 | >=1.34.0 |
| kubernetes | >=30.0.0 |
| psycopg2-binary | - |
| requests | >=2.31.0 |

### Worker Packages (`requirements-worker.txt`)
Worker-only GIS, dbt, and data processing packages.

| Package | Version   |
|---|-----------|
| astronomer-cosmos[dbt.postgres] | >=1.11.0  |
| cdsapi | >=0.7.0   |
| dbt-core | ==1.9.1   |
| dbt-postgres | ==1.9.0   |
| duckdb | >=1.0.0   |
| GDAL | ==3.6.2   |
| geoalchemy2 | ==0.15.2  |
| geocoder | ==1.38.1  |
| geopandas | ==1.0.1   |
| h3 | ==4.0.0b2 |
| h3_toolkit | >=0.3.11  |
| h3ronpy | ==0.21.0  |
| nest_asyncio | >=1.6.0   |
| netCDF4 | >=1.6.0   |
| polars | >=1.2.1   |
| rarfile | >=4.2     |
| rasterio | ==1.4.2   |
| rasterstats | ==0.19.0  |
| tqdm | >=4.66.5  |
| xlrd | ==2.0.1   |