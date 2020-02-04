# bioconductor Docker Images (https://www.bioconductor.org/help/docker/)

In this tutorial, we will build a bioconductor images from an [asciinema docker image](https://hub.docker.com/r/asciinema/asciinema/).

1) create asccinema.org 

2) open docker teminal

3) pull container
```
docker pull asciinema/asciinema
```

4) boot into container as bash
```
docker run -it asciinema/asciinema bash

5) update and install r-base
```
> # check if R is installed?
> R
> # we will now install r-base
> apt-get update
> apt-get install r-base -y
> # check to see if R has been installed
> R
> # exit R
> quit()
```

6) install bioconductor
```
> R 
> if (!requireNamespace("BiocManager", quietly = TRUE)) 
> install.packages("BiocManager") 
> BiocManager::install(version = "3.10")

# https://askubuntu.com/questions/218708/installing-latest-version-of-r-base