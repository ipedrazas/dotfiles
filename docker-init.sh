#!/bin/bash


sudo docker run -d -p 9000:9000 -v /var/run/docker.sock:/docker.sock crosbymichael/dockerui -e /docker.sock

sudo docker run -d -p 9200:9200 -p 9300:9300 ipedrazas/elasticsearch

sudo docker run -d -p 6379:6379 -v /data/redis:/data --name redis dockerfile/redis

sudo docker run -d -p 27017:27017 -v /data/mongodb:/data/db  --name mongodb dockerfile/mongodb mongod

sudo docker run -d -p 7474:7474 tpires/neo4j 
