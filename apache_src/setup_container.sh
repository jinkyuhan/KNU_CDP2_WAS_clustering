#!/bin/sh
cd "$(dirname "$0")"

printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#' # Print a line
echo "Docker setup with Dockerfile\n"

# if there exists a previous container, stop and remove it first.
read -p "Is there an existing container? [y/n] > "
if [ "${REPLY}" == "y" -o "${REPLY}" == "Y" ]
then
    read -p "Input the container's name > " prevcntname

    echo "\ndocker stop ${prevcntname}"
    docker stop "${prevcntname}"

    echo "\ndocker rm ${prevcntname}"
    docker rm "${prevcntname}"
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#' # Print a line
fi

# # if there exists a previous image, remove it first.
# read -p "Is there an existing image? [y/n] > "
# if [ "${REPLY}" == "y" -o "${REPLY}" == "Y" ]
# then
#     read -p "Input the image's name > " previmgname

#     echo "\ndocker rmi ${previmgname}"
#     docker rmi "${previmgname}"
#     printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#' # Print a line
# fi

# start setup
read -p "Input new image name > " imgname 
docker build -t ${imgname} .
if [ $? -ne 0 ]
then
    echo "Failed!"
    exit 1
else
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#' # Print a line
fi

read -p "Input new container name > " cntname
read -p "Input client-side port number > " pnum
docker run -dit --name ${cntname} -p ${pnum}:80 ${imgname}
if [ $? -ne 0 ]
then
    echo "Failed!"
    exit 1
else
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#' # Print a line
fi


docker exec -it ${cntname} /bin/bash
if [ $? -ne 0 ]
then
    echo "Failed!"
    exit 1
else
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#' # Print a line
fi
