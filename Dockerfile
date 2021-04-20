FROM node:14.0.0-alpine as build
#FROM circleci/node:latest as build
LABEL author="Hareesh V"

WORKDIR /app

COPY package*.json /app/

RUN sudo npm install -g npm@latest

RUN sudo npm install

COPY ./ /app/

RUN  npm run build

FROM nginx:stable-alpine

COPY --from=build /app/build /usr/share/nginx/html
COPY --from=build /app/nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
