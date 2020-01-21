# Set personal aliases, overriding those provided by oh-my-zsh libs,
#
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# Custom aliases to make my life a bit easier
#
#
#Work aliases
alias work-desktop='xrandr --output eDP-1 --primary --auto --output DP-1 --above eDP-1 --auto'
alias offtouch="xinput --disable  'DLL07BE:01 06CB:7A13 Touchpad'"
alias ontouch="xinput --enable  'DLL07BE:01 06CB:7A13 Touchpad'"
alias spe='cd /home/marcus/dewire/supernova-payment-engine-dev/'
alias appm='cd /home/marcus/dewire/appmarket'
alias appmarket='appm'
alias dc='docker-compose'
alias dcb='docker-compose build && docker-compose down && docker-compose up'
alias dcu='docker-compose up'
alias dcr='docker-compose run --publish=4000:4000 --publish=5000:5000 --rm spe-application -i'
alias dca="docker-compose run --rm spe-application -c 'spe-init-database && spe-unit-tests && spe-system-tests && spe-postman-tests'"

alias dbash-core="docker exec -it supernova-payment-engine-dev_spe-application_1 bash"
alias dbash-arvato="docker exec -it supernova-payment-engine-dev_spe-arvato-pm_1 bash"
alias dbash-trustly="docker exec -it supernova-payment-engine-dev_spe-trustly-pm_1 bash"
alias dbash-swish="docker exec -it supernova-payment-engine-dev_spe-swish-pm_1 bash"
alias dbash-nordea="docker exec -it supernova-payment-engine-dev_spe-nordea-pm_1 bash"
alias dbash-database="docker exec -it supernova-payment-engine-dev_spe-database_1 bash"



#General aliases
alias clr='clear'
alias today='subl /home/marcus/dewire/notes/today'
alias 3tap='synclient TapButton3=2'
alias sinstall='sudo apt install'
alias lock='gnome-screensaver-command -l'
#
#Aliases for programs
alias s='subl'
alias chrome='google-chrome'
alias insecure-chrome='google-chrome --disable-web-security --user-data-dir="/home/marcus/.config/google-chrome/Default"'
alias chromium-insecure='chromium-browser --disable-web-security --user-data-dir="/home/marcus/chromium-data"' 
alias image='eog'
alias dxball='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/DX-ball'
alias pinball='wine .wine/drive_c/Program\ Files\ \(x86\)/Microsoft\ Games/Pinball/pinball.exe'
alias rs='java -jar ~/Diverse/RuneLite.jar'
alias unity-editor='cd / && ./opt/Unity/Editor/Unity -force-opengl && cd'
alias pretty-clock='tty-clock-no-colon -cC7'
alias emulator='./Git/gambatte/gambatte_qt/bin/gambatte_qt'
alias gambatte='emulator'
#
#Aliases for git
alias gp='git push'
alias gl='git pull'
alias ga='git add .'
alias gs='git status'
alias glog='git log --oneline --decorate --color --graph | head'
alias glong='git log --oneline --decorate --color --graph'
alias gcm='git commit -m'
alias grand='git commit -m "$(echo $(curl -s http://whatthecommit.com/index.txt)) [wtc]"'
#
#Aliases for easy access to spefic directories
alias kth='cd ~/Git/KTH/'
alias artemis='cd /media/marcus/Artemis/'
alias drive='cd ~/Google\ Drive/KTH/Föreläsningar/'
alias ..='cd ..'
#
#Aliases for commands
alias resint='. ~/Diverse/restart-internet.sh'
alias ea='vim ~/.oh-my-zsh/custom/aliases.zsh && . ~/.oh-my-zsh/custom/aliases.zsh'
alias logout-user='gnome-session-quit'
#
#Fun aliases
alias murder='xkill'
alias sys-screenshot='~/Diverse/screenFetch/screenfetch-dev'
alias sl='sl -ae'
alias folder='gnome-open .'
alias finder='folder'
alias rt='play_random'
alias music='mpd && ncmpcpp && mpd --kill'
alias quit='exit'
#
#Help find shit
alias ffind='find . 2>/dev/null | grep -i'
alias fp='ps aufx | grep -i'
alias fprocess='fp'
alias fpack='apt search'

# ls aliases
alias ll='ls -lh --group-directories-first'
alias lh='ls -lad .*'

# Saved dir aliases
alias ra='for x in 0 1 2 3 4 5 6 7 8 9; do rm ~/.savedfolder$x 2> /dev/null; done'
alias p='p1 ; p2 ; p3 ; p4 ; p5 ; p6 ; p7 ; p8 ; p9 ; p0'
