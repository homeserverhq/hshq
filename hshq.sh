#!/bin/bash
HSHQ_WRAPPER_SCRIPT_VERSION=17
# Copyright (C) 2023 HomeServerHQ <drdoug@homeserverhq.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

set -e

function main()
{
  IS_DISABLE_UPDATE_CHECKS=false
  MENU_WIDTH=85
  MENU_HEIGHT=25
  MENU_INT_HEIGHT=10
  export NEWT_COLORS='
  root=,black
  window=white,blue
  title=white,blue
  border=white,blue
  textbox=white,blue
  acttextbox=black,yellow
  listbox=white,blue
  sellistbox=black,yellow
  actlistbox=black,yellow
  actsellistbox=black,yellow
  button=black,yellow
  actbutton=black,yellow
  compactbutton=white,blue
  checkbox=white,blue
  actcheckbox=black,yellow
  '
  USERNAME=$(id -u -n)
  if [ -f $HOME/hshq/hshq.dev ]; then
    HSHQ_LIB_URL=https://homeserverhq.com/hshqlib-dev.sh
    HSHQ_LIB_VER_URL=https://homeserverhq.com/getversion-dev
  elif [ -f $HOME/hshq/hshq.test ]; then
    HSHQ_LIB_URL=https://homeserverhq.com/hshqlib-test.sh
    HSHQ_LIB_VER_URL=https://homeserverhq.com/getversion-test
  else
    HSHQ_LIB_URL=https://homeserverhq.com/hshqlib.sh
    HSHQ_LIB_VER_URL=https://homeserverhq.com/getversion
  fi
  HSHQ_WRAP_URL=https://homeserverhq.com/hshq.sh
  HSHQ_WRAP_VER_URL=https://homeserverhq.com/getwrapversion
  HSHQ_RELEASES_URL=https://homeserverhq.com/releases
  HSHQ_SIG_BASE_URL=https://homeserverhq.com/signatures/
  HSHQ_GPG_FINGERPRINT=5B9C33067C71ABCFCE1ACF8A7F46128ABB7C1E42
  HSHQ_GPG_FINGERPRINT_SHORT=7F46128ABB7C1E42
  HSHQ_BASE_DIR=$HOME/hshq
  HSHQ_DATA_DIR=$HSHQ_BASE_DIR/data
  HSHQ_LIB_DIR=$HSHQ_DATA_DIR/lib
  HSHQ_LIB_SCRIPT=$HSHQ_LIB_DIR/hshqlib.sh
  HSHQ_LIB_TMP=$HOME/hshqlib.tmp
  HSHQ_WRAP_SCRIPT=$0
  HSHQ_WRAP_TMP=$HOME/hshqwrap.tmp
  MIN_REQUIRED_LIB_VERSION=28

  logo=$(cat << EOF

        #===============================================================#
        # ▀█  █  ▄▄  ▄▄ ▄▄ ▄▄▄ █▀▀▀█ ▄▄▄ ▄▄▄  ▄   ▄ ▄▄▄ ▄▄▄  █  █ █▀▀█  #
        #  █▀▀█ █  █ █ █ █ ▄▄  ▀▀▀▄▄ ▄▄  ▄▄▄▀ ▀▄ ▄▀ ▄▄  ▄▄▄▀ █▀▀█ █  █  #
        #  █  █ ▀▄▄▀ █   █ ▄▄▄ █▄▄▄█ ▄▄▄ ▄▄▄▄  ▀█▀  ▄▄▄ ▄▄▄▄ █  █ █▄▄█▄ #
        #===============================================================#
       HomeServerHQ Installation and Management Utility
       Copyright (C) 2023 HomeServerHQ <drdoug@homeserverhq.com>
       Licensed under GNU General Public License Version 3
EOF
  )

  while getopts ':a:p:s' opt; do
    case "$opt" in
      a)
        CONNECTING_IP="$OPTARG" ;;
      p)
        USER_SUDO_PW="$OPTARG" ;;
      s)
        is_skip_confirm=true ;;
      ?|h)
        echo "Usage: $(basename $0) [-a arg]"
        exit 1 ;;
    esac
  done
  shift "$(($OPTIND -1))"

  set +e
  is_dpkg_config=false
  if [[ "$(isProgramInstalled sudo)" = "false" ]]; then
    if ! [ "$USERNAME" = "root" ]; then
      echo -e "\n\n================================================================================"
      echo -e "The command, sudo, is not installed, and you are currently logged in"
      echo -e "as a non-root user. You must perform the following steps to continue:\n"
      echo -e "  1) Switch to the root user: 'su -'"
      echo -e "  2) Install sudo: 'apt update && apt install sudo -y'"
      echo -e "  3) Add your user to the sudoers group: 'usermod -aG sudo $USERNAME'"
      echo -e "  4) Exit the terminal session entirely: 'exit', then 'exit' again"
      echo -e "  5) Log back in and re-run this script: 'bash hshq.sh'"
      echo -e "\nTo copy these instructions, simply select the text with your mouse,"
      echo -e "and it will automatically be copied to the clipboard."
      echo -e "================================================================================"
      exit 2
    fi
    echo "Installing sudo, please wait..."
    DEBIAN_FRONTEND=noninteractive apt update
    sudo dpkg --configure -a
    is_dpkg_config=true
    DEBIAN_FRONTEND=noninteractive apt install -y -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' sudo > /dev/null 2>&1
  fi
  # Underscores in hostname have shown to be problematic...
  hostname | grep "_" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    cur_hostname=$(hostname)
    new_hostname=$(echo $cur_hostname | sed 's|_|-|g')
    sudo hostnamectl set-hostname $new_hostname
  fi
  if [ "$(cat /etc/hosts | grep $(cat /etc/hostname))" = "" ]; then
    echo "127.0.1.1 $(hostname)" | sudo tee -a /etc/hosts
  fi
  rm -f $HOME/dead.letter
  # Also check if config directory exists, so that we don't perpetually remove needrestart. The user may have added it back.
  if [[ "$(isProgramInstalled needrestart)" = "true" ]] && ! [ -d $HSHQ_DATA_DIR/config ]; then
    checkPromptUserPW
    echo "Removing needrestart, please wait..."
    sudo sed -i "s/#\$nrconf{kernelhints} = -1;/\$nrconf{kernelhints} = -1;/g" /etc/needrestart/needrestart.conf
    sudo DEBIAN_FRONTEND=noninteractive apt remove -y needrestart > /dev/null 2>&1
  fi
  if [[ "$(isProgramInstalled wget)" = "false" ]]; then
    checkPromptUserPW
    echo "Installing wget, please wait..."
    sudo DEBIAN_FRONTEND=noninteractive apt update
    if [ "$is_dpkg_config" = "false" ]; then
      sudo dpkg --configure -a
      is_dpkg_config=true
    fi
    performAptInstall wget > /dev/null 2>&1
  fi
  if [[ "$(isProgramInstalled curl)" = "false" ]]; then
    checkPromptUserPW
    echo "Installing curl, please wait..."
    sudo DEBIAN_FRONTEND=noninteractive apt update
    if [ "$is_dpkg_config" = "false" ]; then
      sudo dpkg --configure -a
      is_dpkg_config=true
    fi
    performAptInstall curl > /dev/null 2>&1
  fi
  if [[ "$(isProgramInstalled whiptail)" = "false" ]]; then
    checkPromptUserPW
    echo "Installing whiptail, please wait..."
    sudo DEBIAN_FRONTEND=noninteractive apt update
    if [ "$is_dpkg_config" = "false" ]; then
      sudo dpkg --configure -a
      is_dpkg_config=true
    fi
    performAptInstall whiptail > /dev/null 2>&1
  fi
  if [[ "$(isProgramInstalled gpg)" = "false" ]]; then
    checkPromptUserPW
    echo "Installing gnupg, please wait..."
    sudo DEBIAN_FRONTEND=noninteractive apt update
    if [ "$is_dpkg_config" = "false" ]; then
      sudo dpkg --configure -a
      is_dpkg_config=true
    fi
    performAptInstall gnupg > /dev/null 2>&1
  fi
  set -e

  initMenu=$(cat << EOF
$logo



                           Do you wish to continue?

EOF
  )
  if [ -z $is_skip_confirm ]; then
    if ! (whiptail --title "HomeServerHQ" --yesno "$initMenu" $MENU_HEIGHT $MENU_WIDTH); then
      exit 1
    fi
  fi
  if [ -z $CONNECTING_IP ]; then
    CONNECTING_IP=$(getConnectingIPAddress)
  fi
  ciparg=""
  if ! [ -z $CONNECTING_IP ]; then
    ciparg="-a $CONNECTING_IP"
  fi

  if [ "$USERNAME" = "root" ]; then
    showYesNoMessageBox "Non-Root" "You are running this script as root. You must run this from a non-root user account. Do you wish to create one now?"
    mbres=$?
    if [ $mbres -eq 0 ]; then
      LINUX_USERNAME=""
      is_use_existing=false
      while [ -z "$LINUX_USERNAME" ]
      do
        LINUX_USERNAME=$(promptUserInputMenu "" "Enter Username" "Enter your desired username: ")
        if [ $(checkValidString "$LINUX_USERNAME") = "false" ]; then
          showMessageBox "Invalid Character(s)" "The username contains invalid character(s). It must consist of a-z (lowercase) and/or 0-9"
          LINUX_USERNAME=""
        fi
        set +e
        getent passwd | grep $LINUX_USERNAME
        if [ $? -eq 0 ]; then
          showYesNoMessageBox "User Exists" "The username already exists, do you want to switch to this user rather than creating a new user?"
          if [ $? -eq 0 ]; then
            is_use_existing=true
          else
            LINUX_USERNAME=""
          fi
        fi
        set -e
      done
      tmp_pw1=""
      if [ "$is_use_existing" = "false" ]; then
        tmp_pw1=1
        tmp_pw2=2
        while ! [ "$tmp_pw1" = "$tmp_pw2" ]
        do
          tmp_pw1=$(promptPasswordMenu "Enter Password" "Enter the password for your user ($LINUX_USERNAME) account: ")
          tmp_pw2=$(promptPasswordMenu "Confirm Password" "Enter the password again to confirm: ")
          if ! [ "$tmp_pw1" = "$tmp_pw2" ]; then
            showMessageBox "Password Mismatch" "The passwords do not match, please try again."
            continue
          fi
          if [ $(checkValidPassword "$tmp_pw1" 8) = "false" ]; then
            showMessageBox "Weak Password" "The password is invalid or is too weak. It must contain at least 8 characters and consist of uppercase letters, lowercase letters, and numbers. No spaces or dollar sign ($)."
            tmp_pw1=1
            tmp_pw2=2
            continue
          fi
        done
        # Capture and pass the user password to the self-referenced function call below.
        # This change was implemented on version 10 of the wrapper (hshq.sh), and 
        # version 68 of the lib (hshqlib.sh), in order to speed up the installation
        # process and eliminate duplicate prompting.
        pwarg="-p $tmp_pw1"
        pw_hash=$(openssl passwd -6 $tmp_pw1)
        tmp_pw1=""
        tmp_pw2=""
        useradd -m -G sudo -p $pw_hash -s /bin/bash $LINUX_USERNAME
        set +e
        getent group docker >/dev/null || sudo groupadd docker
        set -e
        usermod -aG docker $LINUX_USERNAME
        showMessageBox "New User Created" "New user ($LINUX_USERNAME) has been created. This script has been moved into this user's home directory, i.e. /home/$LINUX_USERNAME."
      fi
      chown ${LINUX_USERNAME}:${LINUX_USERNAME} $0
      mv $0 /home/$LINUX_USERNAME/
      sudo -u $LINUX_USERNAME bash /home/$LINUX_USERNAME/$(basename $0) -s $ciparg $pwarg
    fi
    exit 1
  fi
  set +e
  id -nG | grep docker > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    checkPromptUserPW
    getent group docker >/dev/null || sudo groupadd docker
    sudo usermod -aG docker $USERNAME
    if ! [ -z "$USER_SUDO_PW" ]; then
      pwarg="-p $USER_SUDO_PW"
    fi
    sudo -u $USERNAME bash $0 -s $ciparg $pwarg
    exit 0
  fi
  if ! [ -d $HSHQ_LIB_DIR ]; then
    mkdir -p $HSHQ_BASE_DIR $HSHQ_DATA_DIR $HSHQ_LIB_DIR
  fi

  is_download_lib=false
  checkDownloadGPGKey
  checkDownloadWrapper
  checkDownloadLib

  hshq_lib_local_version=$(sed -n 2p $HSHQ_LIB_SCRIPT | cut -d"=" -f2)
  if [ $hshq_lib_local_version -lt $MIN_REQUIRED_LIB_VERSION ]; then
    showMessageBox "Min Version Required" "You must have at least Version $MIN_REQUIRED_LIB_VERSION of the lib script to continue. Please update to the most recent version. Exiting..."
    exit 1
  fi
  bash $HSHQ_LIB_SCRIPT run "$is_download_lib" "$CONNECTING_IP" "$USER_SUDO_PW"
}

