FROM node:14.6.0-alpine AS build

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci --silent
COPY . ./
RUN npm run build


FROM nginx:1.18-alpine
ARG PORT=80
COPY --from=build /usr/src/app/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d

EXPOSE $PORT

CMD ["nginx", "-g", "daemon off;"]
