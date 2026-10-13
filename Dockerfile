FROM node:lts AS build
WORKDIR /app
COPY package*.json ./
RUN rm -f package-lock.json
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
# Копируем конфиг для порта 7860
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 7860
CMD ["nginx", "-g", "daemon off;"]