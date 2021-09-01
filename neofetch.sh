rm_q() {
    q="$1"
    q1=${q//\"/}
    echo -e "${q1//\'/}"
}



OS_RELEASE_PATH="/etc/os-release"
OS_RELEASE_DATA=`cat $OS_RELEASE_PATH`
OS_PRETTY_NAME_VAR=`grep '^PRETTY_NAME' $OS_RELEASE_PATH`

OS_PRETTY_NAME="${OS_PRETTY_NAME_VAR//PRETTY_NAME=/}"
OS_PRETTY_NAME_VALUE=`rm_q $OS_PRETTY_NAME` #!

#########################################################


HOSTNAME_E=`cat /proc/sys/kernel/hostname` #!
KERNEL_VERSION=`uname -r` #!
SHELL_NAME=`echo -e "$SHELL"` #!

neofetch() {
    ASCII=`cat neofetch-ascii.txt`
    echo -e "$ASCII\n\n"
    echo -e "             \e[32mOS: \e[0m$OS_PRETTY_NAME_VALUE\n"
    echo -e "             \e[32mHostname: \e[0m$HOSTNAME_E\n"
    echo -e "             \e[32mShell: \e[0m$SHELL_NAME\n"
}

neofetch
