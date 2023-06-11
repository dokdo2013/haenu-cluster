# common

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

## kuma-ingress
uptime kuma를 도메인으로 접속하기 위해 이용
- 접속 도메인 : kuma.haenu.xyz
- SSL 적용여부 : N
- Cloudflare : Proxied (SSL 적용)

## cluster issuer
Lets' Encrypt 인증서 발급을 위한 Issuer

## External DNS
- Cloudflare DNS에 레코드를 등록/수정하기 위해 External DNS 이용
- Cloudflare API Token, API Key 등은 Secret으로 관리

## Namespaces
공통 Namespace yaml
- haenu : 공통
- leaven : 레븐 관련