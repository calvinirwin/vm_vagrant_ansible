# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048

    # Clone all VMs to save space and time
    v.linked_clone = true

    # Speeds up downloads on vm
    v.customize ["modifyvm", :id, "--nictype1", "virtio"]
  end

  # Sync the current folder with each VM for running ansible
  # This may just need to be synced with the master in the future, or not at all if we have a dedicated ansible runner.
  # Mount as read only for the owner of the file.
  config.vm.synced_folder ".", "/vagrant"

  # Add a synced folder for our vader source so we can get access to it through docker volume mounting.
  # fmode=544 will mount the folder in read only mode so the VM's will not be able to write to the vader-src directory.
  # the owner (root) will have read-only and execute privileges
  # -- config.vm.synced_folder "#{ENV['VADER_DIR']}", "/vader-src", mount_options: ["fmode=544"]

  # Bootstrap each VM
  # -- config.vm.provision :shell, path: "bootstrap.sh"

  # Infrastructure setup
  config.vm.define "dev-machine" do |node|
    node.vm.provider "virtualbox" do |v|
      v.name = "dev-machine"
    end
    node.vm.hostname = "dev-machine"
    node.vm.provision :shell, path: "bootstrap_ansible.sh"
    node.vm.network "private_network", ip: "192.168.99.99"
    # node.vm.provision :shell, path: "bootstrap_machine.sh"
    # node.vm.provision :shell, path: "bootstrap_vagrant.sh"
    # node.vm.network "forwarded_port", guest: 85, host: 85, protocol: "udp" # DNS
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "bootstrap.yml"  
  end
  
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
