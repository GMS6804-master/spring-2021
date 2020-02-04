# My first docker container 

In this tutorial, we will pull a [asciinema docker image](https://hub.docker.com/r/asciinema/asciinema/), 
run a container using this image, complete a simple screen recording, and upload to asciinema.org.

1) create asccinema.org 

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
6) start a screen recording 
```
> asciinema rec
> # Hello translational bioinformatics!
> # date: 2/4/2020
> # Name: 
> [ctrl-q or ctrl-d to stop recording, you should see the following below]
```
```
asciinema: recording finished
asciinema: press <enter> to upload to asciinema.org, <ctrl-c> to save lo

View the recording at:

    https://asciinema.org/a/fgLTo86h1UjXMFBfpRUWre8kZ

This installation of asciinema recorder hasn't been linked to any asciin
account. All unclaimed recordings (from unknown installations like this
are automatically archived 7 days after upload.

If you want to preserve all recordings made on this machine, connect thi
installation with asciinema.org account by opening the following link:

    https://asciinema.org/connect/f3c2fb70-2055-4838-b8ab-b7ee568d39d9
```
7) Exit docker container
> exit
```


