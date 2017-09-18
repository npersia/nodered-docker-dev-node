docker run --rm -it -p 1880:1880 -p 8888:8888 -v $(pwd)/flows:/data/flows -v $(pwd)/nodes:/nodes --name=dev-nodered npersia/nodered:latest
