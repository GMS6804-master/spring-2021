Bioconductor Quiz

In this tutorial, we use a [bioconductor docker images](https://www.bioconductor.org/help/docker/) that includes [asciinema](https://asciinema.org/) functionality to run the [GEM tutorial](https://bioconductor.org/packages/release/bioc/vignettes/GEM/inst/doc/user_guide.html).

1) create asccinema.org account

2) open docker terminal

3) pull container
```
docker pull dominicklemas/bioconductor-asciinema
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