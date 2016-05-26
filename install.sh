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
        aptget 'install apt-get' \
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

main
