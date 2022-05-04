.DEFAULT_GOAL := help
.SILENT: help check install-all install-tmux install-vim install-shell install-git 

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sed -n 's/^\(.*\): \(.*\)##\(.*\)/\1\3/p' \
	| column -t  -s ' '

check: 
	command -v curl >/dev/null 2>&1 || { echo >&2 "curl is not installed.  Aborting."; exit 1; }
	command -v wget >/dev/null 2>&1 || { echo >&2 "wget is not installed.  Aborting."; exit 1; }
	command -v unzip >/dev/null 2>&1 || { echo >&2 "unzip is not installed.  Aborting."; exit 1; }
	command -v ip >/dev/null 2>&1 || { echo >&2 "ip is not installed.  Aborting."; exit 1; }
	command -v tmux >/dev/null 2>&1 || { echo >&2 "tmux is not installed.  Aborting."; exit 1; }
	command -v vi >/dev/null 2>&1 || { echo >&2 "vi is not installed.  Aborting."; exit 1; }


install-all: install-tmux install-vim  install-shell install-git

install:
	if [ "$bash_alias" = true ]; then
		echo "This won't print, var is false!"
	fi


install-tmux:
	command -v tmux >/dev/null 2>&1 || { echo >&2 "tmux is not installed.  Aborting."; exit 1; }
	$(eval NOW := $(shell date +%Y-%m-%d.%H:%M:%S))
	$(eval BACKUP_DIR := $(shell echo ".tmux-backup.$(NOW).$$$$"))
	mkdir ~/$(BACKUP_DIR)
	mv -f ~/.tmux* ~/$(BACKUP_DIR) 2> /dev/null || true

	ln -s ~/.ciber_dotfiles/tmux/tmux.conf ~/.tmux.conf

install-vim:
	command -v vi >/dev/null 2>&1 || { echo >&2 "vi is not installed.  Aborting."; exit 1; }
	$(eval NOW := $(shell date +%Y-%m-%d.%H:%M:%S))
	$(eval BACKUP_DIR := $(shell echo ".vim-backup.$(NOW).$$$$"))
	mkdir ~/$(BACKUP_DIR)
	mv -f ~/.vim* ~/$(BACKUP_DIR) 2> /dev/null || true

	bash ~/.ciber_dotfiles/vim_runtime/install_awesome_vimrc.sh

install-shell:
	$(eval NOW := $(shell date +%Y-%m-%d.%H:%M:%S))
	$(eval BACKUP_DIR := $(shell echo ".bashrc-backup.$(NOW).$$$$"))
	mkdir ~/$(BACKUP_DIR)
	mv -f ~/.profile ~/$(BACKUP_DIR) 2> /dev/null || true
	mv -f ~/.bashrc ~/$(BACKUP_DIR) 2> /dev/null || true
	mv -f ~/.wgetrc ~/$(BACKUP_DIR) 2> /dev/null || true
	mv -f ~/.screenrc ~/$(BACKUP_DIR) 2> /dev/null || true
	mv -f ~/.editorconfig ~/$(BACKUP_DIR) 2> /dev/null || true
	mv -f ~/.curlrc ~/$(BACKUP_DIR) 2> /dev/null || true

	ln -s  ~/.ciber_dotfiles/shell/profile ~/.profile
	ln -s  ~/.ciber_dotfiles/shell/bashrc ~/.bashrc
	ln -s  ~/.ciber_dotfiles/shell/wgetrc ~/.wgetrc
	ln -s  ~/.ciber_dotfiles/shell/wgetrc ~/.screenrc
	ln -s  ~/.ciber_dotfiles/shell/wgetrc ~/.editorconfig

	touch ~/.hushlogin

install-git:
	$(eval NOW := $(shell date +%Y-%m-%d.%H:%M:%S))
	$(eval BACKUP_DIR := $(shell echo ".git-backup.$(NOW).$$$$"))
	mkdir ~/$(BACKUP_DIR)
	mv -f ~/.gitconfig ~/$(BACKUP_DIR) 2> /dev/null || true
	mv -f ~/.gitignore ~/$(BACKUP_DIR) 2> /dev/null || true
	
	cp -f ~/.ciber_dotfiles/git/gitconfig ~/.gitconfig
	cp -f ~/.ciber_dotfiles/git/gitignore ~/.gitignore