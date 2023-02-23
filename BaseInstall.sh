pacstrap /mnt base linux linux-firmware vim 
echo "The following tables will be set in fstab"
genfstab -U /mnt
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

##############################################################3333


cd /etc
echo "Now in /etc directory"
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime 
hwclock --systohc
echo "Hardware clock synchronised Successfully"


################################################################
echo "ArchLinux" >> hostname
echo "Hostname assigned Successfully"


###################################################
rm -rf /etc/hosts
echo "127.0.0.1     localhost" >> /etc/hosts
echo "::1     localhost" >> /etc/hosts
echo "127.0.1.1     ArchLinux.localdomain	ArchLinux" >> /etc/hosts

echo "The following data was written in /etc/hosts"
echo "127.0.0.1     localhost" >> /etc/hosts
echo "::1     localhost" >> /etc/hosts
echo "127.0.1.1     ArchLinux.localdomain	ArchLinux" >> /etc/hosts


###################################################3
rm -rf /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> locale.gen
echo "LANG=en_US.UTF-8" >> locale.conf
echo "Locales configured Successfully"

####################################################
rm -rf /etc/resolv.conf
echo "nameserver 1.1.1.1" >> /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
chattr +i /etc/resolv.conf
echo "DNS Resolved , following data was written "
echo "nameserver 1.1.1.1" >> /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
##################################################

sudo pacman -S grub networkmanager network-manager-applet dialog wireless_tools wpa_supplicants base-devel linux-headers firefox xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk plasma-desktop dolphin konsole  --noconfirm

echo "Install Grub Yourself"
echo "Set Root Password , Create a user and add it to visudo"
