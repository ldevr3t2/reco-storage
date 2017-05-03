#!/bin/bash

eval $(docker-machine env manager)
docker stack rm finalT3
docker volumes purge


eval $(docker-machine env worker1)
docker volumes purge


eval $(docker-machine env worker2)
docker volumes purge


eval $(docker-machine env worker3)
docker volumes purge


eval $(docker-machine env manager)
docker stack deploy -c docker-swarm-large.yml finalT3 && \
    docker run --rm --network=mainnet reco-storage-setup ./setup-storage_1.sh && \
    docker run --rm --network=mainnet -it reco-storage-setup