function checkDownloadGPGKey()
{
  gpg --list-keys $HSHQ_GPG_FINGERPRINT > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo "Obtaining HomeServerHQ Public GPG Key..."
    curl -s https://homeserverhq.com/hshq.asc | gpg --import > /dev/null 2>&1
  fi
  gpg --list-keys $HSHQ_GPG_FINGERPRINT > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    showMessageBox "GPG Key Error" "There was an error obtaining HomeServerHQ's Public GPG Key, exiting..."
    exit 1
  fi
}

function checkDownloadWrapper()
{
  if [ "$IS_DISABLE_UPDATE_CHECKS" = "true" ]; then
    return
  fi
  hshq_wrap_latest_version=$(curl --connect-timeout 5 --silent $HSHQ_WRAP_VER_URL)
  if [ $? -ne 0 ] || [ -z $hshq_wrap_latest_version ]; then
    echo "Could not get latest wrapper version, proceeding with local version..."
    rm -f $HSHQ_LIB_TMP
    return
  fi
  hshq_wrap_local_version=$(sed -n 2p $HSHQ_WRAP_SCRIPT | cut -d"=" -f2)
  if [ $hshq_wrap_local_version -lt $hshq_wrap_latest_version ]; then
    wget -q4 -O $HSHQ_WRAP_TMP $HSHQ_WRAP_URL
    if [ $? -ne 0 ]; then
      rm -f $HSHQ_WRAP_TMP
      rm -f $HSHQ_LIB_TMP
      if [ -f $HSHQ_WRAP_SCRIPT ]; then
        showMessageBox "Download Error" "There was an error obtaining the latest wrapper version, proceeding with local version..."
      else
        showMessageBox "Download Error" "There was an error obtaining the required wrapper. Please try again later."
        exit 1
      fi
      return
    fi
  else
    # No update needed
    return
  fi
  hshq_wrap_dl_version=$(sed -n 2p $HSHQ_WRAP_TMP | cut -d"=" -f2)
  echo "Obtained Wrapper Version $hshq_wrap_dl_version"
  wget -q4 -O $HOME/wrap-${hshq_wrap_dl_version}.sig $HSHQ_SIG_BASE_URL/wrap-${hshq_wrap_dl_version}.sig
  if [ $? -eq 0 ]; then
    echo "Signature downloaded (wrap-${hshq_wrap_dl_version}.sig)..."
  else
    rm -f $HOME/wrap-${hshq_wrap_dl_version}.sig
    rm -f $HSHQ_WRAP_TMP
    if [ -f $HSHQ_LIB_SCRIPT ]; then
      showMessageBox "Download Error" "There was an error obtaining the wrapper signature, proceeding with local version..."
    else
      showMessageBox "Download Error" "There was an error obtaining the wrapper signature. Please try again later."
      exit 1
    fi
    return
  fi
  echo "Verifying wrap with signature..."
  verifyFile $HSHQ_WRAP_TMP $HOME/wrap-${hshq_wrap_dl_version}.sig
  ver_res=$?
  rm -f $HOME/wrap-${hshq_wrap_dl_version}.sig
  if [ $ver_res -ne 0 ]; then
   # Not verified, raise the red flag
    rm -f $HSHQ_WRAP_TMP
    rm -f $HSHQ_LIB_TMP
    echo "@@@@@@@@@@@@@@@@@@@@@@@  SECURITY ALERT  @@@@@@@@@@@@@@@@@@@@@@@"
    echo " There was a verification error on the latest wrapper version (${hshq_wrap_dl_version}). "
    echo "   Please email security@homeserverhq.com as soon as possible.  "
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    if [ -f $HSHQ_LIB_SCRIPT ]; then
      showMessageBox "Security Alert" "@@@@@@@@@@@@@@@@@@@@@@@  SECURITY ALERT  @@@@@@@@@@@@@@@@@@@@@@@\n        There was a verification error on the latest wrapper version (${hshq_wrap_dl_version}). \n          Please email security@homeserverhq.com as soon as possible.  \n       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n\n       Proceeding safely with local version..."
    else
      showMessageBox "Security Alert" "@@@@@@@@@@@@@@@@@@@@@@@  SECURITY ALERT  @@@@@@@@@@@@@@@@@@@@@@@\n           There was a verification error on the downloaded script.    \n          Please email security@homeserverhq.com as soon as possible.  \n       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n\n       Exiting..."
      exit 1
    fi
    return
  fi
  # Verified
  rm -f $HSHQ_WRAP_SCRIPT
  mv $HSHQ_WRAP_TMP $HSHQ_WRAP_SCRIPT
  # Show message box
  showMessageBox "Wrapper Script Updated" "The wrapper script was updated. You will have to restart the script (bash hshq.sh). Exiting..."
  exit
}

