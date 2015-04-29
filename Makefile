all::
	@echo "see make help"
help:
	@echo "\n(1)install:\n-----------------------------------"
	@echo "git/vim/valgrind/unity-tweak-tool/chrome/dropbox"
	@echo "classicmenu-indicator/synaptic/shutter/eclipse/g++"
	@echo "filezilla/codeblocks/vlc/indicator-sound-switcher"
	@echo "grub-customizer/gconf-editor/rar/docky/kolourpaint4"
	@echo "skype/dconf-editor"
	@echo "-----------------------------------\n"
	@echo "(2)git_config:\n-----------------------------------"
	@echo "name/email/core.editor"
	@echo "-----------------------------------\n"
	@echo "(3)deb_package:\n-----------------------------------"
	@echo "remarkable"
	@echo "-----------------------------------\n"
	@echo "(4)set_vim/reset_vim\n"
	@echo "(5)NVIDIA drviers:349.12/346.59\n"
	@echo "(6)old:\n-----------------------------------"
	@echo "Cairo-Dock/compizconfig-settings-manager/exuberant-ctags"
	@echo "-----------------------------------\n"
	@echo "(7)settings\n"

install:update repository_install deb_package git_config nvidia349.12

repository_install:grub-customizer indicator-sound-switcher skype chrome dropbox

update:
	sudo apt-get -y install git
	sudo apt-get -y install vim
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
	sudo apt-get -y install kolourpaint4
	sudo apt-get -y install g++
	sudo apt-get -y install dconf-editor

grub-customizer:
	sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
	sudo apt-get update
	sudo apt-get -y install grub-customizer

indicator-sound-switcher:
	sudo apt-add-repository -y ppa:yktooo/ppa
	sudo apt-get update
	sudo apt-get-y install indicator-sound-switcher

skype:
	# sudo sed -i "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
	# sudo sed -i "/^# deb-src .*partner/ s/^# //" /etc/apt/sources.list
	add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
	sudo apt-get update
	sudo apt-get -y install skype

chrome:
	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
	sudo apt-get update 
	sudo apt-get -y install google-chrome-stable

dropbox:
	sudo add-apt-repository -y "deb http://linux.dropbox.com/ubuntu $(lsb_release -cs) main"
	sudo apt-get update 
	sudo apt-get -y install dropbox

git_config:
	git config --global user.name "scps950707"
	git config --global user.email "scps950707@gmail.com"
	git config --global core.editor "vim"
	git config --global push.default "simple"

deb_package:
	#remarkable
	wget http://remarkableapp.net/files/remarkable_1.41_all.deb
	sudo dpkg -i remarkable_1.25_all.deb

set_vim:
	git clone https://github.com/scps950707/vimrc.git
	cd vimrc/ && make install

reset_vim:
	rm -rf ~/.vim ~/.vimrc ~/.viminfo

nvidia349.12:
	wget http://tw.download.nvidia.com/XFree86/Linux-x86_64/349.12/NVIDIA-Linux-x86_64-349.12.run

nvidia346.59:
	wget http://tw.download.nvidia.com/XFree86/Linux-x86_64/346.59/NVIDIA-Linux-x86_64-346.59.run

old:
	sudo apt-get -y install compizconfig-settings-manager
	sudo apt-get -y install exuberant-ctags

Cairo-Dock:
	sudo add-apt-repository -y ppa:cairo-dock-team/ppa 
	sudo apt-get update 
	sudo apt-get -y install cairo-dock cairo-dock-plug-install

settings:
	alias memcheck='valgrind --leak-check=yes'
	alias memcheckfull='valgrind --leak-check=full'
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
