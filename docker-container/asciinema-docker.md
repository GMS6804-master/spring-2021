# Modify a docker image and push to Dockerhub() 

In this tutorial, we will modify an [asciinema docker image](https://hub.docker.com/r/asciinema/asciinema/) by installing r-base. We will then save our modified container and push our changes to dockerhub(). 

1) open docker teminal

2) pull container

>``docker pull asciinema/asciinema``

3) check containerID

>``docker ps``

4) boot into container
>``docker run -ti asciinema/asciinema bash``

5) modify the container
>``$apt-get update``
>``$apt-get install r-base``

6) save the new container
>``docker commit [containerID] asciinema:r-base``

7) login to dockerhub
>``docker login``
>``login: [YOUR DOCKERHUB ID]``
>``pwd: [YOUR PASSWORD]``

8) tag container
>``docker tag 7591124dd90b dominicklemas/r-base:asciinema``
>``docker push dominicklemas/r-base``
