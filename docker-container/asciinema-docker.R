# asciinema Docker Images (https://hub.docker.com/r/asciinema/asciinema/)
# windows

# 1) open docker teminal

# 2) pull container
docker pull asciinema/asciinema

# 3a) boot into container
docker run --rm -ti asciinema/asciinema bash

# From withink container
apt-get update
apt-get install r-base

# boot into R- install bioconductor
## try http:// if https:// URLs are not supported
source("https://bioconductor.org/biocLite.R")
biocLite()
