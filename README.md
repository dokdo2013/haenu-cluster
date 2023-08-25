# haenu-cluster
Haenu Cluster Repository

## Basic Structure
- Cluster : Vultr Kubernetes Engine (VKE)
- Container Registry : Docker Hub
- CI : Github Actions
- CD : ArgoCD
- Infrastructure Provisioning : Terraform (with Terraform Cloud)

Git Push -> Build Container Image (Github Actions) -> Upload image to Docker Hub -> Change `haenu-cluster` repo's image tag -> ArgoCD Trigger -> Sync k8s cluster

## Cluster Structure
원래 환경별로 클러스터를 분리할 예정이었으나, 비용 문제로 단일 클러스터 운영 체제로 유지합니다.

## Terraform
- BackEnd/States : Terraform Cloud
- `/terraform` 경로에서 IaC가 이뤄집니다. 푸시하면 Plan은 자동으로 TF Cloud에서 이뤄지고, Apply는 TF Cloud 콘솔에서 실행해야 합니다. (Auto Apply 꺼뒀음)
- 아직 모든 인프라가 테라포밍되지 않았습니다.

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
|`/terraform`|테라폼 코드|인프라 프로비저닝을 위한 테라폼 코드 모음|

## 배포 앱 정보
`docs/apps/README.md` 참고

## TODO
- 데이터베이스 이전 (RDS to Vitess)
- Feature Branch 또는 PR별 배포 전략 구축
