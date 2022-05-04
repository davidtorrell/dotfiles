#!/bin/bash

source config

if [ "$profile" = true ]; then
	mkdir ~/.profile-backup.`date +%Y-%m-%d.%H:%M:%S`
	mkdir ~/$(BACKUP_DIR)

	mv -f ~/.profile ~/$(BACKUP_DIR) 2> /dev/null || true
	ln -s  ~/.ciber_dotfiles/shell/profile ~/.profile
fi

if [ "$bash" = true ]; then 
	mkdir ~/.bashrc-backup.`date +%Y-%m-%d.%H:%M:%S`

    mv -f ~/.bashrc ~/$(BACKUP_DIR) 2> /dev/null || true
	ln -s  ~/.ciber_dotfiles/shell/bashrc ~/.bashrc
    touch ~/.hushlogin
fi

if [ "$wget" = true ]; then
	mv -f ~/.wgetrc ~/$(BACKUP_DIR) 2> /dev/null || true
	ln -s  ~/.ciber_dotfiles/shell/wgetrc ~/.wgetrc
fi

if [ "$screen" = true ]; then
	mv -f ~/.screenrc ~/$(BACKUP_DIR) 2> /dev/null || true
	ln -s  ~/.ciber_dotfiles/shell/screenrc ~/.screenrc
fi

if [ "$curl" = true ]; then 
    mv -f ~/.curlrc ~/$(BACKUP_DIR) 2> /dev/null || true
    ln -s  ~/.ciber_dotfiles/shell/curlrc ~/.curlrc
fi

if [ "$editorconfig" = true ]; then
    mv -f ~/.editorconfig ~/$(BACKUP_DIR) 2> /dev/null || true
	ln -s  ~/.ciber_dotfiles/shell/editorconfig ~/.editorconfig
fi

if [ "$tmux" = true ]; then
	command -v tmux >/dev/null 2>&1 || { echo >&2 "tmux is not installed.  Aborting."; exit 1; }
	$(eval NOW := $(shell date +%Y-%m-%d.%H:%M:%S))
	$(eval BACKUP_DIR := $(shell echo ".tmux-backup.$(NOW).$$$$"))
	mkdir ~/$(BACKUP_DIR)
	mv -f ~/.tmux* ~/$(BACKUP_DIR) 2> /dev/null || true

	ln -s ~/.ciber_dotfiles/tmux/tmux.conf ~/.tmux.conf
fi

if [ "$vim" = true ]; then
	command -v vi >/dev/null 2>&1 || { echo >&2 "vi is not installed.  Aborting."; exit 1; }
	$(eval NOW := $(shell date +%Y-%m-%d.%H:%M:%S))
	$(eval BACKUP_DIR := $(shell echo ".vim-backup.$(NOW).$$$$"))
	mkdir ~/$(BACKUP_DIR)
	mv -f ~/.vim* ~/$(BACKUP_DIR) 2> /dev/null || true

	bash ~/.ciber_dotfiles/vim_runtime/install_awesome_vimrc.sh
fi

if [ "$git" = true ]; then
	$(eval NOW := $(shell date +%Y-%m-%d.%H:%M:%S))
	$(eval BACKUP_DIR := $(shell echo ".git-backup.$(NOW).$$$$"))
	mkdir ~/$(BACKUP_DIR)
	mv -f ~/.gitconfig ~/$(BACKUP_DIR) 2> /dev/null || true
	mv -f ~/.gitignore ~/$(BACKUP_DIR) 2> /dev/null || true
	
	cp -f ~/.ciber_dotfiles/git/gitconfig ~/.gitconfig
	cp -f ~/.ciber_dotfiles/git/gitignore ~/.gitignore
fi