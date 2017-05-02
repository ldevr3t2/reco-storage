#!/bin/bash

eval $(docker-machine env manager)

docker node update \
    --label-add [config=false,shard0=false,shard1=false,shard2=false,replicanum=-1] \
    manager

docker node update \
    --label-add [config=true,shard0=true,shard1=true,shard2=true,replicanum=0] \
    worker1

docker node update \
    --label-add [config=true,shard0=true,shard1=true,shard2=true,replicanum=1] \
    worker2

docker node update \
    --label-add [config=true,shard0=true,shard1=true,shard2=true,replicanum=2] \
    worker3

./build-images.sh


eval $(docker-machine env worker1)
./build-images.sh

eval $(docker-machine env worker2)
./build-images.sh

eval $(docker-machine env worker3)
./build-images.sh