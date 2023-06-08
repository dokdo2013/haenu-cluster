# haenu-cluster
Haenu Cluster GitOps Repository

## Structure
- Cluster : Vultr Kubernetes Engine (VKE)
- Container Registry : Harbor (Self Hosted)
- CI : Github Actions
- CD : ArgoCD

Git Push -> Build Container Image (Github Actions) -> Upload image to harbor -> Change `haenu-cluster` repo's image tag -> ArgoCD Trigger -> Sync k8s cluster