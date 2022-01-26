FROM dockerhub/library/node:alpine

COPY app /usr/app
WORKDIR /usr/app
RUN npm install
EXPOSE 8080
CMD node sample.js