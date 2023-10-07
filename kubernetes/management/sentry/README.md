# sentry
Error monitoring and reporting tool

## Base Chart
https://github.com/sentry-kubernetes/charts

## Installation
```bash
helm repo add sentry https://sentry-kubernetes.github.io/charts

helm install sentry -n sentry -f values.yaml sentry/sentry
```
