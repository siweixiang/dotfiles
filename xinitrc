eval $(gnome-keyring-daemon --components=pkcs11,secrets,ssh,gpg)
export GNOME_KEYRING_PID
export GNOME_KEYRING_SOCKET
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
xset r rate 200 30
xbacklight -set 5
export PATH="${PATH}:$HOME/.local/bin/"
urxvtd -q -o -f
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec i3
