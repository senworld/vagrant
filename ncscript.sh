#!/usr/bin/bash
if nc -z $CONTAINER_SERVER 22 2>/dev/null; then
    /usr/local/bin/ansible-playbook -i /home/vagrant/Ansibleinventory /home/vagrant/Ansibleinstall-docker.yml
    /usr/local/bin/ansible-playbook -i /home/vagrant/Ansibleinventory /home/vagrant/Ansiblejenkins.yml
    break
fi