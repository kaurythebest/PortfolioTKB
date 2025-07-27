# Étape 1 – Build du projet Vite
FROM node:20-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Étape 2 – Serveur Apache
FROM httpd:alpine
COPY --from=builder /app/dist /usr/local/apache2/htdocs/
