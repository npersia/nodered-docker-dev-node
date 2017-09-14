NODE=soapserver

docker run --rm -itd -p 1880:1880 -p 8888:8888 -v $(pwd)/flows:/data/flows -v $(pwd)/nodes:/nodes --name=dev-nodered npersia/nodered:latest top

docker exec dev-nodered npm link /nodes/$NODE/
docker exec dev-nodered npm link /usr/src/node-red/ node-red-contrib-$NODE

docker exec dev-nodered npm start -- --userDir /data
