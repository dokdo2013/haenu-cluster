# Redis
In-cluster Redis for caching

## Base Chart
https://github.com/bitnami/charts/tree/main/bitnami/redis

## Installation
```bash
helm install redis -n default -f values.yaml bitnami/redis
```

## Values Features
- 인증 기능 비활성화
- Replica Count 1
- PV 사용 안 함
