#!/bin/bash

project_name=animal_noises

docker build -t ${project_name}_server server 

docker build -t ${project_name}_api animal_api 

docker network create ${project_name}_network

docker run -d \
    -p 5000:5000 \
    --name ${project_name}_server \
    --network ${project_name}_network \
    ${project_name}_server

docker run -d \
    --name ${project_name}_api \
    --network ${project_name}_network \
    ${project_name}_api
