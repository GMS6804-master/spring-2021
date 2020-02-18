Bioconductor Quiz

In this tutorial, we use a [bioconductor docker images](https://www.bioconductor.org/help/docker/) that includes [asciinema](https://asciinema.org/) functionality to run the [GEM tutorial](https://bioconductor.org/packages/release/bioc/vignettes/GEM/inst/doc/user_guide.html). [GEM](https://bioconductor.org/packages/release/bioc/html/GEM.html) is a bioconductor package: GEM: fast association study for the interplay of Gene, Environment and Methylation.

In the examples below, `$` indicates the command line prompt within the container.

1) create asccinema.org account

2) open docker terminal

3) pull container
```
docker pull dominicklemas/bioconductor-asciinema
```

4) boot into container as bash
```
docker run -it dominicklemas/bioconductor-asciinema bash
```

5) link docker container to asciinema.org
```
$ asciinema auth
```

6) load R 
```
$ R
```

install the bioconductor pacakge [GEM](https://bioconductor.org/packages/release/bioc/html/GEM.html) 
```
$ if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager") 
$ BiocManager::install(version = "3.10")
$ quit()
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