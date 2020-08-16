# This Tutorial Builds the Bioconductor_docker image with Asciinema functionality

In this tutorial, we build a [bioconductor docker images](https://hub.docker.com/r/bioconductor/bioconductor_docker) that includes [asciinema](https://asciinema.org/) functionality.

## 1) Create [asciinema.org](https://asciinema.org/) account

## 2) Create [Docker](https://www.docker.com/) account and download docker

## 3) Modify asciinema Docker 
1. Fork [asciinema github repository](https://github.com/asciinema/asciinema) to your own github account
2. Clone the forked repository
```
git clone https://github.com/$your_account/asciinema.git
```
3. Go to the cloned folder
```
cd asciinema
```
4. Append the following lines to the end of the `Dockerfile` to install R-3.6 to the docker (reference: https://linuxize.com/post/how-to-install-r-on-ubuntu-18-04/; https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata-when-installing-certbot-in-a-docker-contai)
```
# Install R-3.6

## The following two lines are used to avoid user interaction when installing (i.e., the system will ask your current location during the installation, without avoiding this, the docker build will stuck)
ENV TZ=US
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

## The following lines are used to install the R-3.6
RUN apt update
RUN apt install -y apt-transport-https software-properties-common
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
RUN apt update
RUN apt install -y r-base
```
5. Create `install.R` including the bioconductor installation code:
```
echo "install.packages(\"BiocManager\")" > install.R
```
6. Add the following lines to Dockerfile to install bioconductor
```
# Install bioconductor

ADD install.R /root
RUN R -f install.R
```

## 4) Build Docker
```
docker build -t dominicklemas/bioconductor_asciinema:02_2020 .
```

## 6) Commit, tag and save to Dockerhub
```
docker container ls
docker commit [CONTAINER ID] dominicklemas/bioconductor_asciinema
docker tag [IMAGE ID] dominicklemas/bioconductor_asciinema:02_2020
docker login
docker push dominicklemas/bioconductor_asciinema:02_2020
```

# Some notes

- Modifying [r-base Dockerfile](https://github.com/rocker-org/rocker/blob/df56b98e4a2a4611fa9aacae99c4a304531c2640/r-base/Dockerfile) or [bioconductor Dockerfile](https://hub.docker.com/r/bioconductor/bioconductor_docker/dockerfile) by adding asciinema installation command lines does not work, the asciinema upload function will be disabled if doing so. The difference of the operating system among the three Dockers might be one of the reasons: https://github.com/asciinema/asciinema/issues/353
- The [asciinema Docker](https://hub.docker.com/r/asciinema/asciinema/) which has already been built by them is not consistent with the Dockerfile on [their github](https://github.com/asciinema/asciinema), the operating systems are different and the former one does not allow your to install the latest R.