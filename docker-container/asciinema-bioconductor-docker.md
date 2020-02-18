Bioconductor Quiz

In this tutorial, we use a [bioconductor docker images](https://www.bioconductor.org/help/docker/) that includes [asciinema](https://asciinema.org/) functionality to run the [GEM tutorial](https://bioconductor.org/packages/release/bioc/vignettes/GEM/inst/doc/user_guide.html). [GEM](https://bioconductor.org/packages/release/bioc/html/GEM.html) is a bioconductor package: GEM: fast association study for the interplay of Gene, Environment and Methylation.

In the examples below, `$` indicates the command line prompt within the container.

## 1) create asccinema.org account

## 2) open docker terminal

## 3) pull container
```
docker pull dominicklemas/bioconductor-asciinema
```

## 4) boot into container as bash
```
docker run -it dominicklemas/bioconductor-asciinema bash
```

## 5) link docker container to asciinema.org
```
$ asciinema auth
```
```
> Open the following URL in a web browser to link your install ID with your asciinema.org user account:
> https://asciinema.org/connect/[your-url]
> This will associate all recordings uploaded from this machine (past and future ones) to your account, 
> and allow you to manage them (change title/theme, delete) at asciinema.org.
```

## 6) start a screen recording. include your name/date/tutorial information 
```
$ asciinema rec
$ # Name: 
$ # Date: 
$ # bioconductor:: GEM tutorial
```

## 7) load R & install the bioconductor pacakge [GEM](https://bioconductor.org/packages/release/bioc/html/GEM.html) 
```
$ R
$ if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
$ BiocManager::install("GEM")
```

## 8) Load GEM package
```
require(GEM)
```

## 9) Description of input data (format of files explained in tutorial)
```
DATADIR = system.file('extdata',package='GEM')
dir(path = DATADIR)
```

## 10) Work flow and result demonstration
```
$ env_file_name = paste(DATADIR, "env.txt", sep = .Platform$file.sep)
$ covariate_file_name = paste(DATADIR, "cov.txt", sep = .Platform$file.sep)
$ methylation_file_name = paste(DATADIR, "methylation.txt", sep = .Platform$file.sep)
$ Emodel_pv = 1
$ Emodel_result_file_name = "Result_Emodel.txt"
$ Emodel_qqplot_file_name = "QQplot_Emodel.jpg"
$ GEM_Emodel(env_file_name, covariate_file_name, methylation_file_name, Emodel_pv, Emodel_result_file_name, Emodel_qqplot_file_name, savePlot=FALSE)
```
## 11) check the files in your working directory
```
$ list.files()
```
should look like this:
```
 [1] "bin"               "boot"              "dev"
 [4] "etc"               "home"              "lib"
 [7] "lib64"             "media"             "mnt"
[10] "opt"               "proc"              "Result_Emodel.txt"
[13] "root"              "Rplots.pdf"        "run"
[16] "sbin"              "srv"               "sys"
[19] "tmp"               "usr"               "var"
```




## X) Exit container
```
