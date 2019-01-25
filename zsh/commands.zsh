fif() {
	if [ "$1" = "" ]; then
		echo -e "Empty input.\nUsage: 'fif <text to find>'"
	else
		grep -iRn "$1" .
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

fif-no-node() {
    fif "$1" | grep -v "node_modules" | grep -v "\.min\.js" | cut -c 1-250 | grep "$1"
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
    	echo "Now playing\033[1;36m" $song "\033[0mfrom\033[1;31m" $artist "\033[0m"
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