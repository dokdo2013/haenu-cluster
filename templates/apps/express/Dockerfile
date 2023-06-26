# Install packages and build
FROM node:18-alpine as builder

ENV NODE_ENV build

WORKDIR /app

COPY . /app

RUN yarn install

# Copy build to production image
FROM node:18-alpine

ENV NODE_ENV production

USER node
WORKDIR /app

COPY --from=builder --chown=node:node /app/package*.json ./
COPY --from=builder --chown=node:node /app/yarn.lock ./
COPY --from=builder --chown=node:node /app/node_modules/ ./node_modules/
COPY --from=builder --chown=node:node /app/ ./

# 실행시킬 파일명이 index.js가 아니라면 적절히 변경해주세요
CMD ["node", "index.js"]