function checkDownloadLib()
{
  if [ "$IS_DISABLE_UPDATE_CHECKS" = "true" ]; then
    return
  fi
  if [ -f $HSHQ_LIB_SCRIPT ]; then
    hshq_lib_latest_version=$(curl --connect-timeout 5 --silent $HSHQ_LIB_VER_URL)
    if [ $? -eq 0 ] && ! [ -z $hshq_lib_latest_version ]; then
      hshq_lib_local_version=$(sed -n 2p $HSHQ_LIB_SCRIPT | cut -d"=" -f2)
      if [ $hshq_lib_local_version -lt $hshq_lib_latest_version ]; then
        updateMenu=$(cat << EOF
$logo


           There is a more updated version of the software (Version $hshq_lib_latest_version).
      See release info at $HSHQ_RELEASES_URL for more details.

                  Do you want to obtain this latest version?
 
EOF
        )
        if ! (whiptail --title "HomeServerHQ" --yesno "$updateMenu" $MENU_HEIGHT $MENU_WIDTH); then
          return
        fi
      else
        # No updated needed
        return
      fi
    else
      echo "Could not get latest lib version, proceeding with local version..."
      return
    fi
  fi
  echo "Downloading latest version..."
  wget -q4 -O $HSHQ_LIB_TMP $HSHQ_LIB_URL
  if [ $? -ne 0 ]; then
    rm -f $HSHQ_LIB_TMP
    if [ -f $HSHQ_LIB_SCRIPT ]; then
      showMessageBox "Download Error" "There was an error obtaining the latest lib version, proceeding with local version..."
    else
      showMessageBox "Download Error" "There was an error obtaining the required lib. Please try again later."
      exit 1
    fi
    return
  fi
  hshq_lib_dl_version=$(sed -n 2p $HSHQ_LIB_TMP | cut -d"=" -f2)
  echo "Obtained Library Version $hshq_lib_dl_version"
  wget -q4 -O $HOME/lib-${hshq_lib_dl_version}.sig $HSHQ_SIG_BASE_URL/lib-${hshq_lib_dl_version}.sig
  if [ $? -ne 0 ]; then
    rm -f $HOME/lib-${hshq_lib_dl_version}.sig
    rm -f $HSHQ_LIB_TMP
    if [ -f $HSHQ_LIB_SCRIPT ]; then
      showMessageBox "Download Error" "There was an error obtaining the lib signature, proceeding with local version..."
    else
      showMessageBox "Download Error" "There was an error obtaining the lib signature. Please try again later."
      exit 1
    fi
    return
  fi
  echo "Signature downloaded (lib-${hshq_lib_dl_version}.sig)..."
  echo "Verifying lib with signature..."
  verifyFile $HSHQ_LIB_TMP $HOME/lib-${hshq_lib_dl_version}.sig
  ver_res=$?
  rm -f $HOME/lib-${hshq_lib_dl_version}.sig
  if [ $ver_res -ne 0 ]; then
    # Not verified, raise the red flag
    is_download_wrap=false
    rm -f $HSHQ_WRAP_TMP
    rm -f $HOME/wrap-${hshq_wrap_dl_version}.sig
    rm -f $HSHQ_LIB_TMP
    echo "@@@@@@@@@@@@@@@@@@@@@@@  SECURITY ALERT  @@@@@@@@@@@@@@@@@@@@@@@"
    echo " There was a verification error on the latest lib version(${hshq_lib_dl_version})."
    echo "   Please email security@homeserverhq.com as soon as possible.  "
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    if [ -f $HSHQ_LIB_SCRIPT ]; then
      showMessageBox "Security Alert" "@@@@@@@@@@@@@@@@@@@@@@@  SECURITY ALERT  @@@@@@@@@@@@@@@@@@@@@@@\n        There was a verification error on the latest lib version(${hshq_lib_dl_version}).\n          Please email security@homeserverhq.com as soon as possible.  \n       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n\n       Proceeding safely with local version..."
    else
      showMessageBox "Security Alert" "@@@@@@@@@@@@@@@@@@@@@@@  SECURITY ALERT  @@@@@@@@@@@@@@@@@@@@@@@\n           There was a verification error on the downloaded script.    \n          Please email security@homeserverhq.com as soon as possible.  \n       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n\n       Exiting..."
      exit 1
    fi
    return
  fi
  # Verified
  echo "Source code verified!"
  rm -f $HSHQ_LIB_SCRIPT
  mv $HSHQ_LIB_TMP $HSHQ_LIB_SCRIPT
  is_download_lib=true
}

