#!/bin/bash

echo "****************** Installing virtualbox, vagrant and things that make you go hmmmmm..."
y | sudo apt-get install virtualbox
y | sudo apt-get install vagrant
y | sudo apt-get install virtualbox-dkms
echo "****************** ...action complete"