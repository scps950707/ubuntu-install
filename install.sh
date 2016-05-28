#!/bin/bash

show_error(){
echo -e "\033[1;31m$@\033[m" 1>&2
}
show_info(){
echo -e "\033[1;32m$@\033[0m"
}
show_warning(){
echo -e "\033[1;33m$@\033[0m"
}
show_question(){
echo -e "\033[1;34m$@\033[0m"
}
show_success(){
echo -e "\033[1;35m$@\033[0m"
}
show_header(){
echo -e "\033[1;36m$@\033[0m"
}
show_listitem(){
echo -e "\033[0;37m$@\033[0m"
}

# Main
function main {
    eval `resize`
    MAIN=$(whiptail \
        --notags \
        --title "Ubuntu Install Script" \
        --menu "\nWhat would you like to do?" \
        --cancel-button "Quit" \
        $LINES $COLUMNS $(( $LINES - 12 )) \
        aptget 'install aptPackages' \
        settings 'settings setup' \
        3>&1 1>&2 2>&3)
    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        clear && $MAIN
    else
        clear && quit
    fi
}

function quit {
    if (whiptail --title "Quit" --yesno "Are you sure you want quit?" 10 60) then
      exit 0
    else
      clear && main
    fi
}

function aptget {
  show_warning 'Requires root privileges'
  sudo apt-get -y install $(cat aptPackage)
  clear && main
}

function settings {
	# brightness and lock
  show_warning 'Requires root privileges'
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
  clear && main
}

main
