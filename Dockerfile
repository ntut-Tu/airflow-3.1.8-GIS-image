FROM apache/airflow:3.1.8-python3.12@sha256:740da888bf8367e75e6db8c8cd62c4d7b4e6744cdf0e9b53bf4467458f8dadab

ARG AIRFLOW_VERSION=3.1.8
ARG PYTHON_MAJOR_MINOR=3.12
#ARG AIRFLOW_CONSTRAINTS_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_MAJOR_MINOR}.txt"

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    libgdal-dev \
    libproj-dev \
    proj-bin \
    proj-data \
    geos-bin \
    g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV CPLUS_INCLUDE_PATH=/usr/include/gdal \
    C_INCLUDE_PATH=/usr/include/gdal

COPY --chown=airflow:0 requirements.txt /opt/airflow/requirements.txt

USER airflow

RUN python -m pip install --no-cache-dir -r /opt/airflow/requirements.txt
