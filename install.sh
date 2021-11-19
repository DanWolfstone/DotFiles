#!/bin/bash
# This is my config script I'm hoping will work
# Ver 1.2

#/----------- Setups -----------/#
echo "System Updates, keyring population"
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -Syu

#/----------- Installs -----------/#
clear && echo "//> Starting installations"

git clone https://aur.archlinux.org/yay.git # Yay is not default in !manjaro systems, so manual install required
cd yay
	makepkg -si
cd .. && rm -rf ./yay

sudo pacman -S notepadqq konsole fish ksysguard discord steam obs-studio vlc ghostwriter baobab gparted htop wine gnome-disk-utility winetricks xarchiver spectacle firefox lutris ranger fzf neofetch rofi tldr wget rclone catfish sddm-kcm github-cli git python3 wget s-tui virt-manager kolourpaint neovim dictd kate ark python-pip lutris
sudo pacman -S base-devel cmake glslang ninja python2 qt5-base qt5-tools
yay -S exodus minecraft-launcher visual-studio-code-bin opentabletdriver-git scrcpy ddgr gotop pix gdu exa quickemu appimagelauncher font-manager timeshift conan
yay -S clonehero nsnake # vitetris //tetris on yay is broken rn
sudo sh ./installs/JD2Setup_x64.sh
pip install howdoi yt-dlp

echo "2s Pause for reading error messages" && sleep 2
#/----------- Git Clones -----------/#
#clear && echo "//> Git and stuff"

mkdir gitcl && cd ./gitcl
echo "Please Sign into Git"
gh auth login
git clone https://github.com/vicgeralds/vitetris.git			# Tetris
	cd ./vitetris
	sudo make install
	cd .. #>back to gitcl

	curl -s https://raw.githubusercontent.com/pineappleEA/Pineapple-Linux/master/pineapple.sh | sh -s
cd ..		#>back to dotfiles

sudo git clone https://framagit.org/MarianArlt/sddm-sugar-candy.git /usr/share/sddm/themes/sugar-candy

echo "2s Pause for reading error messages" && sleep 2
#/----------- cp Themes  -----------/#
#clear && echo "//> Copying Themes"

# Unzipping, do NOT use -xzvf (verbose is a mess)
cd ./theme/
	tar -xzf fonts.tar.gz 									&& echo "Unzipping fonts"
	tar -xzf kde.tar.gz 										&& echo "Unzipping kde globals"
	tar -xzf KwinDE.tar.gz 								&& echo "Unzipping KwinDE"
	tar -xzf metro-for-steam-4.4.tar.gz		&& echo "Unzipping metro for steam"
	tar -xzf Orchis-dark.tar.gz 						&& echo "Unzipping Orchis-Dark"
	tar -xzf WhiteSur-dark.tar.gz 					&& echo "Unzipping WhiteSur-Dark"
	tar -xzf WhiteSur-Sharp-dark.tar.gz 		&& echo "Unzipping WhiteSur-Sharp-Dark"
	tar -xzf Win-8.1-S.tar.gz 							&& echo "Unzipping Win 8.1 cursor"
cd ..

# Maybe have a list of mkdirs (check #coding)
    # Moving big themes
echo "Copying themes. . ."
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
cp ./theme/BlueOnBlack.colorscheme			~/.local/share/Konsole #Konsole Colorscheme
cp ./theme/Main.profile 						~/.local/share/Konsole #Konsole
cp ./theme/settings.ini 				~/.config/gtk-4.0/
cp ./theme/.gtkrc-2.0 					~/




echo "2s Pause for reading error messages" && sleep 2
#/----------- cp Configs  -----------/#
#clear && echo "//> Copying Configs"

# Neglecting kwinrc 	 //hoping that the new compositing pipeline runs well
# Neglecting spectaclerc //copy to clipboard & save location broke

#Contemplating launching apps, then killing them so they generate their configs then replace
mkdir ~/.config/discord/
mkdir ~/.config/Code/User/
mkdir ~/.config/OpenTabletDriver/
mkdir ~/.config/lutris/games/


cp ./configs/Code/settings.json ~/.config/Code/User/
cp ./configs/discord/settings.json ~/.config/discord/
cp ./configs/otablet/settings.json ~/.config/OpenTabletDriver/
cp ./configs/homedir/* ~/
cp ./configs/lightroom-1628211071.yml ~/.config/lutris/games/
cp ./configs/osu-windows-1627438126.yml ~/.config/lutris/games/
cp ./configs/photoshop-1628207390.yml ~/.config/lutris/games/
cp ./configs/rclone.sh ~/config/autostart-scripts

# cp firefox config... check out > user.js instead of copying prefs.js (which has pwds/emails)
	# maybe make the option to assume whether or not I'm on desktop or not (144hz scroll rate/etc)

echo "Qemu Configs Copying..."
sudo tar -xzf ./configs/qemuStuff.tar.gz /etc/libvirt/


	# Not copying fstab because that can be done with gnome-disks
# sudo cp ./configs/fstab /etc/ #Be careful with this

echo "2s Pause for reading error messages" && sleep 2
#/----------- Linking  -----------/#
# ln -s /mnt/Win/Users/DanWolfstone/AppData/Roaming/.minecraft/     ~/minecraft
# idk what else to link, so I might as well do that *one* myself


#/----------- Extras  -----------/#
#clear && echo "//> Exras"
cd ./gitcl
	#Change options to make wget silent
	wget https://github.com/lawl/NoiseTorch/releases/latest/download/NoiseTorch_x64.tgz						# Noisetorch/Mic noise cancellation
			tar -C $HOME -xzf NoiseTorch_x64.tgz
			sudo setcap 'CAP_SYS_RESOURCE=+ep' ~/.local/bin/noisetorch
			# If you need to uninstall it check here  //        https://github.com/lawl/NoiseTorch#download--install

	#Change options to make wget silent
wget https://github.com/DavidoTek/ProtonUp-Qt/releases/download/v2.1.0/ProtonUp-Qt-2.1.0-x86_64.AppImage
cd ..

mkdir ~/pkgs/
mkdir ~/DesX/
mkdir ~/School/


#Fix fish aliases, cmd doesn't seem to want to work
#!/bin/fish
	# alias -s exa="exa -l"
	# alias -s fzf="fzf -e"
	# alias -s define="dict -d gcide"
	# alias pineapple="curl -s https://raw.githubusercontent.com/pineappleEA/Pineapple-Linux/master/pineapple.sh | sh -s --"
#!/bin/bash


# Tablet driver
systemctl --user daemon-reload
systemctl --user enable opentabletdriver --now

echo "2s Pause for reading error messages" && sleep 2
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



#echo "5s Pause for reading error messages" && sleep 5
#/----------- Echos  -----------/#
echo /----------- SCRIPT FINISHED  -----------/
echo /--- if anything didnt copy then run
echo /--- discord/vscode/steam/OTD
echo /--- konsole/Lutris/wine scripts  # yet to add wine scripts
echo /-----------      Goodbye     -----------/
