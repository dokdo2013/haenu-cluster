## argocd-ingress
argocd 서버를 도메인으로 접속하기 위해 이용
- 접속 도메인 : argo.haenu.xyz
- SSL 적용여부 : Y (let's encrypt)
- Cloudflare : DNS Only

## grafana-ingress
grafana를 도메인으로 접속하기 위해 이용
- 접속 도메인 : grafana.haenu.xyz
- SSL 적용여부 : Y (let's encrypt)
- Cloudflare : DNS Only

## cluster issuer
Lets' Encrypt 인증서 발급을 위한 Issuer
