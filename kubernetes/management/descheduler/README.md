# descheduler
Kubernetes descheduler

## Base Chart
https://artifacthub.io/packages/helm/descheduler/descheduler

## Installation
```bash
helm repo add descheduler https://kubernetes-sigs.github.io/descheduler/

helm install descheduler -n kube-system -f values.yaml descheduler/descheduler
```
