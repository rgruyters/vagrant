# -*- mode: ruby -*-
# vi: set ft=ruby :

# Location of websites
CONFIG_WEBROOT = "/Users/robin/Sites/vhosts"

# Set custom IP
# CONFIG_IP = "192.168.226.2"

CONFIG_MEMORY = "512"


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos-65-x86_64"
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  config.vm.network "forwarded_port", guest: 80, host: 8080

#  config.vm.network "private_network", ip: CONFIG_IP

  config.ssh.forward_agent = true

  config.vm.provider "vmware_fusion" do |v|
    v.gui             = false
    v.vmx['memsize']  = CONFIG_MEMORY
    v.vmx['numvcpus'] = 1
  end

  config.vm.synced_folder CONFIG_WEBROOT, "/var/www/vhosts", id: "vagrant-root"

  # Bring VM up to date
  # config.vm.provision :shell, :inline => "sudo yum -y update"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path    = "puppet/manifests"
    puppet.manifest_file     = "site.pp"
    puppet.module_path       = "puppet/modules"
    puppet.hiera_config_path = "puppet/hiera.yaml"
  end
end
