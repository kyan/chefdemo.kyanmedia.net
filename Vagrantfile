# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.omnibus.chef_version = :latest
  config.vm.box = "precise64"
  config.vm.hostname = "example.com"
  config.vm.network :private_network, ip: "10.10.10.10"
  config.vm.network :forwarded_port, guest: 22, host: 2210
  config.vm.network :forwarded_port, guest: 80, host: 8010

  config.vm.provision :shell, :inline => "ulimit -n 4048"
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = [
      "~/.chef/chef/cookbooks",
      "~/.chef/chef/kyan-cookbooks"
    ]
    chef.roles_path = "~/.chef/chef/roles"
    chef.data_bags_path = "~/.chef/chef/data_bags"
    chef.add_role "chef_demo"
    chef.json = {
      "authorization" => {
        "sudo" => {
          "users" => [ "vagrant" ],
          "passwordless" => true,
        }
      },
      "postgresql" => {
        "password" => {
          "postgres" => "iloverandompasswordsbutthiswilldo"
        }
      }
    }
  end

  config.ssh.forward_agent = true
end
