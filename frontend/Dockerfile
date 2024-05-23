FROM node:18

WORKDIR /src/frontend

COPY package*.json ./
RUN npm install

COPY . .

CMD ["npm", "run", "dev"]