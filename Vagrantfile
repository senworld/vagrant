$x = 0
Vagrant.configure('2') do |config|
  ('A'..'B').each do |i|
  config.vm.define "Server#{i}" do |machine|
    machine.vm.box = 'generic/debian12'
    #  auto_config: false
    machine.vm.network "forwarded_port", guest: 22, host: (9000+$x)
    $x = $x +1
    machine.vm.network "forwarded_port", guest: 8080, host: (9000+$x)
    $x = $x +1
    machine.vm.network "private_network", ip: "192.168.1.#{5+($x-($x/2))}"
    machine.vm.hostname = "Server#{i}"
    machine.vm.provider "vmware_desktop" do |vb|
      vb.cpus = '2'
      vb.memory = '2048'
      vb.nat_device = "vmnet8"
    end
    machine.vm.provision "shell", inline: <<-SHELL
      sudo dnf upgrade python3 -y
      sudo dnf install python3-pip -y
      sudo dnf install python3-requests -y
      sudo dnf install sshpass -y
      sudo dnf install nc -y
      if [[ $HOSTNAME == "ServerA" ]]; then
        pip3 install ansible
        /usr/local/bin/ansible --version
        sudo mkdir /etc/ansible
        sudo cp /vagrant/ansible.cfg /etc/ansible
      fi
      echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDgTrq/c1l6cicm3q1ja1NpdBbzPkP6QGWBx+06/4XR84HAjJT9JOwaGyae35kikDV2hAT1xJGPHB71wtHE8nyAzedeVocCccE9wLOVTiMPbBwP25bEBq+RybVhs7cu8w6VvL+h7rThaX+n5NrD498Iq2YRf+WX7PJ6YaazANX/roKOB8O0C5DA+HBXtjrA+t7x5bbv/SnvQ/aC2YeX27oeUksxSeJCjYdIUXN6j/o8ftMrEFwura/CHRosJXsScf0RjRSP9xRgK0Zm7y8XlWTGK/RSxSYdhiH9ugYyu7nPPqhYxI1exOdgvF5cdK8Qfgz0d8cDDpxGi0RgQJOTVO4+/jvjdkX2rnloNb7U80Z+ZO73lVewMUUxonRIR3DPpGhUjdq0xyzm1SPTv3gh0y9tNd6JWaEessXZ1ldgmHvMT7GwAwEAUT56yjtOpzi7yNBK5NykjGIXAwVPDGfxmfs51wZ8bxt5pVXRbx+CCXvbWIIUFUpQ88TZ2qaubsK9dbKXPz6DopMwFO+gC6vVJ3CzvFXwyR/hR5BNF/ctIFjjfOuD1wI2Wj6yHMCMT+jIPJ19uRUXXF1HeztMTvD+ZvZOkSbIKwJr6DSfnGlREMuhqYnMGaWyoRpq1MDyDBAiP58d4OgqdqNXs/Jh0NERod9F2boZs8SFaIxy1uU+j1+SuQ==" >>/home/vagrant/.ssh/authorized_keys
      echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDgTrq/c1l6cicm3q1ja1NpdBbzPkP6QGWBx+06/4XR84HAjJT9JOwaGyae35kikDV2hAT1xJGPHB71wtHE8nyAzedeVocCccE9wLOVTiMPbBwP25bEBq+RybVhs7cu8w6VvL+h7rThaX+n5NrD498Iq2YRf+WX7PJ6YaazANX/roKOB8O0C5DA+HBXtjrA+t7x5bbv/SnvQ/aC2YeX27oeUksxSeJCjYdIUXN6j/o8ftMrEFwura/CHRosJXsScf0RjRSP9xRgK0Zm7y8XlWTGK/RSxSYdhiH9ugYyu7nPPqhYxI1exOdgvF5cdK8Qfgz0d8cDDpxGi0RgQJOTVO4+/jvjdkX2rnloNb7U80Z+ZO73lVewMUUxonRIR3DPpGhUjdq0xyzm1SPTv3gh0y9tNd6JWaEessXZ1ldgmHvMT7GwAwEAUT56yjtOpzi7yNBK5NykjGIXAwVPDGfxmfs51wZ8bxt5pVXRbx+CCXvbWIIUFUpQ88TZ2qaubsK9dbKXPz6DopMwFO+gC6vVJ3CzvFXwyR/hR5BNF/ctIFjjfOuD1wI2Wj6yHMCMT+jIPJ19uRUXXF1HeztMTvD+ZvZOkSbIKwJr6DSfnGlREMuhqYnMGaWyoRpq1MDyDBAiP58d4OgqdqNXs/Jh0NERod9F2boZs8SFaIxy1uU+j1+SuQ==" >>/root/.ssh/authorized_keys
    SHELL
    end
  end
end