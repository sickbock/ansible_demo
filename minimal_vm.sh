#!/bin/bash
myVMs=/virtualbox/VMs
MyVM=minimalvm
cd ${myVMs}
vboxmanage unregistervm ${MyVM} --delete
rm -rf ${MyVM}
mkdir ${MyVM}
cd ${MyVM}
vboxmanage createhd --filename ${MyVM}.vdi --size 10240
vboxmanage createvm --name ${MyVM} --ostype RedHat_64 --register
vboxmanage modifyvm ${MyVM} --cpus 2 --memory 2048 --vram=12 --acpi on --nic1 NAT # optional second NIC # --nic2 bridged --bridgeadapter2 enp0s25
vboxmanage modifyvm ${MyVM} --nictype1 virtio
# optional second NIC # vboxmanage modifyvm ${MyVM} --nictype2 virtio
#force new install#vboxmanage modifyvm ${MyVM} --boot1 net --boot2 disk --boot3 none --boot4 none # to do PXE boot
vboxmanage modifyvm ${MyVM} --boot1 disk --boot2 net --boot3 none --boot4 none
vboxmanage storagectl ${MyVM} --name "SATA Controller" --add sata --controller IntelAHCI
vboxmanage storageattach ${MyVM} --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium `pwd`/${MyVM}.vdi
cd ~/.config/VirtualBox/TFTP
[[ ! -h minimalvm.pxe ]] && ln -s pxelinux.0 minimalvm.pxe
cd -

