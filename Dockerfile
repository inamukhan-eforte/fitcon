
FROM node:fermium
#  fermium use to install nodejs libraies
# Create app directory
#WORKDIR /usr/src/app
WORKDIR /app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
#COPY package*.json ./
COPY package.json /app
RUN npm install pm2 -g
RUN npm install
# If you are building your code for production
# RUN npm install --only=production
# Bundle app source
#COPY . .
COPY . /app
#EXPOSE 8080
EXPOSE 5000
#CMD [ "npm", "start" ] for client
CMD [ "npm", "run", "start" ] 
#CMD pm2 start ecosystem.config.js --no-daemon

# CMD ["pm2-runtime", "index.js"] for server