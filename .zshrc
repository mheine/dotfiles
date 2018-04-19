# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/marcus/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="risto"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

fif() {
	if [ "$1" = "" ]; then
		echo -e "Empty input.\nUsage: 'fif <text to find>'"
	else
		grep -Rn "$1" .
	fi
}

note()  {
	echo "$2" >> /home/marcus/lectures/$1/notes
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

for x in 0 1 2 3 4 5 6 7 8 9
do
	alias s$x='pwd > ~/.savedfolder'$x
	alias l$x='check_cd '$x
	alias p$x='check_folder '$x
	alias r$x='rm ~/.savedfolder'$x
done

check_folder() {
	if [ -f ~/.savedfolder$1 ]; then
		echo Saved folder $1 is: $(cat ~/.savedfolder$1 2> /dev/null)
	fi
}

check_cd() {
	CD=$(cat ~/.savedfolder"$1") 2> /dev/null
	if [ -n "$CD" ]; then
		cd $(cat ~/.savedfolder"$1" 2> /dev/null) && pwd
	fi
}

play_random() {
    # find ~/Music -name "*.mp3" | shuf -n 1 | xargs -d "\n" mpg123 -q
    trackpath=$(find ~/Music -name "*.mp3" | shuf -n 1)
    path_minus_home=$(echo $trackpath | sed 's@.*\/Music\/@@g' | sed 's@\.mp3@@g' | sed 's@[0-9]*@@g')

    noOfSlashes=$(awk -F "/" '{print NF-1}' <<< "${path_minus_home}")

    if [[ $noOfSlashes -gt 1 ]]; then
    	artist=$(echo $path_minus_home | sed 's@/.*@@g')
    	song=$(echo $path_minus_home | sed 's@.*/@@g' | sed -e 's@^[[:space:]]*@@')
    	album=$(echo $path_minus_home | sed "s@$artist@@g" | sed "s@$song@@g" | sed "s@/@@g" | sed "s@-@@g" | sed -e 's/^[[:space:]]*//')
    	echo "Now playing\033[1;36m "$song" \033[0mby\033[1;95m "$artist" \033[0mfrom\033[1;31m "$album "\033[0m"
    	mpg123 -q "$trackpath"
    elif [[ $noOfSlashes -eq 1 ]]; then
    	song=$(echo $path_minus_home | sed 's@.*/@@g' | sed 's@\.mp3@@g')
    	artist=$(echo $path_minus_home | sed 's@/.*@@g' | sed 's@[0-9]*@@g') 
    	echo "Now playing\033[1;36m" $song "\033[0mfrom\033[1;95m" $artist "\033[0m"
    	mpg123 -q "$trackpath"
    else
    	name=$(echo $trackpath | sed 's@.*/@@g' | sed 's@\.mp3@@g')
    	artist=$(echo $name | sed 's@-.*@@g')
    	song=$(echo $name | sed 's@.*- @@g') 
    	echo "Now playing\033[1;36m" $song "\033[0mby\033[1;95m" $artist "\033[0m"
    	mpg123 -q "$trackpath"
    fi
}

dots() {
	dot "$1".dot -Tpng -o "$1".png && feh "$1".png
}


# Set personal aliases, overriding those provided by oh-my-zsh libs,
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
#General aliases
alias clr='clear'
alias today='touch $(date +" %d-%m-%y")'
alias 3tap='synclient TapButton3=2'
alias sinstall='sudo apt install'
alias lock='gnome-screensaver-command -l'
#
#Aliases for programs
alias s='subl'
alias chrome='chromium-browser &'
alias image='eog'
alias dxball='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/DX-ball'
alias rs='java -jar ~/Diverse/OSBuddy.jar'
alias unity-editor='cd / && ./opt/Unity/Editor/Unity -force-opengl && cd'
#
#Aliases for git
alias gp='git push'
alias gl='git pull'
alias ga='git add .'
alias gs='git status'
alias glog='git log --oneline --decorate --color --graph'
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
alias ea='vim ~/.zshrc && . ~/.zshrc'
#
#Fun aliases
alias murder='xkill'
alias sys-screenshot='~/Diverse/screenFetch/screenfetch-dev'
alias sl='sl -ae'
alias folder='gnome-open .'
alias finder='folder'
alias rt='play_random'

#
#Help find shit
alias ffind='find . 2>/dev/null | grep -i'
alias fp='ps aufx | grep -i'
alias fprocess='fp'

# ls aliases
alias ll='ls -lh --group-directories-first'

# Saved dir aliases
alias ra='for x in 0 1 2 3 4 5 6 7 8 9; do rm ~/.savedfolder$x 2> /dev/null; done'
alias p='p1 ; p2 ; p3 ; p4 ; p5 ; p6 ; p7 ; p8 ; p9 ; p0'
