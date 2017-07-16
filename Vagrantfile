# -*- mode: ruby -*-
# vi: set ft=ruby :

Dotenv.load

# change default provider to digital_ocean
ENV['VAGRANT_DEFAULT_PROVIDER'] = "aws"

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider :aws do |provider, override|
    override.vm.hostname          = "vagrant-test"
    override.vm.box_url           = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"
    override.vm.box               = "aws"
    override.ssh.private_key_path = ENV['AWS_SSH_KEY']
    override.ssh.pty              = false

    provider.access_key_id        = ENV['AWS_ACCESS_KEY_ID']
    provider.secret_access_key    = ENV['AWS_SECRET_ACCESS_KEY']
    provider.keypair_name         = ENV['AWS_KEYPAIR_NAME']

    provider.region               = "ap-northeast-1"  # Tokyo
    provider.availability_zone    = "ap-northeast-1c" # Tokyo

    override.ssh.username         = "ubuntu"
    provider.ami                  = "ami-62edf205" # Ubuntu 16.04 LTS - Xenial (HVM)
    # override.ssh.username         = "ec2-user"
    # provider.ami                  = "ami-c9562fc8"    # Tokyo Amazon Linux AMI 2014.03 (64-bit)

    provider.instance_type        = "t2.micro"
    provider.instance_ready_timeout = 120
    provider.terminate_on_shutdown  = false

    provider.security_groups      = [
                                      ENV['AWS_SECURITY_GROUP'], # sg-vagrant
                                    ]

    provider.tags                 = {
                                      "Name"        => "vagrant-test",
                                      "Description" => "Boot from vagrant-aws",
                                    }

    provider.block_device_mapping = [{
                                      "DeviceName"              => "/dev/sda1",
                                      "VirtualName"             => "VagrantDisk",
                                      "Ebs.VolumeSize"          => "8",
                                      "Ebs.DeleteOnTermination" => true,
                                      "Ebs.VolumeType"          => "standard",
                                     #"Ebs.VolumeType"          => "io1", # only if you choose PIOPS
                                     #"Ebs.Iops"                => 1000,  # only if you choose io1
                                    }]

    # enable these properties only if you plan not to use Default VPC
    #provider.subnet_id            = ENV['AWS_SUBNET_ID']
    #provider.private_ip_address   = "172.31.16.10"
    #provider.elastic_ip           = true

    # enable sudo without tty
    # NOTE: setting [ ssh.pty = true ] causes file provisioner fail
    provider.user_data = <<-USER_DATA
#!/bin/sh
echo "Defaults    !requiretty" > /etc/sudoers.d/vagrant-init
chmod 440 /etc/sudoers.d/vagrant-init
    USER_DATA

    # disable synced_folder:
    override.vm.synced_folder "./", "/vagrant", disabled: true

    # install some base packages
    config.vm.provision :shell, path: "bootstrap.sh"
  end

end