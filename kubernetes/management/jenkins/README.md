# Jenkins
Jenkins

## Base Chart
https://github.com/bitnami/charts/tree/main/bitnami/jenkins

## Installation
```bash
helm repo add jenkins https://charts.jenkins.io
helm repo update

helm install jenkins -n jenkins -f values.yaml jenkins/jenkins
```
