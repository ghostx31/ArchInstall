mkdir ~/LearningArena
cd ~/LearningArena
sudo pacman -S git nitrogen pulseaudio pulsemixer locate which telegram-desktop zathura xpdf bluez bluez-utils sxiv mpv pulseaudio-bluetooth --noconfirm
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo systemctl --user enable pulseaudio
sudo systemctl --user start  pulseaudio
git clone https://github.com/iamharshit188/dwm_dotfiles
cd dwm_dotfiles
mkdir /etc/X11/xorg.conf.d
sudo cp 30-touchpad.conf /etc/X11/xorg.conf.d/
cd dwmWindowManager 
sudo make clean install
cd ~/LearningArena/dwm_dotfiles
cd dwmWindowManager 
sudo make clean install

cd ~/LearningArena/dwm_dotfiles
cd dmenu
sudo make clean install

cd ~/LearningArena/dwm_dotfiles
cd SimpleTerminal
sudo make clean install
sudo cp /bin/st /bin/alacritty

cd ~/LearningArena/dwm_dotfiles
cd Scripts
sudo cp * /bin 

cd ~/LearningArena/dwm_dotfiles
sudo cp fixBrBluetoothConnectionNotAvailble.sh startdwm startkde /bin

cd 
echo "DWM Window Manager and KDE plasma Installed"
echo "DWM Window Manager and KDE plasma Installed"
echo "DWM Window Manager and KDE plasma Installed"
echo "DWM Window Manager and KDE plasma Installed"
echo "DWM Window Manager and KDE plasma Installed"



