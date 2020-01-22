# Modify a docker image and push to Dockerhub() 

In this tutorial, we will modify an [asciinema docker image](https://hub.docker.com/r/asciinema/asciinema/) by installing r-base. 
We will then save our modified container and push our changes to dockerhub(). 

1) create asccinema.org account

2) open docker teminal

3) pull container
```
docker pull asciinema/asciinema
```

4) boot into container as bash
```
docker run -ti asciinema/asciinema bash
```

5) link docker container to asciinema.org
```
> asciinema auth
```
```
> Open the following URL in a web browser to link your install ID with your asciinema.org user account:
> https://asciinema.org/connect/[your-url]
> This will associate all recordings uploaded from this machine (past and future ones) to your account, 
> and allow you to manage them (change title/theme, delete) at asciinema.org.
```
6) start a screen recording & modify the container
```
> asciinema rec
> apt-get update
> apt-get install r-base
```

7) check image ID. save the new container
```
docker images
docker commit [containerID] asciinema:r-base
```

8) login to dockerhub
>``docker login``
>``login: [YOUR DOCKERHUB ID]``
>``pwd: [YOUR PASSWORD]``

9) tag container
>``docker tag 7591124dd90b dominicklemas/r-base:asciinema``
>``docker push dominicklemas/r-base``
