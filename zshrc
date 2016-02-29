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
  export EDITOR='vi'
else
  export EDITOR='vim'
fi

eval $(dircolors ~/.dircolors)
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

BROWSER=/usr/bin/inox
# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
alias rasp="ssh root@172.16.2.118"
alias wip="curl -s icanhazip.com"
alias fix0="configure.sh wlan0 managed"
alias fix1="configure.sh wlan1 managed"
alias pen0="configure.sh wlan0 monitor"
alias pen1="configure.sh wlan1 monitor"
alias pen2="configure.sh wlan2 monitor"

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

## Custom app shortcuts
alias df="df -h"
# Youtube single track audio download
alias youm="youtube-dl --no-playlist -x --write-all-thumbnails --audio-quality 0 -i -c $1"
# Youtube playlist audio download
alias yoump="youtube-dl --yes-playlist -x --write-all-thumbnails --audio-quality 0 -i -c $1"
# Optimizing PDF books for Kindle Paperwhite 2
alias kin="k2pdfopt $1 -dev kp2 -cmax 2 -s -g 0.5 -wt -1 -wrap+ -hy -ws -0.2"
# Wget with proper output file naming
alias wget="wget -c --content-disposition $1"

# Custom Functions that I use regularly
wkill() {systemctl stop NetworkManager.service; killall NetworkManager; killall wpa_supplicant; killall dhclient; rfkill block wifi all}
wnet() {netstat "-naultp"}
wmon() {nethogs "wlan0"}

Powersave() {wkill; killall thermald; thermald --exclusive-control; cpupower frequency-set -g powersave}

Lss() {livestreamer "$1" "source"}
Lsh() {livestreamer "$1" "high"}
Lsm() {livestreamer "$1" "medium"}


# Screencasting with ffmpeg 
# https://github.com/gotbletu/shownotes/blob/master/ffmpeg_x11grab_screencast.txt
#
FFX_MONO="1"		# mono
FFX_DUAL="2"		# dual channel
FFX_HW="hw:1,0" 	# alsa; run 'cat /proc/asound/pcm' to change to the correct numbers
FFX_PULSE="pulse" 	# pulseaudio; might have to install pavucontrol to change volume
FFX_FPS="30"		# frame per seconds
FFX_WIN_FULL=$(xwininfo -root | grep 'geometry' |awk '{print $2;}')	# record fullscreen
FFX_AUDIO="pcm_s16le"	# audio codec
FFX_VIDEO="libx264"	# video codec
FFX_PRESET="ultrafast"	# preset error? run 'x264 -h' replace with fast,superfast, slow ..etc
FFX_CRF="0"
FFX_THREADS="0"
FFX_SCALE="scale=1280:720"	# scale resolution, no black bars on sides of video on youtube
FFX_OUTPUT=~/Public/screencast/aa_screencast_baking.avi
# Note: -vf is optional delete if you want, -y is to overwrite existing file

# capture fullscreen using alsa or pulseaudio
ffx-full-hw() { ffmpeg -f alsa -ac $FFX_MONO \
	-i $FFX_HW -f x11grab -r $FFX_FPS -s $FFX_WIN_FULL -i :0.0 \
	-acodec $FFX_AUDIO -vcodec $FFX_VIDEO \
       	-preset $FFX_PRESET -crf $FFX_CRF -threads $FFX_THREADS \
	-vf $FFX_SCALE \
	-y $FFX_OUTPUT
}
ffx-full-pa() { ffmpeg -f alsa -ac $FFX_MONO \
	-i $FFX_PULSE -f x11grab -r $FFX_FPS -s $FFX_WIN_FULL -i :0.0 \
	-acodec $FFX_AUDIO -vcodec $FFX_VIDEO \
       	-preset $FFX_PRESET -crf $FFX_CRF -threads $FFX_THREADS \
	-vf $FFX_SCALE \
	-y $FFX_OUTPUT
}

# capture single window, use mouse cursor to select window you want to record
ffx-winselect-hw() { 
	FFX_INFO=$(xwininfo -frame)

	ffmpeg -f alsa -ac $FFX_MONO \
	-i $FFX_HW -f x11grab -r $FFX_FPS \
	-s $(echo $FFX_INFO | grep -oEe 'geometry [0-9]+x[0-9]+'\
	| grep -oEe '[0-9]+x[0-9]+') \
	-i :0.0+$(echo $FFX_INFO | grep -oEe 'Corners:\s+\+[0-9]+\+[0-9]+' \
	| grep -oEe '[0-9]+\+[0-9]+' | sed -e 's/\+/,/' ) \
	-acodec $FFX_AUDIO -vcodec $FFX_VIDEO \
       	-preset $FFX_PRESET -crf $FFX_CRF -threads $FFX_THREADS \
	-vf $FFX_SCALE \
	-y $FFX_OUTPUT
}
ffx-winselect-pa() { 
	FFX_INFO=$(xwininfo -frame)

	ffmpeg -f alsa -ac $FFX_MONO \
	-i $FFX_PULSE -f x11grab -r $FFX_FPS \
	-s $(echo $FFX_INFO | grep -oEe 'geometry [0-9]+x[0-9]+'\
	| grep -oEe '[0-9]+x[0-9]+') \
	-i :0.0+$(echo $FFX_INFO | grep -oEe 'Corners:\s+\+[0-9]+\+[0-9]+' \
	| grep -oEe '[0-9]+\+[0-9]+' | sed -e 's/\+/,/' ) \
	-acodec $FFX_AUDIO -vcodec $FFX_VIDEO \
       	-preset $FFX_PRESET -crf $FFX_CRF -threads $FFX_THREADS \
	-vf $FFX_SCALE \
	-y $FFX_OUTPUT
}


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


# Pyrit functions for WPA handshakes
# pirate [source] [destination] [BSSID]
pirate(){pyrit -r $1 -o $2 -b $3 strip}

# Reaver & Bully shortcuts
# Pix [bssid] [channel] [interface]
Pix(){bully -b $1 -c $2 -d $3}


ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
