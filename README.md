# Ansible demo
Initial setup with Ansible and GitLab. 

The following files are provided:
* `ansible.sh` VBoxManage script to create a VM named `ansiblevm` - edit to suit your needs
* `minimal_vm.sh` VBoxManage script to create a VM named `minimalvm` - edit to suit your needs
* `minimal_el7_vm.cfg` Kickstart configuration for just a minimal CentOS 7 installation
* `el7_ansible_vm.cfg` the same Kickstart configuration with post-install script to configure EPEL and install Ansible
* `pxelinux.cfg/default` PXE-boot menu with `APPEND` line to install using `minimal_el7_vm.cfg` from here (ie GitHub)
