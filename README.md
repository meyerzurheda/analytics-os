# AnalyticsOS

Todos

[ ] 


# Run

```
docker run -v ./:/container/directory --name metabase_duckdb -d -p 3000:3000 metabase_duckdb
```

docker run -d \
  -v $(pwd)/metabase-data/metabase.db:/metabase.db \
  -v $(pwd)/warehouse-data:/home/metabase/data \
  -p 3000:3000 \
  -e MB_API_KEY="testkey" \
  --name metabase_duckdb \
  metabase_duckdb

curl http://localhost:3000/api/notify/db/2 \
  --request POST \
  --header 'Content-Type: application/json' \
  --header 'X-Metabase-Apikey: testkey' \
  --data '{"scan": "full"}'