# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "CentOS7"
  config.vm.box_url = "https://f0fff3908f081cb6461b407be80daf97f07ac418.googledrive.com/host/0BwtuV7VyVTSkUG1PM3pCeDJ4dVE/centos7.box"

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http = "http://proxy.mycompany.co.jp:8080/"
    config.proxy.https = "http://proxy.mycompany.co.jp:8080/"
    config.proxy.no_proxy = "localhost,127.0.0.1"
  end

  config.vm.define "opendj" do |opendj|
    opendj.vm.hostname = "opendi"
    opendj.vm.network "private_network", ip: "192.168.55.10", virtualbox__intnet: "intnet"
    opendj.vm.provision :shell, path: "script/opendj_provision.sh"
    #opendj.vm.network "forwarded_port", guest: 1389, host: 1389
  end

  config.vm.define "openidm" do |openidm|
    openidm.vm.hostname = "openidm"
    openidm.vm.network "private_network", ip: "192.168.55.11",virtualbox__intnet: "intnet" 
    openidm.vm.provision :shell, path: "script/openidm_provision.sh"
    openidm.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
    #openidm.vm.network "forwarded_port", guest: 8080, host: 8080
  end
end