function verifyFile()
{
  # Perform 3 checks:
  # 1 - Verify the file
  # 2 - Ensure the verification process used the correct key
  # 3 - Ensure the output contains "Good signature" (This step is likely redundant, but whatever...)
  src_file=$1
  sig_file=$2
  gpg --verify $sig_file $src_file >/dev/null 2>/tmp/verify
  ver_res=$?
  if [ $ver_res -ne 0 ]; then
    rm -f /tmp/verify
    return $ver_res
  fi
  grep $HSHQ_GPG_FINGERPRINT /tmp/verify > /dev/null 2>&1
  ver_res=$?
  if [ $ver_res -ne 0 ]; then
    rm -f /tmp/verify
    return $ver_res
  fi
  grep "Good signature" /tmp/verify > /dev/null 2>&1
  ver_res=$ver_res
  if [ $? -ne 0 ]; then
    rm -f /tmp/verify
    return $ver_res
  fi
  rm -f /tmp/verify
}

function performAptInstall()
{
  sudo DEBIAN_FRONTEND=noninteractive apt install -y -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' $1
}

function isProgramInstalled()
{
  bin_name=$(echo $1 | cut -d"|" -f1)
  lib_name=$(echo $1 | cut -d"|" -f2)
  if [[ -z $(which ${bin_name}) ]]; then
    echo "false"
  else
    echo "true"
  fi
}

