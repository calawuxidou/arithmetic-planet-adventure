FROM node:20-alpine

RUN apk add --no-cache unzip

WORKDIR /app

COPY arithmetic-planet-source.zip /tmp/arithmetic-planet-source.zip

RUN unzip /tmp/arithmetic-planet-source.zip -d /app \
    && rm /tmp/arithmetic-planet-source.zip \
    && npm ci --omit=dev \
    && npm run build

ENV NODE_ENV=production

EXPOSE 3000

CMD ["npm", "start"]
