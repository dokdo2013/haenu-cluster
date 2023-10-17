# kube-prometheus-stack
Kubernetes-native Prometheus monitoring stack.

## Base Chart
https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack

## Installation
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install kube-prometheus-stack -n monitoring -f values.yaml prometheus-community/kube-prometheus-stack
```
