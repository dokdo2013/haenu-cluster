# haenu-cluster
Haenu Cluster GitOps Repository

## 구조
- Cluster : Vultr Kubernetes Engine (VKE)
- Container Registry : Docker Hub
- CI : Github Actions
- CD : ArgoCD

Git Push -> Build Container Image (Github Actions) -> Upload image to harbor -> Change `haenu-cluster` repo's image tag -> ArgoCD Trigger -> Sync k8s cluster

## 주요 관리 앱
도메인으로 연결되어 있으면 경로를 작성합니다. 외부로 열려있는 앱들은 보안을 위해 CF Zero Trust를 일괄 적용하였으며, 적용이 어려운 경우에는 접속 IP 제한을 겁니다.

|분류|이름|경로|비고|
|-----|-----|-----|-----|
|CI/CD|ArgoCD|[https://argo.haenu.xyz](https://argo.haenu.xyz)|CF Zero Trust 적용|
|모니터링|Grafana|[https://grafana.haenu.xyz](https://grafana.haenu.xyz)|CF Zero Trust 적용|
