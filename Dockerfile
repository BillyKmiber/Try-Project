FROM node:18 AS build

WORKDIR /app

COPY package.json  ./

RUN npm install --only=production

COPY . .

# ---- Production Stage ----
FROM node:18-slim AS production

WORKDIR /app

COPY --from=build /app /app

EXPOSE 3000

CMD ["npm", "start"]
~
