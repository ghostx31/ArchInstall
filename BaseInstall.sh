pacstrap /mnt base linux linux-firmware vim 
echo "The following tables will be set in fstab"
genfstab -U /mnt
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

##############################################################3333

echo "Enter your region in the form of 'Continent/City', e.g., 'Asia/Kolkata'"
read loc 
ln -sf /mnt/usr/share/zoneinfo/$loc /mnt/etc/localtime 
echo "Timezone set to $loc"
hwclock --systohc
echo "Hardware clock synchronised Successfully"


################################################################
echo "Enter hostname you want to set."
read hostname
echo "$hostname" > /mnt/etc/hostname
echo "Hostname assigned Successfully"


###################################################
rm -rf /etc/hosts
echo -e "127.0.0.1  localhost\n::1    localhost\n127.0.1.1 $hostname.localdomain $hostname" > /mnt/etc/hosts
echo "The following data was written to /etc/hosts"
echo -e "127.0.0.1  localhost\n::1    localhost\n127.0.1.1 $hostname.localdomain $hostname"


###################################################3
echo "Setting locale to en_US.UTF-8"
sed -i "/#en_US.UTF-8/s/^#//g" /mnt/etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /mnt/etc/locale.conf
echo "Locales configured Successfully"

####################################################
echo -e "nameserver 1.1.1.1\nameserver 8.8.8.8\nnameserver8.8.4.4" > /mnt/etc/resolv.conf
chattr +i /mnt/etc/resolv.conf
echo "Nameservers configured!"
##################################################

sudo pacman -S grub networkmanager network-manager-applet dialog wireless_tools wpa_supplicants base-devel linux-headers firefox xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk plasma-desktop dolphin konsole  --noconfirm
##########################################
# Installing grub
############################################
echo " Enter the drive in which you want to Install grub , Example : sda , sdb ."
read drive
grub-install --target=i386-pc /dev/$drive
grub-mkconfig -o /mnt/boot/grub/grub.cfg
echo " Grub installed Successfully"
echo "Enter the password you want to set. The typed password will not appear in the console."
read -s passw
echo "Setting root password!"
echo "root:$passw" | chpasswd
echo "Checking the new password..."
su -c "echo 'Password verified Successfully'" - root

echo "Enter the username of the user you want to create."
read user
useradd -mG wheel,audio,video,storage,power $user

echo "Set a password for the user. The entered password will not appear in the console."
read -s password
echo "$user:$password" | chpasswd

echo "User $user was created successfully."

echo "Enabling root privileges for users in wheel group..."
sed -i "/%wheel ALL=(ALL:ALL) ALL/s/^#//g" /etc/sudoers
