#!/bin/bash
# This is my config script I'm hoping will work
# Ver 1.2

#/----------- Installs -----------/#
clear && echo "//> Starting installations"

sudo pacman -S notepadqq yay konsole fish ksysguard discord steam obs-studio vlc ghostwriter baobab gparted htop wine gnome-disk-utility winetricks xarchiver spectacle firefox lutris ranger font-manager fzf neofetch rofi timeshift tldr wget rclone catfish sddm-kcm github-cli git python3 wget s-tui virt-manager kolourpaint appimagelauncher neovim dictd
sudo pacman -S base-devel
yay -S exodus minecraft-launcher visual-studio-code-bin opentabletdriver-git scrcpy ddgr gotop pix gdu exa quickemu
yay -S clonehero nsnake # vitetris //tetris on yay is broken rn
sudo sh ./installs/JD2Setup_x64.sh
pip install howdoi yt-dlp

#/----------- Git Clones -----------/#
clear && echo "//> Git and stuff"

mkdir gitcl && cd ./gitcl
echo "Please Sign into Git"
git auth login
git clone https://github.com/vicgeralds/vitetris.git						# Tetris
		cd ./vitetris
		sudo make install
		cd ..
git clone

# I hate how fuckin long that URL is
wget -P ./gitcl/  https://dl2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1ODA1ODg4MzQiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjY4MGM3MTE4ZTcwMGMyNDA5ZTM1Yjk4ZGYyMmUxOTc1ZGE1NDRkNTU2ZDNmNWU2ZDJlMDU3Y2MxYjljMDEzNjZjZTgzM2VlOTY3NGU0NjkwMmUwYzI2NGI3ZDBhZjM3MjVmODJjMmYyMDAwZTA3ZWI4NGJiMWQwMTJjNzRjZTQzIiwidCI6MTYzNTQwNjM5OSwic3RmcCI6ImFkNzIyNGFjNzVjM2I0M2E3NjhkM2RlNWY0M2RlZTdjIiwic3RpcCI6IjE0Ny4xNzQuNzUuMTI4In0.blNhzTG-bnW5EmBXsTJmb2UApDLLoa2jvNrllt83AP4/sugar-candy.tar.gz

#/----------- cp Themes  -----------/#
clear && echo "//> Copying Themes"
#Maybe Change to unzipping things
cd ./themes/
tar -xzvf fonts.tar.gz
tar -xzvf kde.tar.gz
tar -xzvf KwinDE.tar.gz
tar -xzvf metro-for-steam-4.4.tar.gz
tar -xzvf Orchis-dark.tar.gz
tar -xzvf WhiteSur-dark.tar.gz
tar -xzvf WhiteSur-Sharp-dark.tar.gz
tar -xzvf Win-8.1-S.tar.gz
cd ..

    # Win 8.1 mouse
cp -r ./theme/Win-8.1-S ~/.icons/
    # GTK 3.0 theme
cp -r ./theme/Orchis-dark ~/.themes/
    # Plasma Theme
cp -r ./theme/WhiteSur-dark ~/.local/share/plasma/desktoptheme/
cp ./theme/OrchisDark.colors ~/.local/share/plasma/desktoptheme/
    # Steam Theme
cp -r ./theme/metro-for-steam-4.4 ~/.local/share/steam/skins
    # Colors
cp ./theme/OrchisDark.colors ~/.local/share/color-schemes/	# Not sure if this one is needed
    # Close buttons
cp -r ./theme/WhiteSur-Sharp-dark ~/.local/share/aurorae/themes/
    #Icons, edit VSC icons (scalable)
cp -r ./theme/KwinDE ~/.local/share/icons/
    #hoping to get opensans in like this
cp -r ./theme/fonts ~/.local/share/
cp ./theme/kdeglobals ~/.kde4/share/config/
cp ./theme/kde/kdeglobals ~/.config/
cp ./theme/settings.ini ~/.config/gtk-4.0/
cp ./theme/.gtkrc-2.0 ~/

sudo tar -xzvf ./gitcl/sugar-candy.tar.gz -C /usr/share/sddm/themes
#/----------- cp Configs  -----------/#
clear && echo "//> Copying Configs"

# Neglecting kwinrc 	 //hoping that the new compositing pipeline runs well
# Neglecting spectaclerc //copy to clipboard & save location broke
cp ./configs/Code/settings.json ~/.config/Code/User/
cp ./configs/discord/settings.json ~/.config/discord/
cp ./configs/otablet/settings.json ~/.config/OpenTabletDriver/
cp ./configs/homedir/* ~/

#Not copying fstab because that can be done with gnome-disks
# sudo cp ./configs/fstab /etc/ #Be careful with this

#/----------- Linking  -----------/#
# ln -s /mnt/Win/Users/DanWolfstone/AppData/Roaming/.minecraft/ ~/minecraft
# idk what else to link, so I might as well do that *one* myself

#/----------- Extras  -----------/#
clear && echo "//> Exras"
cd ./gitcl
wget https://github.com/lawl/NoiseTorch/releases/latest/download/NoiseTorch_x64.tgz						# Noisetorch/Mic noise cancellation
		tar -C $HOME -xzf NoiseTorch_x64.tgz
		sudo setcap 'CAP_SYS_RESOURCE=+ep' ~/.local/bin/noisetorch
		# If you need to uninstall it check here  //        https://github.com/lawl/NoiseTorch#download--install

		wget https://github.com/DavidoTek/ProtonUp-Qt/releases/download/v2.1.0/ProtonUp-Qt-2.1.0-x86_64.AppImage
cd ..

mkdir ~/pkgs/
mkdir ~/DesX/
mkdir ~/School/

fish
alias -s exa="exa -l"
alias -s fzf="fzf -e"
alias -s define="dict -d gcide"

# Tablet driver
systemctl --user daemon-reload
systemctl --user enable opentabletdriver --now

#/----------- Cleanup ----------/#
clear && echo "//> Starting Cleanup"
cd ./theme/
    rm -rf fonts
    rm -rf kde
    rm -rf KwinDE
    rm -rf metro-for-steam-4.4
    rm -rf Orchis-dark
    rm -rf WhiteSur-dark
    rm -rf WhiteSur-Sharp-dark
    rm -rf Win-8.1-S
    cd ..
#I know this isn't the most efficient but it's whatever, looks prettier to me

#/----------- Echos  -----------/#
echo /----------- SCRIPT FINISHED  -----------/
echo /--- if anything didnt copy then run discord/vscode/steam/OTD
echo /-----------      Goodbye     -----------/
