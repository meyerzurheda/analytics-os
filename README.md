# Analytics OS

Not all data is big data. Most businesses struggle with analytics not because of the size of their data but because it is disjoined. What is needed is a simple way to bring all relevant data sets together, build models ontop of them and serve them in reports and dashboards to BI stakeholders. 

This projects spins up all necessary services to 

- ingest data from different systems 
- store it in a local MinIO bucket
- process and model it with DBT and duckDB
- create dashboards on Metabase

# Project Setup

- Ingestion: Airbyte
- Raw Data Storage: Minio (S3 compatible storage)
- Processing: DBT
- Analytical Data Storage: DuckDB
- Visualisation: Metabase

- Postgres to store configuration of Airbyte and Metabase

# Setup

## Transform, Load and Show

Use docker compose to spin up all services:

```
docker-compose up
```

This will run

- MinIO Bucket on port 9000
- MinIO UI on port 9001
- Metabase on port 3030
- Postgres on port 55432

### Connect Metabase to the DuckDB warehouse

In Metabase add a database, select DuckDB and point it to `/var/data/warehouse.db`.
Select `Establish a read-only connection` and add `access_mode=read_only` to "Additional DuckDB connection string options" in "Advanced Settings.

## Airbyte

Running Airbyte via Docker is deprecated as Airbyte itself needs to spin up processes. Instead the recommended way to run it locally is via K8S. Airbyte provides a CLI tool for that `abctl` that sets up the cluster and installs all necessary resources.

To let Airbyte use the Postgres database that is running via docker compose we need create a secret and patch the helm chart via `airbyte/values.yaml`.
Adjust the database host depending on your docker runtime (`host.lima.internal` for Colima)

```
abctl local install -v --secret airbyte/airbyte-secret --values airbyte/values.yaml
```