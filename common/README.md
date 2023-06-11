# common

## argocd-ingress
argocd 서버를 도메인으로 접속하기 위해 이용
- 접속 도메인 : argo.haenu.xyz
- SSL 적용여부 : Y (let's encrypt)
- Cloudflare : Proxied (SSL Strict)

## grafana-ingress
grafana를 도메인으로 접속하기 위해 이용
- 접속 도메인 : grafana.haenu.xyz
- SSL 적용여부 : Y (let's encrypt)
- Cloudflare : Proxied (SSL Strict)

## gitea-ingress
gitea를 도메인으로 접속하기 위해 이용
- 접속 도메인 : git.haenu.xyz
- SSL 적용여부 : Y (let's encrypt)
- Cloudflare : Proxied (SSL Strict)
- 기타 정보
  - Nginx Ingress Controller POST Size : 1024m

## kuma-ingress
uptime kuma를 도메인으로 접속하기 위해 이용
- 접속 도메인 : kuma.haenu.xyz
- SSL 적용여부 : N
- Cloudflare : Proxied (SSL Flexible)

## cluster issuer
Lets' Encrypt 인증서 발급을 위한 Issuer

## External DNS
- Cloudflare DNS에 레코드를 등록/수정하기 위해 External DNS 이용
- Cloudflare API Token, API Key 등은 Secret으로 관리

## Namespaces
공통 Namespace yaml
- haenu : 공통
- leaven : 레븐 관련
- api : API 모음

**주의사항 : 네임스페이스 추가시 네임스페이스별 dockerhub-secret을 수동으로 설정해줘야 합니다**
