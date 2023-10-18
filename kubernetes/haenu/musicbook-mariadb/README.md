# MariaDB
In-cluster MariaDB for musicbook

## Base Chart
https://github.com/bitnami/charts/tree/main/bitnami/mariadb

## Installation
```bash
helm install musicbook-mariadb -n db -f values.yaml bitnami/mariadb
```

## Values Features
- 인증 기능 비활성화
- Replica Count 1
- PV 사용 안 함
