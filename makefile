currentDir=$(PWD)
installDir=~/install
githubDir=~/github

all:folder aptPackage ppaRepo ppaPackage third_party config

third_party: deb_run pip git-extra gcin streamlink-twitch-gui

config:dotfiles settings

folder:
	mkdir $(installDir) -p
	mkdir $(githubDir) -p

update:
	sudo apt -y install `cat aptPackage`
	sudo apt -y install `cat ppaPackage`

aptPackage:
	sudo apt -y install `cat aptPackage`

ppaPackage:
	sudo apt -y install `cat ppaPackage`

pip:
	pip install streamlink
	pip install thefuck

ppaRepo:
	sudo apt-add-repository -y ppa:danielrichter2007/grub-customizer
	sudo apt-add-repository -y ppa:yktooo/ppa
	sudo apt-add-repository -y ppa:webupd8team/y-ppa-manager
	sudo apt-add-repository -y ppa:numix/ppa
	sudo apt-add-repository -y ppa:git-core/ppa
	sudo add-apt-repository -y ppa:gerardpuig/ppa
	sudo apt update

tint2:
	sudo apt -y install libcairo2-dev libpango1.0-dev libglib2.0-dev libimlib2-dev libgtk2.0-dev libxinerama-dev libx11-dev libxdamage-dev libxcomposite-dev libxrender-dev libxrandr-dev librsvg2-dev libstartup-notification0-dev
	( cd $(githubDir) && \
	git clone https://gitlab.com/o9000/tint2.git && \
	cd tint2 && \
	mkdir build && \
	cd build && \
	cmake .. && \
	make && \
	sudo make install )
	cp /usr/local/share/applications/tint2.desktop ~/.config/autostart/

gcin:
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 835AB0E3
	sudo sh -c "echo \"deb http://hyperrate.com/gcin-ubuntu1604 eliu release\" > /etc/apt/sources.list.d/gcin.list"
	sudo apt update
	sudo apt install -y gcin
	mkdir -p ~/.gcin && mkdir -p ~/.gcin/config
	cp gcinconfig/* ~/.gcin/config/

deb_run:
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ${installDir}
	sudo gdebi -n ${installDir}/google-chrome-stable_current_amd64.deb
	wget https://remarkableapp.github.io/files/remarkable_1.87_all.deb -P ${installDir}
	sudo gdebi -n ${installDir}/remarkable_1.87_all.deb
	wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb -O ${installDir}/dropbox_2015.10.28_amd64.deb
	sudo gdebi -n ${installDir}/dropbox_2015.10.28_amd64.deb
	cp ./appLauncher/DropboxFolder.desktop ~/.local/share/applications

git-extra:
	curl -sSL http://git.io/git-extras-setup | sudo bash /dev/stdin

streamlink-twitch-gui:
	( cd ~ && \
	wget https://github.com/streamlink/streamlink-twitch-gui/releases/download/v1.0.0/streamlink-twitch-gui-v1.0.0-linux64.tar.gz && \
	tar xvzf streamlink-twitch-gui-v1.0.0-linux64.tar.gz )
	cp ./appLauncher/streamlink-twitch-gui.desktop ~/.local/share/applications
	cp ~/streamlink-twitch-gui/icons/icon-48.png ~/.local/share/icons/hicolor/48x48/apps/streamlink-twitch-gui.png

homefoldername_to_eng:
	LANG=C xdg-user-dirs-gtk-update

dotfiles:
	( cd $(githubDir) && \
		git clone git@github.com:scps950707/dotfiles.git && \
		cd dotfiles && \
		make )

settings:
	# brightness and lock
	gsettings set org.gnome.desktop.screensaver lock-enabled false
	gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false
	gsettings set org.gnome.desktop.session idle-delay 0
	# appearance
	gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true
	gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ reveal-trigger 1
	gsettings set com.canonical.Unity integrated-menus true
	# safety and privacy
	gsettings set org.gnome.desktop.privacy remember-recent-files false
	gsettings set com.canonical.Unity.Lenses remote-content-search 'none'
	# text input
	gsettings set com.canonical.indicator.keyboard visible false
	gsettings set org.gnome.libgnomekbd.desktop group-per-window false
	# blueteeth
	gsettings set com.canonical.indicator.bluetooth visible false
	# power
	gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0
	# monitor
	gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-capture-mouse false
	# time and date
	gsettings set com.canonical.indicator.datetime show-date true
	gsettings set com.canonical.indicator.datetime show-day true
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
	gsettings set com.canonical.desktop.interface scrollbar-mode normal
	timedatectl set-local-rtc 1 --adjust-system-clock
