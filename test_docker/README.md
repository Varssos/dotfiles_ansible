# How to test in docker images

Run ansible script on ubuntu dockers
```
cd test_docker
# Ubuntu latest LTS
./run.sh
# On many ubuntu latest versions
./run.sh all
```

## How to kill all ubuntu dockers
docker ps --filter "name=^ubuntu" -q | xargs -r docker kill

