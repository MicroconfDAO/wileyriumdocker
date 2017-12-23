FROM ethereum/client-go
FROM node:boron

# Create app directory
WORKDIR /wileyriyumdocker

COPY . .
RUN npm install
RUN pwd
RUN ls -la

