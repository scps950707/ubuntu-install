##apt-get
- [X] [git](http://git-scm.com/)
- [X] [vim-gtk](http://www.vim.org/)
- [X] [valgrind](http://valgrind.org/)
- [X] [unity-tweak-tool](https://launchpad.net/unity-tweak-tool)
- [X] [classicmenu-indicator](http://www.florian-diesch.de/software/classicmenu-indicator/)
- [X] [synaptic](http://www.nongnu.org/synaptic/)
- [X] [shutter](http://shutter-project.org/)
- [X] [eclipse](http://eclipse.org/)
- [X] [filezilla](https://filezilla-project.org/)
- [X] [codeblocks](http://www.codeblocks.org/)
- [X] [rar](http://www.rarlabs.com/)
- [X] [vlc](http://www.videolan.org/vlc/)
- [X] [gconf-editor](https://projects.gnome.org/gconf/)
- [X] [docky](http://wiki.go-docky.com/index.php?title=Welcome_to_the_Docky_wiki)
- [X] [kolourpaint4](http://kolourpaint.org/)
- [X] [g++](https://gcc.gnu.org/)
- [X] [dconf-editor](https://wiki.gnome.org/Projects/dconf)
- [X] [nautilus-open-terminal](https://github.com/GNOME/nautilus)
- [X] [enca](https://github.com/nijel/enca)
- [X] [terminator](https://launchpad.net/terminator)
- [X] [p7zip](http://www.7-zip.org/)
- [X] [exuberant-ctags](http://ctags.sourceforge.net/)
- [ ] [retext](https://github.com/retext-project/retext)
- [X] [livestreamer](http://docs.livestreamer.io)
- [X] [compizconfig-settings-manager](https://apps.ubuntu.com/cat/applications/compizconfig-settings-manager/)
- [X] [compiz-plugins](https://apps.ubuntu.com/cat/applications/compiz-plugins/)


##PPA
- [X] [grub-customizer](https://launchpad.net/grub-customizer)
- [X] [indicator-sound-switcher](http://yktoo.com/en/software/indicator-sound-switcher)
- [ ] [dropbox](https://www.dropbox.com/install?os=lnx)
- [X] [chrome](https://www.google.com.tw/chrome/browser/desktop/)
- [X] [remarkable(1.62)](https://remarkableapp.github.io/)
- [X] [autojump](https://github.com/joelthelion/autojump)
- [X] [ubuntu-tweak(0.8.8)](https://launchpad.net/ubuntu-tweak)


##git config
|Config|Description|
|---------------------|----------------------|
|name|scps950707|
|email|scps950707@gmail.com|
|core.editor|vim|
|push.default|simple|

###alias
|Comands|target|
|---------------|-----------|
|co|commit
|pu|push
|st|status|


##nvidia drivers
|Version|Page|Download|Doc|
|------------|-------|-------------|-------------|
|361.28|[Page](http://www.geforce.com.tw/drivers/results/98416)|[Download](http://tw.download.nvidia.com/XFree86/Linux-x86_64/361.28/NVIDIA-Linux-x86_64-361.28.run)|[Doc](http://goo.gl/P52lj0)|
|352.79|[Page](http://www.geforce.com.tw/drivers/results/97671)|[Download](http://tw.download.nvidia.com/XFree86/Linux-x86_64/352.79/NVIDIA-Linux-x86_64-352.79.run)|[Doc](http://goo.gl/H4Q45K)|
|352.63|[Page](http://www.geforce.com.tw/drivers/results/95281)|[Download](http://tw.download.nvidia.com/XFree86/Linux-x86_64/352.63/NVIDIA-Linux-x86_64-352.63.run)|[Doc](http://goo.gl/DXeutI)|
|352.55|[Page](http://www.geforce.com.tw/drivers/results/92846)|[Download](http://tw.download.nvidia.com/XFree86/Linux-x86_64/352.55/NVIDIA-Linux-x86_64-352.55.run)|[Doc](http://goo.gl/fQuy88)|



##system alias
|Commands|target|
|-----------------|------------------------------------------------|
|memcheck|valgrind --leak-check=yes|
|memcheckfull|valgrind --leak-check=full|
|mcda|make clean dep all|
|mc|make clean|


##change tty resolution for nvidia graphic cards
	gedit /etc/default/grub
	GRUB_GFXMODE="640x480"
	GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nomodeset"
	sudo update-grub

##gcin install
- 	`sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 835AB0E3`
-	`software-properties-gtk `
- other software->Add

|version|repo|
|-----------|---------|
|12.04~14.10|`deb http://hyperrate.com/debian eliu release`|
|15.04|`deb http://hyperrate.com/gcin-ubuntu1504 eliu release`|
|15.10|`deb http://hyperrate.com/gcin-ubuntu1510 eliu release`|

###settings
![](https://raw.githubusercontent.com/scps950707/ubuntu-install/master/pic/1.png)

![](https://raw.githubusercontent.com/scps950707/ubuntu-install/master/pic/2.png)

![](https://raw.githubusercontent.com/scps950707/ubuntu-install/master/pic/3.png)


##Reference
- [Fix time differences between Ubuntu and Windows](http://www.webupd8.org/2014/09/dual-boot-fix-time-differences-between.html)
- [How do I change the VGA resolution for the non-graphical TTYs](http://askubuntu.com/questions/96658/how-do-i-change-the-vga-resolution-for-the-non-graphical-ttys)
- [Ubuntu 15.10/15.04/14.10/14.04/…/12.04 安裝最新的 gcin 中文輸入的完整步驟](http://hyperrate.com/thread.php?tid=28044)
- [讓 Linux 下的中文輸入法更接近微軟新注音使用體驗](http://goodjack.blogspot.tw/2013/08/linux-phonetic-setting.html)