function getConnectingIPAddress()
{
  echo $(echo $SSH_CLIENT | xargs | cut -d" " -f1)
}

function showMessageBox()
{
  msgmenu=$(cat << EOF

$logo


       $2
EOF
  )
  whiptail --title "$1" --msgbox "$msgmenu" $MENU_HEIGHT $MENU_WIDTH
}

function showYesNoMessageBox()
{
  msgmenu=$(cat << EOF

$logo

$2
EOF
  )
  whiptail --title "$1" --yesno "$msgmenu" $MENU_HEIGHT $MENU_WIDTH
}

function promptUserInputMenu()
{
  usermenu=$(cat << EOF

$logo

$3
EOF
  )
  menures=$(whiptail --title "$2" --inputbox "$usermenu" $MENU_HEIGHT $MENU_WIDTH "$1" 3>&1 1>&2 2>&3)
  if [ $? -ne 0 ]; then
    exit 1
  fi
  echo "$menures"
}

function promptPasswordMenu()
{
  usermenu=$(cat << EOF

$logo

$2
EOF
  )
  menures=$(whiptail --title "$1" --passwordbox "$usermenu" $MENU_HEIGHT $MENU_WIDTH 3>&1 1>&2 2>&3)
  if [ $? -ne 0 ]; then
    exit 1
  fi
  echo "$menures"
}

