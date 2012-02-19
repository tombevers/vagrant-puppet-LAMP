Vagrant::Config.run do |config|
  config.vm.box = "lucid64"

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port 80, 7654
  config.vm.forward_port 3306, 3306

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "base.pp"
    puppet.module_path = "modules"
    #puppet.options = "--verbose --debug"
    puppet.options = "--verbose"
  end
end
