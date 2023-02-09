FROM node:lts-alpine3.16 AS build

WORKDIR /app

RUN apt-get install git && \
	git clone https://github.com/Pablichu/my_first_svelte-static-web.git && \
    mv my_first_svelte-static-web/* . && \
    rmdir my_first_svelte-static-web

RUN npm install && \
    npm run build

FROM alpine:3.15.6
COPY --from=build /app/public /var/www/html