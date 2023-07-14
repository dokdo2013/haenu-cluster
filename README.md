# haenu-clusters
Haenu Clusters GitOps Repository

## 기본 구조
- Cluster : Vultr Kubernetes Engine (VKE)
- Container Registry : Docker Hub
- CI : Github Actions
- CD : ArgoCD

Git Push -> Build Container Image (Github Actions) -> Upload image to Docker Hub -> Change `haenu-cluster` repo's image tag -> ArgoCD Trigger -> Sync k8s cluster

## 클러스터 구조 (작업 중)
기존 단일 클러스터 구조에서 Management Cluster과 Develop Cluster를 추가하여 보다 효율적으로 클러스터를 운영하고자 합니다.

- Production Cluster (prd) : 프로덕션 환경의 앱을 배포합니다. HA, 무중단 배포 등 프로덕션 환경에 알맞은 설정을 합니다.
- Develop Cluster (dev) : 개발/테스트 환경의 앱을 배포합니다.
- Management Cluster (mgmt) : ArgoCD, Grafana 등 공통 앱을 배포합니다.

## Terraform (TBD)

Terraform으로 IaC 작업 예정입니다.

## 주요 관리 앱
도메인으로 연결되어 있으면 경로를 작성합니다. 외부로 열려있는 앱들은 보안을 위해 접속 IP를 제한합니다.

|분류|이름|경로|비고|
|-----|-----|-----|-----|
|CI/CD|ArgoCD|[https://argo.haenu.xyz](https://argo.haenu.xyz)|IP 제한 적용|
|모니터링|Grafana|[https://grafana.haenu.xyz](https://grafana.haenu.xyz)|IP 제한 적용|
|모니터링|Loki & Promtail||파드 로그 수집|
|모니터링|Prometheus||메트릭 수집|
|모니터링|Uptime Kuma|[https://kuma.haenu.xyz](https://kuma.haenu.xyz)|Health Check|
|깃 서버|Gitea|[https://git.haenu.xyz](https://git.haenu.xyz)|IP 제한 적용|
|Ingress|Nginx-Ingress-Controller|||
|Secret|Sealed Secret||시크릿 관리|

## 레포 구성
|경로|용도|설명|
|-----|-----|-----|
|`/apps`|GitOps Repo|앱별 k8s yaml 파일 저장, 빌드시 이미지 태그 지정하도록 구성|
|`/common`|GitOps Repo|앱 외에 공통 처리를 위해 필요한 yaml 파일 저장, ArgoCD와 동기화됨|
|`/pvc`|GitOps Repo|VKE PVC 설정을 위한 yaml 파일 저장, ArgoCD와 동기화됨|
|`/docs`|문서|Cluster 구축 및 운영 과정에서 작성된 문서 모음|
|`/templates`|템플릿 모음|각 상황별 템플릿 yaml, Dockerfile 등 자료 모음|

## 배포 앱 정보
`docs/apps/README.md` 참고

## TODO
- 클러스터 분리 (mgmt - prod - dev)
- 데이터베이스 이전 (RDS to Vitess)
- IaC 구축
- 브랜치별 배포 전략 구축
