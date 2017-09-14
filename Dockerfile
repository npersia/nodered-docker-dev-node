FROM node:6

# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red

# User data directory, contains flows, config and nodes.
RUN mkdir /data
RUN mkdir /data/flows
WORKDIR /usr/src/node-red


# package.json contains Node-RED NPM module and node dependencies
COPY package.json /usr/src/node-red/
RUN npm install

COPY settings.js /data/


# Environment variable holding file path for flows configuration
#ENV FLOWS=flows.json
#npm start -- --userDir /data
CMD ["npm", "start", "--", "--userDir", "/data"]
