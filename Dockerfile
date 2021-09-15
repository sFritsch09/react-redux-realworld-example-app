
# Step 1
FROM node:16-alpine3.14 as build-step

RUN mkdir /app

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build
 
# Stage 2

FROM nginx:1.21.1-alpine

COPY --from=build-step /app/build /usr/share/nginx/html