#========================================================================
#								Exports
#========================================================================

# Use vim as default editor
export DOTFILES="$HOME/dotfiles"
export ENV_DIR="$HOME/environment"
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
# Enable 256color terminal
export TERM=screen-256color


#========================================================================
#								Aliases
#========================================================================


alias la='ls -a'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias rf='rm -rf'
alias mf=makefile

#========================================================================
#								Functions
#========================================================================


function makefile(){
	make -f $1
}

function eclim(){
	$ECLIPSE_HOME/./eclimd
}

function dark(){
	gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "#AAAAAAAAAAAA"
	gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#000000000000"
}

function light(){
	gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "#000000000000"
	gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#FFFFFFFFFFFF"
}

#========================================================================
#								Misc
#========================================================================


# Enable tab completion for git
if [ -f $DOTFILES/.git-completion.bash ]; then
	source $DOTFILES/.git-completion.bash
fi

files="python_env.bash java_env.bash hadoop_env.bash"
for file in $files; do
	if [ -f $ENV_DIR/$file ]; then
		source $ENV_DIR/$file
	fi
done
