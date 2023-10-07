# metrics-server
Kubernetes Metrics Server

## Base Chart
https://artifacthub.io/packages/helm/metrics-server/metrics-server

## Installation
```bash
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/

helm upgrade --install metrics-server -n monitoring -f values.yaml metrics-server/metrics-server
```
