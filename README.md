docker image for QUANTAXIS: https://github.com/QUANTAXIS/QUANTAXIS

## deployment:
```
1. create volume for mongodb
  docker volume create qamg

2. start up compose services
  docker-compose up -d
```

## stop/remove container:
```
1. docker-compose stop

2. docker-compose rm
```

## update:
```
opt1. docker-compose rm && docker-compose up -d

opt2.
1. docker exec -it CONTAINERNAME bash
2. run git pull in the /QUANTAXIS folder
```

## database backup:
```
1. docker-compose stop

2.
docker run  --rm -v qamg:/data/db \
-v $(pwd):/backup alpine \
tar zcvf /backup/dbbackup.tar /data/db
```

## database restore:
```
1. docker-compose stop

2.
docker run  --rm -v qamg:/data/db \
-v $(pwd):/backup alpine \
sh -c "cd /data/db \
&& rm -rf diagnostic.data \
&& rm -rf journal \
&& rm -rf configdb \
&& cd / \
&& tar xvf /backup/dbbackup.tar"
```
