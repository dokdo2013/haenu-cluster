# haenu-cluster
Haenu Cluster Repository

## Basic Structure
- Cluster : Vultr Kubernetes Engine (VKE)
- Container Registry : Docker Hub
- CI : Github Actions / Jenkins
- CD : ArgoCD
- Infrastructure Provisioning : Terraform

Git Push -> Build Container Image (Github Actions / Jenkins) -> Upload image to Docker Hub -> Change `haenu-cluster` repo's image tag -> ArgoCD Trigger -> Sync k8s cluster

## Cluster Structure
- management : ArgoCD, Grafana 등 관리 앱들이 배포되는 클러스터
- haenu : 주요 앱들이 배포되는 클러스터
- archivers : 아카이버스 서비스 전용 클러스터

## Terraform
- BackEnd/States : Local

## 주요 관리 앱
도메인으로 연결되어 있으면 경로를 작성합니다. 외부로 열려있는 앱들은 보안을 위해 접속 IP를 제한합니다.

|분류|이름| 경로                                                     |비고|
|-----|-----|--------------------------------------------------------|-----|
|CI/CD|ArgoCD| [https://argo.haenu.dev](https://argo.haenu.dev)       |IP 제한 적용|
|모니터링|Grafana| [https://grafana.haenu.dev](https://grafana.haenu.dev) |IP 제한 적용|
|모니터링|Loki & Promtail|                                                        |파드 로그 수집|
|모니터링|Prometheus|                                                        |메트릭 수집|
|Ingress|Nginx-Ingress-Controller|                                                        ||
|Secret|Sealed Secret|                                                        |시크릿 관리|

## 레포 구성
| 경로            | 용도             | 설명                                     |
|---------------|----------------|----------------------------------------|
| `/apps`       | GitOps Repo    | 앱별 k8s yaml 파일 저장, 빌드시 이미지 태그 지정하도록 구성 |
| `/deployment` | Argo Manifests | ArgoCD 앱 배포에 대한 CRD Manifests 모음       |
| `/kubernetes`    | App Manifests         | 쿠버네티스 클러스터에 배포되는 공통 Helm Manifests 모음  |
| `/docs`       | 문서             | Cluster 구축 및 운영 과정에서 작성된 문서 모음         |
| `/templates`  | 템플릿 모음         | 각 상황별 템플릿 yaml, Dockerfile 등 자료 모음     |
| `/terraform`  | 테라폼 코드         | 인프라 프로비저닝을 위한 테라폼 코드 모음                |

