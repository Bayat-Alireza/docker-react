FROM node:alpine as builder

WORKDIR /app

COPY package.json .

RUN yarn

COPY . .


RUN yarn build
# each from terminates each successive block
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html