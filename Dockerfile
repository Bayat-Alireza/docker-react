FROM node:alpine as builder

WORKDIR /app

COPY package.json .

RUN yarn

COPY . .


RUN yarn build
# each FROM terminates before each successive block
FROM nginx
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html