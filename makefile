currentDir=$(PWD)
installDir=~/install
githubDir=~/github

all:install

help:
	@echo "make install"

install:folder update not-apt-get PIP

not-apt-get: chrome autojump remarkable PPA

folder:
	mkdir $(installDir) -p
	mkdir $(githubDir) -p

update:
	sudo apt-get -y install \
	git \
	vim-gtk \
	valgrind \
	unity-tweak-tool \
	synaptic \
	shutter \
	filezilla \
	rar \
	vlc \
	gconf-editor \
	kolourpaint4 \
	gcc \
	g++ \
	dconf-editor \
	nautilus-open-terminal \
	enca \
	terminator \
	p7zip-full \
	python-pip \
	exuberant-ctags \
	compizconfig-settings-manager \
	compiz-plugins \
	cmake \
	python-dev \
	checkinstall \
	tree \
	cmake-qt-gui

PIP:
	sudo pip install livestreamer
	sudo -H pip install thefuck

PPA:
	sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
	sudo apt-add-repository -y ppa:yktooo/ppa
	sudo add-apt-repository -y ppa:tualatrix/ppa
	sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
	sudo apt-add-repository -y ppa:numix/ppa
	sudo apt-get update
	sudo apt-get -y install \
	grub-customizer \
	indicator-sound-switcher \
	ubuntu-tweak \
	y-ppa-manager \
	numix-icon-theme-circle

tint2:
	sudo apt-get install libcairo2-dev libpango1.0-dev libglib2.0-dev libimlib2-dev libgtk2.0-dev libxinerama-dev libx11-dev libxdamage-dev libxcomposite-dev libxrender-dev libxrandr-dev librsvg2-dev libstartup-notification0-dev
	( cd $(githubDir) && \
	git clone https://gitlab.com/o9000/tint2.git && \
	cd tint2 && \
	mkdir build && \
	cd build && \
	cmake .. && \
	make && \
	sudo make install )
	cat ./tint2.desktop > ~/.config/autostart/tint2.desktop

chrome:
	sudo apt-get install libxss1 libappindicator1 libindicator7
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb
	cp google-chrome-stable_current_amd64.deb ~/linux_install/
	rm google-chrome-stable_current_amd64.deb

remarkable:
	wget https://remarkableapp.github.io/files/remarkable_1.62_all.deb
	mv remarkable_1.62_all.deb $(installDir)

autojump:
	git clone git://github.com/joelthelion/autojump.git
	cd autojump && ./install.py
	# echo "[[ -s /home/scps950707/.autojump/etc/profile.d/autojump.sh ]] && source /home/scps950707/.autojump/etc/profile.d/autojump.sh" >> ~/.bashrc
	rm -rf autojump/

nvidia_driver:
	wget http://tw.download.nvidia.com/XFree86/Linux-x86_64/361.42/NVIDIA-Linux-x86_64-361.42.run
	mv NVIDIA-Linux-x86_64-361.42.run $(installDir)

homefoldername_to_eng:
	LANG=C xdg-user-dirs-gtk-update

settings:
	gsettings set org.gnome.gedit.preferences.editor create-backup-copy false #gedit auto save false
	gsettings set org.gnome.desktop.interface document-font-name 'Sans 14'
	gsettings set org.gnome.desktop.interface font-name 'Ubuntu 14'
	gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono 14'
	gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu Bold 14'
	gsettings set org.gnome.desktop.privacy remember-recent-files false # 紀錄檔案和應用程式使用狀況
	gsettings set org.gnome.desktop.screensaver lock-enabled false # 鎖定
	gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false #從暫停狀態下喚醒需要密碼
	gsettings set com.canonical.indicator.datetime show-date true #日期與月份
	gsettings set com.canonical.indicator.datetime show-day true #星期幾
	gsettings set com.canonical.Unity.Lenses remote-content-search 'none' #包含線上搜尋結果
	gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-capture-mouse false #黏性邊界
	gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-hide-mode 1 #自動隱藏launcher
	gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ reveal-trigger 1 #左上角顯示launcher
	gsettings set com.canonical.Unity integrated-menus true #在視窗顯示工具列
	gsettings set com.canonical.desktop.interface scrollbar-mode normal
	sudo sed -i 's/UTC=yes/UTC=no/g' /etc/default/rcS
