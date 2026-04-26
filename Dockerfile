# TODO Phase 5: audit and harden this image for production

FROM node:22-slim

WORKDIR /app

COPY package*.json ./

RUN npm install

# copy the rest of the code

COPY . .

EXPOSE 3001

CMD ["npm", "run", "start:dev"]