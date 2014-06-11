# -*- mode: ruby -*-
# vi: set ft=ruby :

# Location of websites
CONFIG_WEBROOT = "/Users/robin/Sites/vhosts"

# Set custom IP
CONFIG_IP = "192.168.226.2"

CONFIG_MEMORY = "512"
CONFIG_NAME   = "lamp-vagrant"


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos-65-i386-virtualbox-puppet"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-i386-virtualbox-puppet.box"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.network "private_network", ip: CONFIG_IP

  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |v|
    v.gui             = false
    v.cpus            = 1
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", CONFIG_MEMORY]
    v.customize ["modifyvm", :id, "--name", CONFIG_NAME]
  end

  config.vm.synced_folder CONFIG_WEBROOT, "/var/www/vhosts", id: "vagrant-root"

  config.vm.provision :shell do |shell|
    shell.inline = "(puppet module list | grep nginx) || puppet module install jfryman-nginx"
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path    = "puppet/manifests"
    puppet.manifest_file     = "site.pp"
    puppet.module_path       = "puppet/modules"
    puppet.hiera_config_path = "puppet/hiera.yaml"
  end
end
