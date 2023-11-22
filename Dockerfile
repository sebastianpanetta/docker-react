# Phase 1

FROM node:16-alpine as buildPhase
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Phase 2

FROM nginx
COPY --from=buildPhase /app/build /usr/share/nginx/html

# nginx image starts nginx web server automatically

