currentDir=$(PWD)
installDir=~/install
githubDir=~/github

all:folder apt ppaRepo ppa third_party settings

third_party: getpip pip gcin

folder:
	mkdir $(installDir) -p
	mkdir $(githubDir) -p

update:
	sudo apt -y install `cat ./package/apt`
	sudo apt -y install `cat ./package/ppa`

apt:
	sudo apt -y install `cat ./package/apt`

ppa:
	sudo apt -y install `cat ./package/ppa`

pip:
	pip install `cat ./package/pip` --user

getpip:
	( cd $(installDir) && wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py --user )

ppaRepo:
	sudo apt-add-repository -y ppa:danielrichter2007/grub-customizer
	sudo apt-add-repository -y ppa:yktooo/ppa
	sudo apt-add-repository -y ppa:webupd8team/y-ppa-manager
	sudo apt-add-repository -y ppa:numix/ppa
	sudo add-apt-repository -y ppa:gerardpuig/ppa

gcin:
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 835AB0E3
	sudo sh -c "echo \"deb http://hyperrate.com/gcin-ubuntu1804 eliu release\" > /etc/apt/sources.list.d/gcin.list"
	sudo apt update
	sudo apt install -y gcin
	mkdir -p ~/.gcin && mkdir -p ~/.gcin/config
	cp gcinconfig/* ~/.gcin/config/

homefoldername_to_eng:
	LANG=C xdg-user-dirs-gtk-update

settings:
	# brightness and lock
	gsettings set org.gnome.desktop.screensaver lock-enabled false
	gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false
	gsettings set org.gnome.desktop.session idle-delay 0
	# appearance
	gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
	gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
	# safety and privacy
	gsettings set org.gnome.desktop.privacy remember-recent-files false
	# text input
	gsettings set org.gnome.libgnomekbd.desktop group-per-window false
	# power
	gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0
	# gedit
	gsettings set org.gnome.gedit.preferences.editor create-backup-copy false
	gsettings set org.gnome.gedit.preferences.editor scheme 'oblivion'
	gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
	# Unity Fonts
	gsettings set org.gnome.desktop.interface document-font-name 'Sans 14'
	gsettings set org.gnome.desktop.interface font-name 'Ubuntu 14'
	gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono 14'
	gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu Bold 14'
	# other
	timedatectl set-local-rtc 1 --adjust-system-clock
