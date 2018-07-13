docker image for QUANTAXIS: https://github.com/QUANTAXIS/QUANTAXIS

## deployment:
```
1. create volume for mongodb
  docker volume create qamg

2. start up compose services
  docker-compose up -d

3. initialization
  docker exec -it CONTAINERNAME base
  mkdir FOLDER
  cd FOLDER
  quantaxis
  save all
```

## stop/remove container:
```
1. docker-compose stop

2. docker-compose rm
```

## update:
```
1. rename the 'image' name for qa service in docker-compose

2. docker-compose up -d
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
