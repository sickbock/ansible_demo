# Ansible demo
Initial setup with Ansible and GitLab. 

The following files are provided:
* `ansible.sh` VBoxManage script to create a VM named `ansiblevm` - customise as neededs
* `minimal_vm.sh` VBoxManage script to create a VM named `minimalvm` - customise as needed
* `minimal_el7_vm.cfg` Kickstart configuration for just a minimal CentOS 7 installation
* `el7_ansible_vm.cfg` the same Kickstart configuration with post-install script to configure EPEL and install Ansible
* `pxelinux.cfg/default` PXE-boot menu with `APPEND` line to install using `minimal_el7_vm.cfg` from here (ie GitHub)

The Kickstart configures the systems it installs as Vagrant boxes, so all passwords are "vagrant" and the insecure Vagrant public key should be installed for the user "vagrant".

Post install:
* Kickstart at least the Aansible host and one minimal VM (in VirtualBox you can use it to create linked clones for your Gitlab server and other roles you want to test as throw away VM's)
* Configure networking: DNS, hostnames, routes, .. on all VM's
* Edit `/etc/ansible/hosts` and `site.yml` on the Ansible machine to point to your GitLab host
* Run the playbook 
* Go to the GitLab GUI and set the "root password"
* Finish by implementing your Git design, both, in GitLab and on the Ansible machine
