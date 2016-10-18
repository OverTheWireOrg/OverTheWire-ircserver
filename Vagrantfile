VAGRANTFILE_API_VERSION = "2"

# vagrant box add utopic64 https://cloud-images.ubuntu.com/vagrant/utopic/current/utopic-server-cloudimg-amd64-vagrant-disk1.box

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/wily64"
  #config.vm.box = "ubuntu/vivid64"
  #config.vm.box = "ubuntu/utopic64"
  #config.vm.box = "ubuntu/trusty64"
  #config.vm.hostname = "testirc" # broken on wily...
  config.vm.network "forwarded_port", guest: 6697, host: 6697
  config.vm.provider "virtualbox" do |vb|
     # Don't boot with headless mode
     vb.gui = true
     vb.name = "testirc"
     vb.cpus = 4
     vb.customize ["modifyvm", :id, "--memory", "1524"]
  end

  config.vm.provider :digital_ocean do |provider, override|
     provider.image = "ubuntu-15-10-x64"
  end

  config.vm.provider :aws do |aws, override|
     # aws.ami = "ami-20551f37" # Ubuntu yakkety 16.10 HVM SSD
     aws.instance_type = "t2.medium"
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "ircserver.yaml"
    ansible.extra_vars = {
      ansible_hostname: "roxanne",
      from_vagrant: true,
      runboobiesbot: false,
    }
    #ansible.verbose = "vvvv"
  end
end
