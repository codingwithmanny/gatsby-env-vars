# BUILD PROCESS
FROM node:12.18.4-alpine as build-stage

RUN apk update; \
    apk add libpng-dev; \
    apk add autoconf; \
    apk add automake; \
    apk add make; \
    apk add g++; \
    apk add libtool; \
    apk add nasm;

WORKDIR /usr/src/app

COPY package.json yarn.lock /usr/src/app/

RUN yarn install --non-interactive --frozen-lockfile

COPY . ./

RUN yarn run build --verbose

# BUILT APP
FROM nginx:1.15.4-alpine

WORKDIR /usr/share/nginx/html

COPY --from=build-stage /usr/src/app/public /usr/share/nginx/html

COPY $PWD/docker/entrypoint.sh /usr/local/bin

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/bin/sh", "/usr/local/bin/entrypoint.sh"]

EXPOSE 80

CMD ["/bin/sh", "-c", "exec nginx -g 'daemon off;';"]

