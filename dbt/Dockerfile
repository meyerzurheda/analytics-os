FROM python:3.11-slim

WORKDIR /usr/app

# Install dbt
RUN pip install --no-cache-dir \
    dbt-core \
    dbt-duckdb

# Default command - runs dbt
CMD ["bash", "-c", "dbt run --profiles-dir . --target duckdb"]