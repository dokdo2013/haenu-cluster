# php 7.4와 apache가 포함된 이미지를 기반으로 합니다.
# https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-apache.html
FROM webdevops/php-apache:7.4-alpine

# 필요한 환경 변수를 설정합니다.
ENV WEB_DOCUMENT_ROOT=/app
ENV WEB_DOCUMENT_INDEX=index.php

# 앱의 소스 코드를 이미지에 복사합니다.
COPY ./ /app

# apache를 실행합니다.
CMD ["supervisord"]
