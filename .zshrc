# zsh path
ZSH="$HOME/.oh-my-zsh"

# zsh plugins
plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    vi-mode
)

# zsh theme customoizotion
ZSH_THEME="omztheme"
source $ZSH/oh-my-zsh.sh
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
VI_MODE_CURSOR_NORMAL=2
VI_MODE_CURSOR_VISUAL=4
VI_MODE_CURSOR_INSERT=1
VI_MODE_CURSOR_OPPEND=3
MODE_INDICATOR="%B%F{red}<%b<%f "
INSERT_MODE_INDICATOR=""
RPROMPT="\$(vi_mode_prompt_info)$RPROMPT"
precmd() { print "" }

# aliases akas whatnots
alias lsn='ls -lah --group-directories-first'
alias ncdu='ncdu --color dark'
alias clear-trash='rm -rf ~/.local/share/Trash/*'
alias clear-cache='rm -rf ~/.cache/*'
# - nmcli aliases
alias wifi-gen="nmcli general"
alias wifi-dev-stat="nmcli dev status"
alias wifi-info="nmcli dev show"
alias wifi-which="nmcli dev wifi show | grep SSID"
alias wifi-show="nmcli dev wifi show"
alias wifi-list="nmcli device wifi list"
alias wifi-scan="nmcli device wifi rescan"
alias wifi-scan-n-list="wifi-scan && wifi-list"
alias wifi-list-prev-con="nmcli connection show"
alias wifi-con="sudo nmcli device wifi --ask connect";
alias wifi-discon="nmcli device disconnect wlp0s20f3"
alias wifi-forget="nmcli connection delete"
alias wifi-off="nmcli radio wifi off"
alias wifi-on="nmcli radio wifi on"
alias hotspot-on='nmcli device wifi hotspot ssid "pineapple-hotspot" password'
alias hotspot-on-prev-password='nmcli device wifi hotspot ssid "pineapple-hotspot"'
# - mount aliases
alias mount-fa="sudo mount -o gid=100,umask=002"
alias mount-window="mount-fa /dev/nvme0n1p3 /mnt/window"
alias mount-shared="mount-fa /dev/nvme0n1p6 /mnt/shared"
# - battery
alias bat-stat="sudo tlp-stat -b"

# variables for quick access to frequently used folders !!
export WINDOW='/mnt/window'
export SHARED='/mnt/shared'
export CODE='/mnt/shared/CODE'
export BOOKS='/mnt/shared/books'
export SCHOOL='/mnt/shared/school'
export IPOD='/mnt/ipodPINEAPPLE'
export TRASH='/home/pineapple/.local/share/Trash'

# add local binaries to PATH
export PATH="$HOME/.local/bin:$PATH"

# add my stuff to PATH
export PATH="$HOME/.local/bin/my_stuff:$PATH"

# add doom emacs commands to path
export PATH="$HOME/.emacs.d/bin:$PATH"

# set emacs as editor 
export EDITOR=emacsc
export VISUAL=emacsc

# android stuff
export ANDROID_SDK_ROOT="/mnt/shared/dev/android" 
export ANDROID_HOME="/mnt/shared/dev/android/sdk"
# add android cli sdk tools to path
export PATH="$HOME/programs/android-studio/cmdline-tools/bin:$PATH"

eval $(dircolors ~/.dircolors)


echo 
echo " ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
echo " ░█▀█░▀█▀░█▀█░█▀▀░█▀█░█▀█░█▀█░█░░░█▀▀░"
echo " ░█▀▀░░█░░█░█░█▀▀░█▀█░█▀▀░█▀▀░█░░░█▀▀░"
echo " ░▀░░░▀▀▀░▀░▀░▀▀▀░▀░▀░▀░░░▀░░░▀▀▀░▀▀▀░"
echo " ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
