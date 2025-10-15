#!/bin/bash

# Run dbt
echo "Running dbt..."
docker-compose run --rm dbt

# Check if new database was created
if [ -f duckDB/warehouse_new.db ]; then
    echo "Swapping database and restarting Metabase..."
    
    # Move new database to replace old one
    mv duckDB/warehouse_new.db duckDB/warehouse.db
    
    # Restart Metabase
    docker-compose restart metabase
    
    echo "Done! Metabase restarted with fresh data."
else
    echo "Error: New database not found"
    exit 1
fi