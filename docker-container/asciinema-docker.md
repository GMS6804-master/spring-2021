# Modify a docker image and push to Dockerhub() 

In this tutorial, we will modify an [asciinema docker image](https://hub.docker.com/r/asciinema/asciinema/) by installing r-base. 
We will then save our modified container and push our changes to dockerhub(). 

1) create asccinema.org and dockerhub.com account

2) open docker teminal

3) pull container
```
docker pull asciinema/asciinema
```

4) boot into container as bash
```
docker run -it asciinema/asciinema bash
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
> # check if R is installed?
> R
> # we will now install r-base
> apt-get update
> apt-get install r-base -y
> # check to see if R has been installed
> R
> # exit R
> quit()
> # stop recording
> exit
> # exit docker container
> [ctrl-q, key stroke]
```

7) check container ID. save the modified container (i.e. r-base install)
```
docker ps
docker commit [containerID] asciinema:r-base
```

8) login to dockerhub
>``docker login``
>``login: [YOUR DOCKERHUB ID]``
>``pwd: [YOUR PASSWORD]``

9) tag container
>``docker tag 7591124dd90b dominicklemas/r-base:asciinema``
>``docker push dominicklemas/r-base``
