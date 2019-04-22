# Docker demonstration

## Run a go image and use it to demonstrate the benefits of containerization
`docker run go:latest`

Benefits of containerization:
 * You are creating a sandboxed environment which means that it cannot affect other things outside of the sandbox
 * You package the dependencies along with the executable. This means it can run anywhere.

* Demonstrate different ways of creating Docker images
  * Using `docker commit`
  * Using a Dockerfile

## Benefits of layering

## The architecture: Daemon and client

## Design considerations:
 * Using environment variables vs configuration files
