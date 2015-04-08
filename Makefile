all:install git_config 

help:
	@echo "\ninstall:\n-----------------------------------"
	@echo "git/vim/exuberant-ctags/valgrind/dockyunity-tweak-tool"
	@echo "classicmenu-indicator/synaptic/shutter/eclipse"
	@echo "filezilla/codeblocks/vlc/indicator-sound-switcher"
	@echo "grub-customizer"
	@echo "-----------------------------------\n"
	@echo "git_config:\n-----------------------------------"
	@echo "name/email/core.editor"
	@echo "-----------------------------------\n"

install:grub-customizer indicator-sound-switcher
	sudo apt-get -y install git
	sudo apt-get -y install vim
	sudo apt-get -y install exuberant-ctags
	sudo apt-get -y install valgrind
	sudo apt-get -y install docky
	sudo apt-get -y install unity-tweak-tool
	sudo apt-get -y install classicmenu-indicator
	sudo apt-get -y install synaptic
	sudo apt-get -y install shutter
	sudo apt-get -y install eclipse
	sudo apt-get -y install filezilla
	sudo apt-get -y install codeblocks
	sudo apt-get -y install vlc
grub-customizer:
	sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
	sudo apt-get update
	sudo apt-get -y install grub-customizer
indicator-sound-switcher:
	sudo apt-add-repository -y ppa:yktooo/ppa
	sudo apt-get update
	sudo apt-get install indicator-sound-switcher
git_config:
	git config --global user.name "scps950707"
	git config --global user.email "scps950707@gmail.com"
	git config --global core.editor "vim"
