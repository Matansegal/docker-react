# production container
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# each from start new process
# this is the server we gonna run on
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html