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

## Demonstrate how one can use docker as a development environment where say, someone needs go, they can install go, commit the image and share it like we do in Git

## The architecture: Daemon and client

## Networking:
 * You can create a virtual(overlay) network for the containers to communicate between themselves, however the Kubernetes approach is better

## Design considerations:
 * Using environment variables vs configuration files

## Various docker commands:
 * docker run
 * docker exec
 * docker ps
 * docker image
 * docker container
 
