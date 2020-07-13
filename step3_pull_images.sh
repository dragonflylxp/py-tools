#!/bin/bash


echo '>>>[PULL IMAGES]docker pull nginx'
docker pull nginx 

echo '>>>[PULL IMAGES]docker pull mysql'
docker pull mariadb 

echo '>>>[PULL IMAGES]docker pull php'
docker pull php:7.1-fpm
