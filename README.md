# Analytics OS
  
> Not all data is big data. 

> Don't pay for big data infrastructure if you don't need to

Most businesses struggle with analytics not because of the size of their data but because it is disjoined. What is needed is a simple way to bring all relevant data sets together, build models ontop of them and serve them in reports and dashboards to BI stakeholders. 

Here we setup a whole analytics data lake with BI tooling that runs on <1$ a day.

## Disclaimer

This project is meant as a proof-of-concept. Make sure you know what you are doing if you use it in production 😊

# Project Setup

This projects spins up all necessary services on a single host to 

- ingest data from different systems via **Airbyte**
- store it in a local **MinIO** bucket
- process and model it with **DBT** and **duckDB**
- create dashboards on **Metabase**

![image](./docs/images/architecture.svg)

Additionally it uses Postgres to store configuration of Airbyte and Metabase and uses Caddy as a reverse proxy.


# How to start 🚀

Follow the [deployment tutorial](./docs/hetzner.md) for a server on Hetzner.

This will take about 30 minutes and by the end you will have a complete pipeline running from an external source to a report on Metabase, all running online so you can start inviting other stakeholders to participate. 🎉

