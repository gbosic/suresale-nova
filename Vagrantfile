Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.66.55"

  config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.provision :shell, :path => "./vagrant/setup/enablerepo.sh"
  config.vm.provision :shell, :path => "./vagrant/setup/apache.sh"
  config.vm.provision :shell, :path => "./vagrant/setup/postgresql.sh"
  config.vm.provision :shell, :path => "./vagrant/setup/redis.sh"
  config.vm.provision :shell, :path => "./vagrant/setup/php.sh"
  config.vm.provision :shell, :path => "./vagrant/setup/nodejs.sh", privileged: false

  config.vm.synced_folder ".", "/var/www/html/",
  mount_options: ["dmode=777","fmode=666"]


end
