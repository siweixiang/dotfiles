# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh/

ZSH_THEME="clean"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git)

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

eval $(dircolors ~/.dircolors)
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias wip="dig +short myip.opendns.com @resolver1.opendns.com"
alias fix0="configure.sh wlan0 managed"
alias fix1="configure.sh wlan1 managed"
alias pen0="configure.sh wlan0 monitor"
alias pen1="configure.sh wlan1 monitor"

# Pacman & Yaourt shortcuts 
alias pacu="pacman -Syyu --noconfirm"
alias pacs="pacman -sS $1"
alias paci="pacman -S $1"
alias pacif="pacman -S $1 --noconfirm"
alias pacr="pacman -R $1"
alias pacrf="pacman -R $1 --noconfirm"
alias yaou="yaourt -Syyu --noconfirm"
alias yaos="yaourt -sS $1"
alias yaoi="yaourt -S $1"
alias yaoif="yaourt -S $1 --noconfirm"
alias yaor="yaourt -R $1 --noconfirm"


# Custom Functions that I use regularly
wkill() {systemctl stop NetworkManager.service; killall NetworkManager; killall wpa_supplicant; killall dhclient; rfkill block wifi all}
wnet() {netstat "-naultp"}
wmon() {nethogs "wlan0"}

Powersave() {wkill; killall thermald; thermald --exclusive-control; cpupower frequency-set -g powersave}

Lss() {livestreamer "$1" "source"}
Lsh() {livestreamer "$1" "high"}
Lsm() {livestreamer "$1" "medium"}

# Note taking app
n() {
  if [ "$1" = "today" ];
  then
    $EDITOR ~/notes/`date +%y%m%d`
  else
    $EDITOR ~/notes/"$*"
  fi
}
nls() {
  ls -c ~/notes/ | grep "$*"
}
ns() {
	egrep -RHi "$*" ~/notes/*
}
nrd() {
  cat ~/notes/"$*"
}
nwr() {
  $EDITOR ~/notes/"$*"
}


ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
