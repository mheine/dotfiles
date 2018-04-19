# Custom bash aliases to make my life a bit easier
# Is called by .bashrc
# Is clean.
# Is cool.

fif() {
    if [ "$1" = "" ]; then
		echo -e "Empty input.\nUsage: 'fif <text to find>'"
    else
		grep -R "$1" .
    fi
}

lecture() {
    if [ "$1" = "" ]; then
		echo -e "Empty input.\nUsage: 'lecture <lecture_name>'"
    else
    	TODAY="$(date +"%d-%m-%y")"
    	INPUT="$1_"
    	FILE=$INPUT$TODAY
    	echo -e "Created text file '$FILE'."
		touch $FILE
    fi
}

#General aliases
alias clr='clear'
alias today='touch $(date +" %d-%m-%y")'
alias 3tap='synclient TapButton3=2'
alias sinstall='sudo apt install'

#Aliases for programs
alias s='subl'
alias chrome='chromium-browser &'
alias image='eog'
alias dxball='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/DX-ball'
alias rs='java -jar ~/Diverse/OSBuddy.jar'
alias unity-editor='cd / && ./opt/Unity/Editor/Unity -force-opengl && cd'

#Aliases for git
alias gp='git push'
alias gl='git pull'
alias ga='git add .'
alias gs='git status'
alias glog='git log --oneline --decorate --color --graph'
alias gcm='git commit -m'

#Aliases for easy access to spefic directories
alias kth='cd ~/Git/KTH/'
alias artemis='cd /media/marcus/Artemis/'
alias drive='cd ~/Google\ Drive/KTH/Föreläsningar/'
alias ..='cd ..'

#Aliases for commands
alias resint='. ~/Diverse/restart-internet.sh'
alias ea='vim ~/.bash_aliases && . ~/.bashrc'

#Fun aliases
alias murder='xkill'
alias sys-screenshot='~/Diverse/screenFetch/screenfetch-dev'
alias sl='sl -ae'
alias folder='gnome-open .'
alias finder='folder'

#Help find shit
alias ffind='find . 2>/dev/null | grep -i'
alias fp='ps aux | grep -i'
alias fprocess='fp'
