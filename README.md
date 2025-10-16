# Analytics OS
  
> Not all data is big data. Most teams struggle with *disjointed* data, not petabytes.

**Analytics OS** is a batteries‑included modern data stack that runs for ≈$1/day,
optimized for <100 GB analytical workloads, fast iteration, and simple ops.

Most businesses struggle with analytics not because of the size of their data but because it is disjoined. What is needed is a simple way to bring all relevant data sets together, build models ontop of them and serve them in reports and dashboards to BI stakeholders. 

Here we setup a whole analytics data lake with BI tooling that runs on <1$ a day.

| Component | Example plan (Oct 2025) | Est. monthly |
|-----------|--------------------------|--------------|
| Compute   | Hetzner CX43 (shared vCPU) | €11–€12 |
| Domain    | Any registrar             | €1–€2 (or 0€ if you already have one) |
| SSL       | Let’s Encrypt via Caddy   | €0          |
| Storage   | Local NVMe (MinIO on host)| included    |


### Who is this for?
- Early-stage startups and SMBs with < ~100 GB analytical data and a small BI team
- Teams prioritizing cost, simplicity, and fast iteration over petabyte-scale throughput

### Non-goals
- Petabyte-scale warehousing or heavy concurrency
- Complex governance/SOX workflows out of the box

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


## License
[MIT](./LICENSE) © 2025 Clemens Meyer zu Rheda
