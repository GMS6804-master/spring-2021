# Modify a docker image and push to Dockerhub() 

In this tutorial, we will modify an [asciinema docker image](https://hub.docker.com/r/asciinema/asciinema/) by installing r-base. We will then save our modified container and push our changes to dockerhub(). 

1) open docker teminal

2) pull container
>``docker pull asciinema/asciinema``

3) check containerID
>``docker images``

4) boot into container
>``docker run -ti asciinema/asciinema bash``

5) ($) start a screen recording
 $ asciinema rec

asciinema: recording asciicast to /tmp/tmpjzofrzcl-ascii.cast
asciinema: press <ctrl-d> or type "exit" when you're done

# type something

# if you want to end recording, hit control-D. Follow directions to get link to share video. 

6) exit container
exit

7) check container status
docker container ls

8) kill container 
docker kill [container ID]

9) remove container
docker rm -f [container ID]


