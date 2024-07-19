#!/usr/bin/bash
export JENKINS_SERVER="192.168.1.7"
if nc -z $JENKINS_SERVER 22 2>/dev/null; then
    /usr/local/bin/ansible-playbook -i /vagrant/Ansible/inventory /vagrant/Ansible/install-docker.yml
    /usr/local/bin/ansible-playbook -i /vagrant/Ansible/inventory /vagrant/Ansible/jenkins.yml
    break
fi