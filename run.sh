NODE=lower-case

docker run --rm -itd --net=host -v $(pwd)/flows:/data/flows -v $(pwd)/nodes:/nodes --name=dev-nodered npersia/nodered:latest top

docker exec dev-nodered npm link /nodes/$NODE/
docker exec dev-nodered npm link /usr/src/node-red/ node-red-contrib-$NODE

docker exec dev-nodered npm start -- --userDir /data
