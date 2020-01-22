# My first docker container 

In this tutorial, we will pull a [asciinema docker image](https://hub.docker.com/r/asciinema/asciinema/), run a container using this image and complete a simple screen recording.

1) create asccinema account

2) open docker teminal

3) pull container
>``docker pull asciinema/asciinema``

4) check image ID
>``docker images``

5) boot into container
>``docker run -ti asciinema/asciinema bash``

6) link docker container to asciinema.org
>``asciinema auth``

Open the following URL in a web browser to link your install ID with your asciinema.org user account:

https://asciinema.org/connect/[your-url]

This will associate all recordings uploaded from this machine (past and future ones) to your account, and allow you to manage them (change title/theme, delete) at asciinema.org.

7) ($) start a screen recording
> ``$ asciinema rec``
> ``$ # Hello Translational Bioinformatics Class!``
> ``$ # exit``

8) End the recording by hitting control-D. Follow directions on screen to get link to video in your asciinema.org account. 
>``ctrl-d``

9) exit container
> ``exit``

10) check container status
>``docker container ls``

11) kill container 
>``docker kill [container ID]``

12) remove container
>``docker rm -f [container ID]``


