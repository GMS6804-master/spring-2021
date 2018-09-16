# bioconductor Docker Images (https://hub.docker.com/r/bioconductor/release_metabolomics2/)
# windows

# 1) open docker teminal

# 2) bioconductor/release_metabolomics2
docker pull bioconductor/release_metabolomics2

# 3a) boot into container
docker run -ti bioconductor/release_metabolomics2

# 3b) boot into container with share folder that contains data
docker run -ti -v /c/Users/djlemas/Documents/MyMetabolomics:/data --rm bioconductor/devel_core2 R

# 4) from within R, change directories to sharedrive
setwd('/data')

# NOTES

# install asciinema
1) install curl
apt-get update
sudo apt install curl
git clone https://github.com/Linuxbrew/brew.git ~/.linuxbrew
PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$(brew --prefix)/share/man:$MANPATH"
export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"

https://github.com/asciinema/asciinema/issues/202
