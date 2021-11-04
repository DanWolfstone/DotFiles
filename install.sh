#!/bin/bash
# This is my config script I'm hoping will work
# Ver 1.2

#/----------- Setups -----------/#
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -Syu

#/----------- Installs -----------/#
clear && echo "//> Starting installations"

git clone https://aur.archlinux.org/yay.git # Yay is not default in !manjaro systems, so manual install required
cd yay
	makepkg -si
cd .. && rm -rf ./yay

sudo pacman -S notepadqq konsole fish ksysguard discord steam obs-studio vlc ghostwriter baobab gparted htop wine gnome-disk-utility winetricks xarchiver spectacle firefox lutris ranger fzf neofetch rofi  tldr wget rclone catfish sddm-kcm github-cli git python3 wget s-tui virt-manager kolourpaint  neovim dictd kate ark
sudo pacman -S base-devel
yay -S exodus minecraft-launcher visual-studio-code-bin opentabletdriver-git scrcpy ddgr gotop pix gdu exa quickemu appimagelauncher font-manager timeshift
yay -S clonehero nsnake # vitetris //tetris on yay is broken rn
sudo sh ./installs/JD2Setup_x64.sh
pip install howdoi yt-dlp

echo "5s Pause for reading error messages" && sleep 5
#/----------- Git Clones -----------/#
#clear && echo "//> Git and stuff"

mkdir gitcl && cd ./gitcl
echo "Please Sign into Git"
git auth login
git clone https://github.com/vicgeralds/vitetris.git			# Tetris
	cd ./vitetris
	sudo make install
	cd ..


# I hate how fuckin long that URL is
wget -P ./gitcl/  https://dl2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1ODA1ODg4MzQiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjY4MGM3MTE4ZTcwMGMyNDA5ZTM1Yjk4ZGYyMmUxOTc1ZGE1NDRkNTU2ZDNmNWU2ZDJlMDU3Y2MxYjljMDEzNjZjZTgzM2VlOTY3NGU0NjkwMmUwYzI2NGI3ZDBhZjM3MjVmODJjMmYyMDAwZTA3ZWI4NGJiMWQwMTJjNzRjZTQzIiwidCI6MTYzNTQwNjM5OSwic3RmcCI6ImFkNzIyNGFjNzVjM2I0M2E3NjhkM2RlNWY0M2RlZTdjIiwic3RpcCI6IjE0Ny4xNzQuNzUuMTI4In0.blNhzTG-bnW5EmBXsTJmb2UApDLLoa2jvNrllt83AP4/sugar-candy.tar.gz

echo "5s Pause for reading error messages" && sleep 5
#/----------- cp Themes  -----------/#
#clear && echo "//> Copying Themes"
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

    # Moving big themes
cp -r ./theme/Win-8.1-S 				~/.icons/ # Win 8.1 mouse

    # Plasma Theme
cp -r ./theme/WhiteSur-dark 			~/.local/share/plasma/desktoptheme/
cp ./theme/OrchisDark.colors 			~/.local/share/plasma/desktoptheme/

cp -r ./theme/metro-for-steam-4.4 		~/.local/share/steam/skins/ # Steam Theme
    # Colors
cp -r ./theme/Orchis-dark 				~/.themes/ # GTK 3.0 theme
cp -r ./theme/WhiteSur-Sharp-dark       ~/.local/share/aurorae/themes/ # Close buttons
cp -r ./theme/KwinDE                    ~/.local/share/icons/ #Icons, edit VSC icons (scalable)
cp -r ./theme/fonts 					~/.local/share/ #hoping to get opensans in like this
cp ./theme/OrchisDark.colors 			~/.local/share/color-schemes/	# Not sure if I need this
cp ./theme/kdeglobals					~/.kde4/share/config/
cp ./theme/kde/kdeglobals				~/.config/
cp ./BlueOnBlack.colorscheme			~/.local/share/Konsole #Konsole Colorscheme
cp ./Main.profile 						~/.local/share/Konsole #Konsole
cp ./theme/settings.ini 				~/.config/gtk-4.0/
cp ./theme/.gtkrc-2.0 					~/


echo \n
echo "Password required for copying SDDM theme"
sudo tar -xzvf ./gitcl/sugar-candy.tar.gz -C /usr/share/sddm/themes

echo "5s Pause for reading error messages" && sleep 5
#/----------- cp Configs  -----------/#
#clear && echo "//> Copying Configs"

# Neglecting kwinrc 	 //hoping that the new compositing pipeline runs well
# Neglecting spectaclerc //copy to clipboard & save location broke

cp ./configs/Code/settings.json ~/.config/Code/User/
cp ./configs/discord/settings.json ~/.config/discord/
cp ./configs/otablet/settings.json ~/.config/OpenTabletDriver/
cp ./configs/homedir/* ~/
# cp firefox config... check out > user.js instead of copying prefs.js (which has pwds/emails)
	# maybe make the option to assume whether or not I'm on desktop or not (144hz scroll rate/etc)
# Not copying fstab because that can be done with gnome-disks
# sudo cp ./configs/fstab /etc/ #Be careful with this

echo "5s Pause for reading error messages" && sleep 5
#/----------- Linking  -----------/#
# ln -s /mnt/Win/Users/DanWolfstone/AppData/Roaming/.minecraft/     ~/minecraft
# idk what else to link, so I might as well do that *one* myself


#/----------- Extras  -----------/#
#clear && echo "//> Exras"
cd ./gitcl
wget https://github.com/lawl/NoiseTorch/releases/latest/download/NoiseTorch_x64.tgz						# Noisetorch/Mic noise cancellation
		tar -C $HOME -xzf NoiseTorch_x64.tgz
		sudo setcap 'CAP_SYS_RESOURCE=+ep' ~/.local/bin/noisetorch
		# If you need to uninstall it check here  //        https://github.com/lawl/NoiseTorch#download--install

		wget https://github.com/DavidoTek/ProtonUp-Qt/releases/download/v2.1.0/ProtonUp-Qt-2.1.0-x86_64.AppImage
cd ..

mkdir ~/pkgs/
mkdir ~/DesX/
mkdir ~/School/#!/bin/fish
alias -s exa="exa -l"
alias -s fzf="fzf -e"
alias -s define="dict -d gcide"


#Fish aliases
	#!/bin/fish
	alias -s exa="exa -l"
	alias -s fzf="fzf -e"
	alias -s define="dict -d gcide"
	#!/bin/bash


# Tablet driver
systemctl --user daemon-reload
systemctl --user enable opentabletdriver --now

echo "5s Pause for reading error messages" && sleep 5
#/----------- Cleanup ----------/#
#clear && echo "//> Starting Cleanup"

#I know this isn't the most efficient but it's whatever, looks prettier to me
cd ./theme/ # Removing Themes
	rm -rf ./fonts
	rm -rf ./kde
	rm -rf ./KwinDE
	rm -rf ./metro-for-steam-4.4
	rm -rf ./Orchis-dark
	rm -rf ./WhiteSur-dark
	rm -rf ./WhiteSur-Sharp-dark
	rm -rf ./Win-8.1-S
	cd ..

cd ./

#echo "5s Pause for reading error messages" && sleep 5
#/----------- Echos  -----------/#
echo /----------- SCRIPT FINISHED  -----------/
echo /--- if anything didnt copy then run
echo /--- discord/vscode/steam/OTD
echo /-----------      Goodbye     -----------/
