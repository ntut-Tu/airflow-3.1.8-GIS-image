# airflow-3.1.8-python3.12-GIS-image

This repository builds a single Airflow image that includes GIS and data processing dependencies while staying aligned with the Airflow constraints.

The release builds will be based on `release` branch.

## Build Image

Build the image:

```bash
docker build -f Dockerfile -t airflow-3.1.8-gis:latest .
```

## Included Packages

Dependencies are managed in `pyproject.toml` and locked in `uv.lock`.
For the full list, refer to those files.

