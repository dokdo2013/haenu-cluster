# Github Actions를 이용한 CI

## Workflow yaml 파일 준비
Dockerfile을 빌드하여 Docker Hub에 올리고 이미지 태그를 GitOps 레포에 넣는 Workflow

yaml 내에 앱 이름은 적절히 바꿔주면 된다. 브랜치도 master가 아니라 main이라면, main으로 설정해주면 된다.
```yaml
# Example Workflow (Just Dockerfile Build)

name: CI/CD to Haenu Cluster

on:
  push:
    branches: [ master ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v1

    - name: Login to Docker Hub
      uses: docker/login-action@v2
      with:
        username: ${{ secrets.DOCKERHUB_USERNAME }}
        password: ${{ secrets.DOCKERHUB_TOKEN }}

    - name: Build and push Docker image
      id: docker_build
      uses: docker/build-push-action@v2
      with:
        context: .
        push: true
        tags: hyeonwoo5342/music.c6h12o6.kr:${{ github.run_number }}

  deploy:
    needs: build
    runs-on: ubuntu-latest

    steps:
    - name: Checkout GitOps repository
      uses: actions/checkout@v3
      with:
        repository: dokdo2013/haenu-cluster
        token: ${{ secrets.GITOPS_TOKEN }}
        path: gitops

    - name: Update deployment tag in GitOps repo
      run: |
        APP_NAME="music.c6h12o6.kr"
        cd gitops/apps/${APP_NAME}
        sed -i "s|image: hyeonwoo5342/${APP_NAME}:.*|image: hyeonwoo5342/${APP_NAME}:${{ github.run_number }}|g" deployment.yaml
        git config user.name "dokdo2013"
        git config user.email "hyeonwoo5342@gmail.com"
        git add .
        git commit -m "feat(${APP_NAME}): Build and deploy new commit ${{ github.run_number }}"
        git push
```

## Github Actions 환경변수 설정
- `DOCKERHUB_USERNAME` : Docker Hub User Name
- `DOCKERHUB_TOKEN` : Docker Hub에서 발급받은 토큰
- `GITOPS_TOKEN` : Github 계정 토큰

## 빌드 단계에서 환경변수 주입
작성 필요