# loki-stack
Loki, Promtail for log collection

## Base Chart
https://github.com/grafana/helm-charts/tree/main/charts/loki-stack

## Installation
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

helm install loki-stack -n monitoring -f values.yaml grafana/loki-stack
```
