# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.box = "centos-6.4"
  config.vm.hostname = "oracle11g"

  # Forward Oracle port
  # Oracle
  config.vm.network :forwarded_port, guest: 1521, host: 1521
  config.vm.synced_folder "/Users/tanglq/Downloads", "/vagrant/downloads", {:mount_options => ['dmode=755','fmode=755']}

  # Provider-specific configuration so you can fine-tune various backing
  # providers for Vagrant. These expose provider-specific options.
  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM
    vb.customize ["modifyvm", :id,
                  "--name", "oracle11g",
                  # Oracle claims to need 512MB of memory available minimum
                  "--memory", "2048",
                  # Enable DNS behind NAT
                  "--natdnshostresolver1", "on"]
  end

end
