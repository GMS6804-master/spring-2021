# My first docker container 

In this tutorial, we will pull a [asciinema docker image](https://hub.docker.com/r/asciinema/asciinema/), run a container using this image and complete a simple screen recording.
1) open docker teminal

2) pull container
>``docker pull asciinema/asciinema``

3) check image ID
>``docker images``

4) boot into container
>``docker run -ti asciinema/asciinema bash``

5) ($) start a screen recording
> $ asciinema rec


6) type something. If you want to end recording, hit control-D. Follow directions on screen to get link to share video. 
> $ # Hello World!

7) exit container
>exit

8) check container status
>docker container ls

9) kill container 
>docker kill [container ID]

10) remove container
>docker rm -f [container ID]


