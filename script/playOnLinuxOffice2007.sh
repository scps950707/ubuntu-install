#!/bin/bash
[ "$PLAYONLINUX" = "" ] && exit 0
source "$PLAYONLINUX/lib/sources"

TITLE="Microsoft Office 2007"
PREFIXNAME="Office2007"

POL_Debug_Init
POL_SetupWindow_Init
POL_SetupWindow_presentation "$TITLE" "Microsoft" "http://www.microsoft.com/" "scps950707" "$PREFIXNAME"

POL_System_SetArch "x86"

POL_Wine_SelectPrefix "$PREFIXNAME"
POL_Wine_PrefixCreate "1.9.24"

cd "$POL_USER_ROOT/tmp"

POL_SetupWindow_cdrom
POL_SetupWindow_check_cdrom "setup.exe"

POL_Wine_WaitBefore "$TITLE"
POL_Wine "$CDROM/setup.exe"

POL_Wine_OverrideDLL native,builtin riched20

POL_Shortcut "WINWORD.EXE" "Microsoft Word 2007"
POL_Shortcut "EXCEL.EXE" "Microsoft Excel 2007"
POL_Shortcut "POWERPNT.EXE" "Microsoft Powerpoint 2007"

POL_SetupWindow_Close
exit
