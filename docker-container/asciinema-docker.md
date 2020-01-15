# asciinema Docker Images (https://hub.docker.com/r/asciinema/asciinema/)
# directions on saving container as image (https://www.techrepublic.com/article/how-to-commit-changes-to-a-docker-image/)
# directiopns on pusing image to docker hub ( ) 
# windows

# 1) open docker teminal

# 2) pull container
docker pull asciinema/asciinema

# 3a) boot into container
docker run -ti asciinema/asciinema bash

# From withink container
apt-get update
apt-get install r-base

# save container
docker commit [containerID] asciinema:r-base

# get ready to commit for dockerhub
docker login
login:
pwd:

# Then tag container
docker tag 7591124dd90b dominicklemas/r-base:asciinema
docker push dominicklemas/r-base
