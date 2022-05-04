#!/bin/bash

source config

echo ":'######::'####:'########::'########:'########:::::                           
'##... ##:. ##:: ##.... ##: ##.....:: ##.... ##::::                           
 ##:::..::: ##:: ##:::: ##: ##::::::: ##:::: ##::::                           
 ##:::::::: ##:: ########:: ######::: ########:::::                           
 ##:::::::: ##:: ##.... ##: ##...:::: ##.. ##::::::                           
 ##::: ##:: ##:: ##:::: ##: ##::::::: ##::. ##:::::                           
. ######::'####: ########:: ########: ##:::. ##::::                           
:......:::....::........:::........::..:::::..:::::                           
'########:::'#######::'########:'########:'####:'##:::::::'########::'######::
 ##.... ##:'##.... ##:... ##..:: ##.....::. ##:: ##::::::: ##.....::'##... ##:
 ##:::: ##: ##:::: ##:::: ##:::: ##:::::::: ##:: ##::::::: ##::::::: ##:::..::
 ##:::: ##: ##:::: ##:::: ##:::: ######:::: ##:: ##::::::: ######:::. ######::
 ##:::: ##: ##:::: ##:::: ##:::: ##...::::: ##:: ##::::::: ##...:::::..... ##:
 ##:::: ##: ##:::: ##:::: ##:::: ##:::::::: ##:: ##::::::: ##:::::::'##::: ##:
 ########::. #######::::: ##:::: ##:::::::'####: ########: ########:. ######::
........::::.......::::::..:::::..::::::::....::........::........:::......:::"

if [ "$profile" = true ]; then
	echo 'ciber dotfiles: Backup .profile ... OK'
	BACKUP_DIR='.profile-backup'.`date +%Y-%m-%d.%H:%M:%S`
	mkdir ~/$BACKUP_DIR
	mv -f ~/.profile ~/$BACKUP_DIR 2> /dev/null || true

	echo 'ciber dotfiles: Install .profile ... OK'
	ln -s  ~/.ciber_dotfiles/shell/profile ~/.profile
fi

if [ "$bash" = true ]; then 
	echo 'ciber dotfiles: Backup .bashrc ... OK'
	BACKUP_DIR='.bashrc-backup'.`date +%Y-%m-%d.%H:%M:%S`
	mkdir ~/$BACKUP_DIR
    mv -f ~/.bashrc ~/$BACKUP_DIR 2> /dev/null || true

	echo 'ciber dotfiles: Install .bashrc ... OK'
	ln -s  ~/.ciber_dotfiles/shell/bashrc ~/.bashrc
    touch ~/.hushlogin
fi

if [ "$wget" = true ]; then
	echo 'ciber dotfiles: Backup .wgetrc ... OK'
	BACKUP_DIR='.wget-backup'.`date +%Y-%m-%d.%H:%M:%S`
	mkdir ~/$BACKUP_DIR
	mv -f ~/.wgetrc ~/$BACKUP_DIR 2> /dev/null || true

	echo 'ciber dotfiles: Install .wgetrc ... OK'
	ln -s  ~/.ciber_dotfiles/shell/wgetrc ~/.wgetrc
fi

if [ "$screen" = true ]; then
	echo 'ciber dotfiles: Backup .screenrc ... OK'
	BACKUP_DIR='screen-backup'.`date +%Y-%m-%d.%H:%M:%S`
	mkdir ~/$BACKUP_DIR
	mv -f ~/.screenrc ~/$BACKUP_DIR 2> /dev/null || true

	echo 'ciber dotfiles: Install .screenrc ... OK'
	ln -s  ~/.ciber_dotfiles/shell/screenrc ~/.screenrc
fi

if [ "$curl" = true ]; then
	echo 'ciber dotfiles: Backup .curl ... OK'
	BACKUP_DIR='.curl-backup'.`date +%Y-%m-%d.%H:%M:%S` 
	mkdir ~/$BACKUP_DIR
    mv -f ~/.curlrc ~/$BACKUP_DIR 2> /dev/null || true

	echo 'ciber dotfiles: Install .curlrc ... OK'
    ln -s  ~/.ciber_dotfiles/shell/curlrc ~/.curlrc
fi

if [ "$editorconfig" = true ]; then
	echo 'ciber dotfiles: Backup .editorconfig ... OK'
	BACKUP_DIR='.editorconfig-backup'.`date +%Y-%m-%d.%H:%M:%S`
	mkdir ~/$BACKUP_DIR
    mv -f ~/.editorconfig ~/$BACKUP_DIR 2> /dev/null || true
	
	echo 'ciber dotfiles: Install .editorconfig ... OK'
	ln -s  ~/.ciber_dotfiles/shell/editorconfig ~/.editorconfig
fi

if [ "$tmux" = true ]; then
	echo 'ciber dotfiles: Backup .tmux ... OK'
	command -v tmux >/dev/null 2>&1 || { echo >&2 "tmux is not installed.  Aborting."; exit 1; }
	BACKUP_DIR='.tmux-backup'.`date +%Y-%m-%d.%H:%M:%S`
	mkdir ~/$BACKUP_DIR
	mv -f ~/.tmux* ~/$BACKUP_DIR 2> /dev/null || true

	echo 'ciber dotfiles: Install .tmux ... OK'
	ln -s ~/.ciber_dotfiles/tmux/tmux.conf ~/.tmux.conf
fi

if [ "$vim" = true ]; then
	command -v vi >/dev/null 2>&1 || { echo >&2 "vi or vim is not installed.  Aborting."; exit 1; }
	echo 'ciber dotfiles: Backup .vimrc ... OK'
	BACKUP_DIR='.vim-backup'.`date +%Y-%m-%d.%H:%M:%S`
	mkdir ~/$BACKUP_DIR
	mv -f ~/.vim* ~/$BACKUP_DIR 2> /dev/null || true

	echo 'ciber dotfiles: Install .vimrc ... OK'
	bash ~/.ciber_dotfiles/vim_runtime/install_awesome_vimrc.sh
fi

if [ "$git" = true ]; then
	echo 'ciber dotfiles: Backup .git ... OK'
	BACKUP_DIR='.git-backup'.`date +%Y-%m-%d.%H:%M:%S`
	mkdir ~/$BACKUP_DIR
	mv -f ~/.gitconfig ~/$BACKUP_DIR 2> /dev/null || true
	mv -f ~/.gitignore ~/$BACKUP_DIR 2> /dev/null || true
	
	echo 'ciber dotfiles: Install .git ... OK'
	cp -f ~/.ciber_dotfiles/git/gitconfig ~/.gitconfig
	cp -f ~/.ciber_dotfiles/git/gitignore ~/.gitignore
fi