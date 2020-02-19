export IMG_NAME=nfs-server
export TAG=latest
export REPO=garybowers

make build
make tag
make push
