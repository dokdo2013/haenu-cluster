# haenu-cluster
Haenu Cluster GitOps Repository

## 구조
- Cluster : Vultr Kubernetes Engine (VKE)
- Container Registry : Docker Hub
- CI : Github Actions
- CD : ArgoCD

Git Push -> Build Container Image (Github Actions) -> Upload image to Docker Hub -> Change `haenu-cluster` repo's image tag -> ArgoCD Trigger -> Sync k8s cluster

## 주요 관리 앱
도메인으로 연결되어 있으면 경로를 작성합니다. 외부로 열려있는 앱들은 보안을 위해 CF Zero Trust를 일괄 적용하였으며, 적용이 어려운 경우에는 접속 IP 제한을 겁니다.

|분류|이름|경로|비고|
|-----|-----|-----|-----|
|CI/CD|ArgoCD|[https://argo.haenu.xyz](https://argo.haenu.xyz)|CF Zero Trust 적용|
|모니터링|Grafana|[https://grafana.haenu.xyz](https://grafana.haenu.xyz)|CF Zero Trust 적용|
|모니터링|Loki||파드 로그 수집|
|모니터링|Uptime Kuma|[https://kuma.haenu.xyz](https://kuma.haenu.xyz)|Health Check|

## 레포 구성
|경로|용도|설명|
|-----|-----|-----|
|`/apps`|GitOps Repo|앱별 k8s yaml 파일 저장, 빌드시 이미지 태그 지정하도록 구성|
|`/common`|GitOps Repo|앱 외에 공통 처리를 위해 필요한 yaml 파일 저장, ArgoCD와 동기화됨|
|`/pvc`|GitOps Repo|VKE PVC 설정을 위한 yaml 파일 저장, ArgoCD와 동기화됨|
|`/docs`|문서|Cluster 구축 및 운영 과정에서 작성된 문서 모음|
|`/templates`|템플릿 모음|각 상황별 템플릿 yaml, Dockerfile 등 자료 모음|

## 배포 앱 목록
|앱 이름|네임스페이스|경로|분류|구성|링크|특징|비고|
|-----|-----|-----|-----|-----|-----|-----|-----|
|music-c6h12o6-kr|haenu|`/apps/music.c6h12o6.kr`|FrontEnd|CRA+Nginx|[Github](https://github.com/dokdo2013/music.c6h12o6.kr) / [Link](https://music.c6h12o6.kr)||기존 Vercel 배포|
|c6h12o6-api|haenu|`/apps/c6h12o6-api`|BackEnd|FastAPI|[Github private](https://github.com/dokdo2013/c6h12o6-api) / [Swagger](https://api.c6h12o6.kr/docs)||기존 EC2 배포|

