FROM apache/airflow:3.1.8-python3.12

USER root

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    gdal-bin \
    libgdal-dev \
    proj-bin \
    geos-bin \
    cmake \
    unar \
    postgis \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

COPY pyproject.toml /tmp/app/
RUN uv pip install --system --no-cache \
        --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-3.1.8/constraints-3.12.txt" \
        "/tmp/app" && \
    rm -rf /tmp/app

USER airflow