# Hello, World from Python

## Building the image

Run `docker build -t <tag_name> .`

e.g. `docker build -t hello .`

## Running the container

Since we have built the docker image locally, it's available with the docker daemon. So, we can simply run it as:
`docker run hello`

## Publishing the image to Docker hub

We need to first retag it in the format below, where the username is your Docker username
`docker tag hello <username>/hello`

We can then push it to Docker hub by using `docker push`
`docker push <username>/hello`


Once published, you can run it as below:
`docker run <username>/hello`

If you want to wait indefinitely, you can use `docker run <username>/hello hello2.py`. This command takes an hour to run.
