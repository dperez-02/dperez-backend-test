FROM node:18 AS build

WORKDIR /usr/app

COPY . .

RUN npm install
RUN npm test
RUN npm run build

FROM node:18-alpine AS production

WORKDIR /usr/app

COPY --from=build /usr/app/dist ./dist
COPY --from=build /usr/app/package*.json .

RUN npm install --production

EXPOSE 4000
CMD [ "node", "dist/main.js"]