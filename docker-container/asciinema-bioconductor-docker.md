# bioconductor Docker Images (https://www.bioconductor.org/help/docker/)

In this tutorial, we will build a bioconductor images from an [asciinema docker image](https://hub.docker.com/r/asciinema/asciinema/).

1) create asccinema.org 

2) open docker teminal

3) pull container
```
docker pull galaxydream/r-base-asclinema
```

4) boot into container as bash
```
docker run -it galaxydream/r-base-asclinema bash

5) update and install bioconductor
```
> if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager") 
> BiocManager::install(version = "3.10")
> quit()
```

6) Exit container
```
> exit
```
7) Container ID [identify your container id]
```
docker ps -l
```
8) Commit container
docker commit 98ac2ea3c27c dominicklemas/bioconductor-asciinema

9) push to dockerhub
docker login

# https://askubuntu.com/questions/218708/installing-latest-version-of-r-base