FROM node:14.14.0-alpine as builder

WORKDIR /var/www/html
COPY package.json /var/www/html/
RUN npm install
COPY . /var/www/html/
RUN npm run build


FROM nginx
EXPOSE 3000

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /var/www/html/build  /usr/share/nginx/html