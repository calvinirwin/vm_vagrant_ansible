#!/bin/bash

echo "******************  Installing Ansible..."

sudo apt-get update
sudo apt-get install -y python-pip python-dev
pip install ansible==1.9.6
pip install markupsafe

echo "****************** ...yes I am done"
