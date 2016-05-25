##apt-get
- [X] [git](http://git-scm.com/)
- [X] [vim-gtk](http://www.vim.org/)
- [X] [valgrind](http://valgrind.org/)
- [X] [unity-tweak-tool](https://launchpad.net/unity-tweak-tool)
- [ ] [classicmenu-indicator](http://www.florian-diesch.de/software/classicmenu-indicator/)
- [X] [synaptic](http://www.nongnu.org/synaptic/)
- [X] [shutter](http://shutter-project.org/)
- [ ] [eclipse](http://eclipse.org/)
- [X] [filezilla](https://filezilla-project.org/)
- [ ] [codeblocks](http://www.codeblocks.org/)
- [X] [rar](http://www.rarlabs.com/)
- [X] [vlc](http://www.videolan.org/vlc/)
- [X] [gconf-editor](https://projects.gnome.org/gconf/)
- [X] [kolourpaint4](http://kolourpaint.org/)
- [X] [gcc](https://gcc.gnu.org/)
- [X] [g++](https://gcc.gnu.org/)
- [X] [dconf-editor](https://wiki.gnome.org/Projects/dconf)
- [X] [nautilus-open-terminal](https://github.com/GNOME/nautilus)
- [X] [enca](https://github.com/nijel/enca)
- [X] [terminator](https://launchpad.net/terminator)
- [X] [p7zip](http://www.7-zip.org/)
- [X] [exuberant-ctags](http://ctags.sourceforge.net/)
- [ ] [retext](https://github.com/retext-project/retext)
- [X] [compizconfig-settings-manager](https://apps.ubuntu.com/cat/applications/compizconfig-settings-manager/)
- [X] [compiz-plugins](https://apps.ubuntu.com/cat/applications/compiz-plugins/)
- [X] [cmake](https://cmake.org/)
- [X] [python-dev](https://www.python.org/)
- [X] [checkinstall](http://checkinstall.izto.org/)
- [X] [tree](http://mama.indstate.edu/users/ice/tree/)
- [X] [cmake-gui](https://cmake.org/)


##PPA
- [X] [grub-customizer](https://launchpad.net/grub-customizer)
- [X] [indicator-sound-switcher](http://yktoo.com/en/software/indicator-sound-switcher)
- [ ] [dropbox](https://www.dropbox.com/install?os=lnx)
- [X] [chrome](https://www.google.com.tw/chrome/browser/desktop/)
- [X] [remarkable(1.62)](https://remarkableapp.github.io/)
- [X] [autojump](https://github.com/joelthelion/autojump)
- [X] [ubuntu-tweak(0.8.8)](https://launchpad.net/ubuntu-tweak)
- [ ] [docky](https://launchpad.net/docky)
- [X] [numixproject](https://numixproject.org/)
- [X] [y-ppa-manager](https://launchpad.net/~webupd8team/+archive/ubuntu/y-ppa-manager)

##PIP
- [X] [livestreamer](http://docs.livestreamer.io)
- [X] [thefuck](https://github.com/nvbn/thefuck)

##git
- [X] [tint2](https://gitlab.com/o9000/tint2)
- [X] [pmenu](https://gitlab.com/o9000/pmenu)
- [X] [snwh/paper-gtk-theme](https://github.com/snwh/paper-gtk-theme)

##nvidia drivers
|Version|Page|Download|Doc|
|------------|-------|-------------|-------------|
|361.42|[Page](http://www.geforce.com.tw/drivers/results/101463)|[Download](http://tw.download.nvidia.com/XFree86/Linux-x86_64/361.42/NVIDIA-Linux-x86_64-361.42.run)|[Doc](http://goo.gl/EwsHjL)|
|361.28|[Page](http://www.geforce.com.tw/drivers/results/98416)|[Download](http://tw.download.nvidia.com/XFree86/Linux-x86_64/361.28/NVIDIA-Linux-x86_64-361.28.run)|[Doc](http://goo.gl/P52lj0)|
|352.79|[Page](http://www.geforce.com.tw/drivers/results/97671)|[Download](http://tw.download.nvidia.com/XFree86/Linux-x86_64/352.79/NVIDIA-Linux-x86_64-352.79.run)|[Doc](http://goo.gl/H4Q45K)|
|352.63|[Page](http://www.geforce.com.tw/drivers/results/95281)|[Download](http://tw.download.nvidia.com/XFree86/Linux-x86_64/352.63/NVIDIA-Linux-x86_64-352.63.run)|[Doc](http://goo.gl/DXeutI)|



##change tty resolution for nvidia graphic cards
	gedit /etc/default/grub
	GRUB_GFXMODE="640x480"
	GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nomodeset"
	sudo update-grub

##Hot key for move window to anyother screen(win7:shift+win+arrow)
![](https://raw.githubusercontent.com/scps950707/ubuntu-install/master/pic/5.png)

![](https://raw.githubusercontent.com/scps950707/ubuntu-install/master/pic/6.png)


##Reference
- [Fix time differences between Ubuntu and Windows](http://www.webupd8.org/2014/09/dual-boot-fix-time-differences-between.html)
- [How do I change the VGA resolution for the non-graphical TTYs](http://askubuntu.com/questions/96658/how-do-i-change-the-vga-resolution-for-the-non-graphical-ttys)
- [Ubuntu 15.10/15.04/14.10/14.04/…/12.04 安裝最新的 gcin 中文輸入的完整步驟](http://hyperrate.com/thread.php?tid=28044)
- [讓 Linux 下的中文輸入法更接近微軟新注音使用體驗](http://goodjack.blogspot.tw/2013/08/linux-phonetic-setting.html)
- [Quickly place a window to another screen using only the keyboard](http://askubuntu.com/questions/22207/quickly-place-a-window-to-another-screen-using-only-the-keyboard)

