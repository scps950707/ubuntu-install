currentDir=$(PWD)
installDir=~/install
githubDir=~/github
nvidiaVersion=367.35

all:install

help:
	@echo "make install"

install:folder update not-apt-get PIP

not-apt-get: deb_run autojump PPA gcin clang

folder:
	mkdir $(installDir) -p
	mkdir $(githubDir) -p

update:
	sudo apt-get -y install `cat aptPackage`

PIP:
	sudo pip install livestreamer
	sudo -H pip install thefuck

PPA:
	sudo apt-add-repository -y ppa:danielrichter2007/grub-customizer
	sudo apt-add-repository -y ppa:yktooo/ppa
	sudo apt-add-repository -y ppa:tualatrix/ppa
	sudo apt-add-repository -y ppa:webupd8team/y-ppa-manager
	sudo apt-add-repository -y ppa:numix/ppa
	sudo apt-add-repository -y ppa:libreoffice/ppa
	sudo apt-add-repository -y ppa:ubuntu-toolchain-r/test
	sudo apt-get update
	sudo apt-get -y install \
	grub-customizer \
	indicator-sound-switcher \
	ubuntu-tweak \
	y-ppa-manager \
	numix-icon-theme-circle \
	libreoffice \
	gcc-5 \
	g++-5
	sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 1 --slave /usr/bin/g++ g++ /usr/bin/g++-5

tint2:
	sudo apt-get -y install libcairo2-dev libpango1.0-dev libglib2.0-dev libimlib2-dev libgtk2.0-dev libxinerama-dev libx11-dev libxdamage-dev libxcomposite-dev libxrender-dev libxrandr-dev librsvg2-dev libstartup-notification0-dev
	( cd $(githubDir) && \
	git clone https://gitlab.com/o9000/tint2.git && \
	cd tint2 && \
	mkdir build && \
	cd build && \
	cmake .. && \
	make && \
	sudo make install )
	mkdir -p ~/.config/autostart/ && cat ./appLauncher/tint2.desktop > ~/.config/autostart/tint2.desktop

gcin:
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 835AB0E3
	grep "deb http://hyperrate.com/debian eliu release" /etc/apt/sources.list > /dev/null || echo "deb http://hyperrate.com/debian eliu release" | sudo tee -a /etc/apt/sources.list
	sudo apt-get update
	sudo apt-get install -y gcin
	mkdir -p ~/.gcin && mkdir -p ~/.gcin/config
	cp gcinconfig/* ~/.gcin/config/

deb_run:
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ${installDir}
	sudo gdebi -n ${installDir}/google-chrome-stable_current_amd64.deb
	wget https://remarkableapp.github.io/files/remarkable_1.75_all.deb -P ${installDir}
	sudo gdebi -n ${installDir}/remarkable_1.75_all.deb
	wget https://github.com/Aluxian/Facebook-Messenger-Desktop/releases/download/v1.4.3/Messenger_linux64.deb -P ${installDir}
	sudo gdebi -n ${installDir}/Messenger_linux64.deb
	wget https://go.skype.com/skypeforlinux-64-alpha.deb -P ${installDir}
	sudo gdebi -n ${installDir}/skypeforlinux-64-alpha.deb
	wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb -O ${installDir}/dropbox_2015.10.28_amd64.deb
	sudo gdebi -n ${installDir}/dropbox_2015.10.28_amd64.deb
	wget http://tw.download.nvidia.com/XFree86/Linux-x86_64/$(nvidiaVersion)/NVIDIA-Linux-x86_64-$(nvidiaVersion).run -P ${installDir}


autojump:
	git clone git://github.com/joelthelion/autojump.git
	cd autojump && ./install.py
	# echo "[[ -s /home/scps950707/.autojump/etc/profile.d/autojump.sh ]] && source /home/scps950707/.autojump/etc/profile.d/autojump.sh" >> ~/.bashrc
	rm -rf autojump/

clang:
	wget http://apt.llvm.org/llvm-snapshot.gpg.key && sudo apt-key add llvm-snapshot.gpg.key && rm llvm-snapshot.gpg.key
	grep "deb http://apt.llvm.org/trusty/ llvm-toolchain-trusty-3.8 main" /etc/apt/sources.list > /dev/null || echo "deb http://apt.llvm.org/trusty/ llvm-toolchain-trusty-3.8 main" | sudo tee -a /etc/apt/sources.list
	grep "deb-src http://apt.llvm.org/trusty/ llvm-toolchain-trusty-3.8 main" /etc/apt/sources.list > /dev/null || echo "deb-src http://apt.llvm.org/trusty/ llvm-toolchain-trusty-3.8 main" | sudo tee -a /etc/apt/sources.list
	sudo apt-get update
	sudo apt-get install -y clang-3.8 libclang-3.8
	sudo ln -sf /usr/bin/clang-3.8 /usr/bin/clang
	sudo ln -sf /usr/bin/clang++-3.8 /usr/bin/clang++

homefoldername_to_eng:
	LANG=C xdg-user-dirs-gtk-update

settings:
	# brightness and lock
	gsettings set org.gnome.desktop.screensaver lock-enabled false
	gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false
	gsettings set org.gnome.desktop.session idle-delay 0
	# appearance
	gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-hide-mode 1
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
	sudo sed -i 's/UTC=yes/UTC=no/g' /etc/default/rcS