function checkPromptUserPW()
{
  if ! [ "$USERNAME" = "root" ]; then
    while [ -z "$USER_SUDO_PW" ]
    do
      USER_SUDO_PW=$(promptPasswordMenu "Enter Password" "Enter your current sudo password (This is only used for the installation process to eliminate duplicate prompting): ")
      retVal=$?
      if [ $retVal -ne 0 ]; then
        exit 3
      fi
      echo "$USER_SUDO_PW" | sudo -S -v -p "" > /dev/null 2>&1
      if [ $? -ne 0 ]; then
        showMessageBox "Incorrect Password" "The password is incorrect, please re-enter it."
        USER_SUDO_PW=""
        continue
      fi
    done
  fi
}

function checkValidString()
{
  check_string=$1
  addchars=$2
  if [[ $check_string =~ ^[0-9a-z$addchars]+$ ]]; then
    echo "true"
  else
    echo "false"
  fi
}

function checkValidPassword()
{
  pw_in="$1"
  min_length=$2
  pw_length=${#pw_in}
  if ! [[ "$pw_in" =~ [[:upper:]] ]]; then
    # Does not contain upper case.
    echo "false"
  elif ! [[ "$pw_in" =~ [[:lower:]] ]]; then
    # Does not contain lower case.
    echo "false"
  elif ! [[ "$pw_in" =~ [0-9] ]]; then
    # Does not contain number.
    echo "false"
  elif [[ "$pw_in" =~ [[:space:]] ]]; then
    # Contains a space.
    echo "false"
  elif [[ "$pw_in" =~ '$' ]]; then
    # Contains a dollar sign.
    echo "false"
  elif [ $pw_length -lt $min_length ]; then
    # Less than min characters
    echo "false"
  else
    echo "true"
  fi
}

main "$@"
