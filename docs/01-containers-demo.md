# Docker demonstration

## Run a go image and use it to demonstrate the benefits of containerization
`docker run go:latest`

Benefits of containerization:
 * You are creating a sandboxed environment which means that it cannot affect other things outside of the sandbox
 * You package the dependencies along with the executable. This means it can run anywhere.

* Demonstrate different ways of creating Docker images
  * Using `docker commit`
  * Using a Dockerfile
    * Using single FROM command
    * Using multiple FROM commands

## Benefits of layering
 * Docker AUFS file system
 * Copy-on-write

## Difference between containers and images: how containers have a rw layer while image don't have any.

## Demonstrate how one can use docker as a development environment where say, someone needs go, they can install go, commit the image and share it like we do in Git

## The architecture: Daemon and client

## Networking:
 * You can create a virtual(overlay) network for the containers to communicate between themselves, however the Kubernetes approach is better

## Design considerations:
 * Using environment variables vs configuration files
 * Running docker within docker is not a good idea

## Gotcha's
 * The timezone issue where the timezone is baked into the container. Illustrate this by using the centos:7 container. `date +%Z` is the command to print timezone
   To fix this issue, run rm -rf /etc/localtime followed by ln -s /usr/share/zoneinfo/GMT

## Various docker commands:
 * docker login/logout
 * docker run
 * docker exec
 * docker ps
 * docker tag: Explain the difference between the name and tag
 * docker image
 * docker history
 * docker container

## The images for a given name:tag combination can change too. For instance, it can happen that ubuntu:trusty gets replaced with a different image but using the same name:tag combo. This can lead to issues. To prevent that, instead of specifying the name:tag combination, we can also specify the image sha, but then the image must be stored locally. 
