#!/bin/bash
# should be run with sudo privileges

if ! command -v ansible >/dev/null; then
	echo "Installing Ansible dependencies and Git."
	if command -v yum >/dev/null; then
			yum update -y
			yum install ansible -y
	elif command -v dnf >/dev/null; then
			dnf update -y
			dnf install ansible -y
	elif command -v apt-get >/dev/null; then
			apt-get update -y
			apt-get install software-properties-common -y
			apt-add-repository ppa:ansible/ansible -y
			apt-get update -y
			apt-get install ansible -y
	else
			echo "neither yum, dnf or apt-get found!"
			exit 1
	fi
fi
echo "Running playbook."
ansible-playbook -K MainPlaybook.yml

