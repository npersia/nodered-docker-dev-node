FROM node:6

# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red

# User data directory, contains flows, config and nodes.
WORKDIR /usr/src/node-red
RUN chmod -R 777 /usr/src/node-red

# package.json contains Node-RED NPM module and node dependencies
COPY package.json /usr/src/node-red/
RUN npm install


RUN mkdir /data
RUN chmod -R 777 /data
RUN mkdir /data/flows
RUN mkdir /nodes




COPY settings.js /data/
COPY flows/ /data/flows/

RUN chmod -R 777 /data/flows


COPY nodes/ /nodes/

RUN chmod -R 777 /nodes

ENV NODE soapserver

RUN chmod -R 777 /nodes/$NODE/

RUN npm link /nodes/$NODE
RUN npm link /usr/src/node-red/ node-red-contrib-$NODE


EXPOSE 1880 8888

# Environment variable holding file path for flows configuration
#ENV FLOWS=flows.json
#npm start -- --userDir /data
CMD ["npm", "start", "--", "--userDir", "/data"]
