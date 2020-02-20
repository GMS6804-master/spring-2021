# Bioconductor Quiz

In this tutorial, we use a [bioconductor docker images](https://www.bioconductor.org/help/docker/) that includes [asciinema](https://asciinema.org/) functionality to run the [GEM tutorial](https://bioconductor.org/packages/release/bioc/vignettes/GEM/inst/doc/user_guide.html). [GEM](https://bioconductor.org/packages/release/bioc/html/GEM.html) is a bioconductor package: GEM: fast association study for the interplay of Gene, Environment and Methylation.

In the examples below, `$` indicates the command line prompt within the container.

## 1) create asccinema.org account

## 2) open docker terminal

## 3) pull container
```
docker pull dominicklemas/bioconductor_asciinema
```

## 4) boot into container as bash
```
docker run -it dominicklemas/bioconductor_asciinema bash
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
### GEM_EModel:
```
$ snp_file_name = paste(DATADIR, "snp.txt", sep = .Platform$file.sep)
$ covariate_file_name = paste(DATADIR, "gxe.txt", sep = .Platform$file.sep)
$ methylation_file_name = paste(DATADIR, "methylation.txt", sep = .Platform$file.sep)
$ GxEmodel_pv = 1
$ GxEmodel_result_file_name = "Result_GxEmodel.txt"
$ GEM_GxEmodel(snp_file_name, covariate_file_name, methylation_file_name, GxEmodel_pv, GxEmodel_result_file_name, topKplot = 1, savePlot=FALSE)
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

## 12) Look at the contents of "Result_Emodel.txt"
```
head(read.table(paste(getwd(), "Result_GxEmodel.txt", sep = .Platform$file.sep), header = TRUE))

```
should look like this:
```
    cpg         beta     stats      pvalue       FDR
1 CpG99  0.002820575  2.779243 0.005891264 0.5891264
2 CpG32  0.003551990  2.008946 0.045691601 0.9345452
3 CpG21  0.001896850  1.886230 0.060502399 0.9345452
4 CpG66  0.001602048  1.866568 0.063212780 0.9345452
5 CpG75 -0.001969172 -1.696740 0.091075634 0.9345452
6 CpG34  0.003809056  1.688606 0.092627076 0.9345452
```

## 13)

## X) Exit container
```
