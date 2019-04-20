# Hello, World! Java Webapp

This project illustrates the use of the Jib Gradle plugin to create distroless Java docker images.

## Building Docker images

Execute this command from the project root
`./gradlew jibDockerBuild`

This command leverages Docker daemon to build the image and pushes the image to local Docker repository

You can execute the image by using `docker run hello_world_webapp`
