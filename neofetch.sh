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


 echo -e "\e[33m Operating System:\e[0m $(uname -o)"  #OS
    echo -e "\e[33m Kernel Name:\e[0m $(uname -s)"  #Kernel
    echo -e "\e[33m Kernel Version:\e[0m $(uname -r)"  #Kernel
    echo -e "\e[33m Kernel Release:\e[0m $(uname -v)"  #Kernel
    echo -e "\e[33m Kernel Architecture:\e[0m $(uname -m)"  #Kernel
    echo -e "\e[33m\e[33m Machine Hardware Platform:\e[0m $(uname -i)"  # Machine Hardware Platform
    echo -e "\e[33m Processor Type:\e[0m $(uname -p)"  # Processor Type
    echo -e "\e[33m CPU:\e[0m $(grep "model name" /proc/cpuinfo | cut -d ' ' -f 3- | uniq)"  #CPU
    echo -e "\e[33m GPU:\e[0m $(lspci | grep VGA | cut -d ':' -f 3 | cut -d '[' -f 1 | sed 's/^ *//')" #GPU
    echo -e "\e[33m Memory:\e[0m $(free -h | awk '/^Mem/ {print $2 " total, " $3 " used"}')"  #Memory
    echo -e "\e[33m Disk Usage:\e[0m $(df -h / | awk 'NR==2 {print $3 " used, " $4 " free"}')"  #Disk Usage
    echo -e "\e[33m Second Hard Drive Usage:\e[0m $(df -h /dev/sda1 | awk 'NR==2 {print $3 " used, " $4 " free"}')"  #Disk Usage2
    echo -e "\e[33m Flash Disk:\e[0m $(df -h /dev/sda | awk 'NR==2 {print $3 " used, " $4 " free"}')"  #Disk Usage3
    echo -e "\e[33mClock/Time:\e[0m $(date +"%H:%M")" #time
    echo -e "\e[33m Mounted Drive/Drives:\e[0m" #mount drive
    mount | grep '^/dev/' | awk '{print $1 " mounted on " $3}'

neofetch() {
    ASCII=`cat neofetch-ascii.txt`
    echo -e "$ASCII\n\n"
   
}

neofetch
