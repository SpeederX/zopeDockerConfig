FROM node:14
#FROM node:carbon
RUN npm install -g nodemon
WORKDIR /usr/src/app
COPY package*.json /usr/src/app/
RUN npm install && mv /usr/src/app/node_modules /node_modules
COPY . /usr/src/app
EXPOSE 8080
#CMD [ "nodemon" ]
# Create app directory
# WORKDIR /usr/src/app

# # Install app dependencies
# # A wildcard is used to ensure both package.json AND package-lock.json are copied
# # where available (npm@5+)
# COPY package*.json ./

# RUN npm i --silent
# # If you are building your code for production
# # RUN npm ci --only=production

# # Bundle app source
# COPY ./ ./
# #RUN touch .env && echo "PORT=30485" > .env

# EXPOSE 3000
#CMD [ "npm", "start" ]
