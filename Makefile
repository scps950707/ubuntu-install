all:install git_config deb_package

help:
	@echo "\n(1)install:\n-----------------------------------"
	@echo "git/vim/exuberant-ctags/valgrind/unity-tweak-tool"
	@echo "classicmenu-indicator/synaptic/shutter/eclipse"
	@echo "filezilla/codeblocks/vlc/indicator-sound-switcher"
	@echo "grub-customizer/gconf-editor/rar/docky/kolourpaint4"
	@echo "-----------------------------------\n"
	@echo "(2)git_config:\n-----------------------------------"
	@echo "name/email/core.editor"
	@echo "-----------------------------------\n"
	@echo "(3)deb_package:\n-----------------------------------"
	@echo "hrome/remarkable/dropbox"
	@echo "-----------------------------------\n"
	@echo "(4)set_vim/reset_vim\n"
	@echo "(5)NVIDIA drviers:349.12/346.59\n"
	@echo "(6)old:\n-----------------------------------"
	@echo "Cairo-Dock/compizconfig-settings-manager"
	@echo "-----------------------------------\n"




install:grub-customizer indicator-sound-switcher deb_package git_config
	sudo apt-get -y install git
	sudo apt-get -y install vim
	sudo apt-get -y install exuberant-ctags
	sudo apt-get -y install valgrind
	sudo apt-get -y install unity-tweak-tool
	sudo apt-get -y install classicmenu-indicator
	sudo apt-get -y install synaptic
	sudo apt-get -y install shutter
	sudo apt-get -y install eclipse
	sudo apt-get -y install filezilla
	sudo apt-get -y install codeblocks
	sudo apt-get -y install rar
	sudo apt-get -y install vlc
	sudo apt-get -y install gconf-editor
	sudo apt-get -y install docky
	sudo apt-get install kolourpaint4

grub-customizer:
	sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
	sudo apt-get update
	sudo apt-get -y install grub-customizer

indicator-sound-switcher:
	sudo apt-add-repository -y ppa:yktooo/ppa
	sudo apt-get update
	sudo apt-get-y install indicator-sound-switcher

Cairo-Dock:
	sudo add-apt-repository -y ppa:cairo-dock-team/ppa 
	sudo apt-get update 
	sudo apt-get -y install cairo-dock cairo-dock-plug-ins 

git_config:
	git config --global user.name "scps950707"
	git config --global user.email "scps950707@gmail.com"
	git config --global core.editor "vim"
	git config --global push.default "simple"

deb_package:
	#remarkable
	wget http://remarkableapp.net/files/remarkable_1.25_all.deb
	sudo dpkg -i remarkable_1.25_all.deb
	#dropbox
	wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.02.12_amd64.deb
	sudo dpkg -i dropbox_2015.02.12_amd64.deb
	#chrome
	wget https://www.dropbox.com/s/1cv0dsmge50prz7/google-chrome-stable_current_amd64.deb?dl=1 -O google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb

set_vim:
	git clone https://github.com/scps950707/vimrc.git
	cd vimrc/ && make install

reset_vim:
	#sudo apt-get -y purge vim
	rm -rf ~/.vim ~/.vimrc ~/.viminfo

nvidia349.12:
	wget http://tw.download.nvidia.com/XFree86/Linux-x86_64/349.12/NVIDIA-Linux-x86_64-349.12.run

nvidia346.59:
	http://tw.download.nvidia.com/XFree86/Linux-x86_64/346.59/NVIDIA-Linux-x86_64-346.59.run

old:
	sudo apt-get -y install compizconfig-settings-manager

