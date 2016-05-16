#!/bin/bash

echo "****************** Running the ansible playbook to install docker"
echo "export ANSIBLE_HOST_KEY_CHECKING=False" >> /root/.bashrc
ansible-playbook /vagrant/bootstrap.yml -i /vagrant/hosts/inventory -vvvv
