#!/bin/bash
# This is my config script I'm hoping will work
# Ver 1.1

#/----------- Installs -----------/#

sudo pacman -S notepadqq yay konsole fish ksysguard discord steam obs-studio vlc ghostwriter baobab gparted htop wine gnome-disk-utility winetricks xarchiver spectacle firefox lutris ranger font-manager fzf neofetch rofi timeshift tldr wget rclone catfish
sudo pacman -S base-devel
yay -S exodus minecraft-launcher visual-studio-code-bin opentabletdriver-git scrcpy ddgr
yay -S clonehero nsnake # vitetris //tetris is broken rn
sudo sh ./installs/JD2Setup_x64.sh
#/----------- cp Themes  -----------/#

    # Win 8.1 mouse
cp -r ./theme/Win-8.1-S ~/.icons/
    # GTK 3.0 theme
cp -r ./theme/Orchis-dark ~/.themes/
    # Plasma Theme
cp -r ./theme/WhiteSur-dark ~/.local/share/plasma/desktoptheme/
cp ./theme/OrchisDark.colors ~/.local/share/plasma/desktoptheme/
    # Colors
# cp ./theme/OrchisDark.colors 		~/.local/share/color-schemes/	# Not sure if this one is needed
    # Close buttons
cp -r ./theme/WhiteSur-Sharp-dark ~/.local/share/aurorae/themes/
    #Icons, edit VSC icons (scalable)
cp -r ./theme/KwinDE ~/.local/share/icons/
    #hoping to get opensans in like this
cp -r ./theme/fonts ~/.local/share/
cp ./theme/kdeglobals ~/.kde4/share/config/
cp ./theme/kde/kdeglobals ~/.config/
cp ./theme/settings.ini ~/.config/gtk-4.0/
cp -r ./theme/metro-for-steam-4.4 ~/.local/share/steam/skins
cp ./theme/.gtkrc-2.0 ~/

#/----------- cp Configs  -----------/#

# Neglecting kwinrc 	 //hoping that the new compositing pipeline runs well
# Neglecting spectaclerc //copy to clipboard & save location broke
cp ./configs/Code/settings.json ~/.config/Code/User/
cp -r ./configs/Code/extensions/* ~/.vscode/extensions/
cp ./configs/discord/settings.json ~/.config/discord/
cp ./configs/otablet/settings.json ~/.config/OpenTabletDriver/
cp ./configs/rclone.conf ~/.config/rclone/
cp ./configs/homedir/* ~/
cp ./configs/.git-credentials ~/ #YOU SHOULDN'T BE DOING THIS
cp ./configs/.gitconfig ~/ #OR THIS, BUT IT'S CONVENIENT SO FUCKIT
#note for v1.2 make it copy the old fstab as fstab-backup
# sudo cp ./configs/fstab /etc/ #Be careful with this

#/----------- Linking  -----------/#
# ln -s /mnt/Win/Users/DanWolfstone/AppData/Roaming/.minecraft/ ~/minecraft
# idk what else to link, so I might as well do that *one* myself

#/----------- Echos  -----------/#
echo /----------- SCRIPT FINISHED  -----------/
echo /--- if anything didnt copy then run discord/vscode/steam/OTD
echo /-----------      Goodbye     -----------/
