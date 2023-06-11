# PVC
Vultr Kubernetes Engine의 특성상 Block Storage의 Minimum Size가 정해져있다. 따라서 Helm으로 설치한 앱들의 경우 그 크기를 조정해줘야 하는 경우가 생기는데, 이를 위해 따로 yaml 파일을 선언한 뒤, 기존 PVC를 제거하고 Argo에서 Sync를 걸어서 등록해준다.

기본적으로 NVME SSD의 Minimum Size는 10Gi ($0.1 per 1Gi), HDD의 Minimum Size는 40Gi ($0.025 per 1Gi) 이다. 그런데, 서울 리전에서는 2023년 6월 기준으로 SSD Block Storage가 지원되지 않아서... 울며 겨자먹기로 최소 40Gi로 맞춰줘야 한다.

## ArgoCD PVC
- pvc : redis-data-argocd-redis-master-0
- class : vultr-block-storage-hdd
- size : 40Gi

## Loki PVC
- pvc : storage-loki-stack-0
- class : vultr-block-storage-hdd
- size : 40Gi

## Gitea PVC
- basic pvc
    - pvc : data-gitea-0
    - class : vultr-block-storage-hdd
    - size : 40Gi
- database pvc
    - pvc : data-gitea-postgresql-0
    - class : vultr-block-storage-hdd
    - size : 40Gi

## Vault PVCs
일단 Vault를 사용하지 않는 쪽으로 갈 계획이라, 만들어뒀던 PVC는 주석처리하였음
