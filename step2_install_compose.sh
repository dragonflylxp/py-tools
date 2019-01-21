#!/bin/bash

echo '>>>[INSTALL PYTHON-PIP]Install python pip'
yum -y install epel-release
yum -y install python-pip
pip install --upgrade pip

echo '>>>[INSTALL COMPOSE]Install docker compose'
pip install docker-compose
