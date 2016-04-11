#!/usr/bin/env bash

# Make $DOTFILES_DIR ~/dotfiles
export DOTFILES_DIR="$HOME/dotfiles"
export ENV_DIR="$HOME/environment"

# Create symlinks to files
files="bashrc gitconfig git-completion.bash inputrc tmux.conf tmuxline.conf vimrc"

echo "Creating dotfiles symlinks"
for file in $files; do
	ln -sfv $DOTFILES_DIR/$file ~/.$file
done

if [ -f $ENV_DIR/create_symlinks.bash ]; then
	source $ENV_DIR/create_symlinks.bash
fi

echo "Sourcing .bashrc"
if [ -f $HOME/.bashrc ]; then
	source $HOME/.bashrc
fi

echo "To set custom keybindings immediately, type "
echo "bind -f $HOME/.inputrc"
