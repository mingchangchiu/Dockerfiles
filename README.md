# Dockerfiles
Dockerfile for TensorFlow, Data Science, Machine Learning purpose, etc. Originally maintained by Craig Citro
#### Install Docker
#### Build image from STDIN: 
docker build -t tensorflow:0.1 - < Dockerfile
#### Mount local directory and set up TensorBoard port: 
docker run -it -p 0.0.0.0:6006:6006 -p 8888:8888  -v PATH_OF_YOURS:/notebooks tensorflow:0.1 /bin/sh
