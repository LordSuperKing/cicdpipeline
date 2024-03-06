FROM node:21.6.0 AS build
COPY . .
RUN npm install
RUN npm run build


FROM nginx:1.25.3 AS prod
COPY --from=build /dist /usr/share/nginx/html