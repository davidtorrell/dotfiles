.DEFAULT_GOAL := help
.SILENT: install-tmux

install: install-go install-shell install-powerline install-bin install-git install-misc

install-go:
	apt install golang -y

install-powerline:
	go get -u github.com/davidtorrell/powerline-go
	cp -rf `pwd`/misc/.tmux/tmux-powerline/* ~/.tmux/tmux-powerline/


## OK
help:
	echo "install-tmux"
	echo "install-vim"

install-tmux:
	$(eval NOW := $(shell date +%Y-%m-%d.%H:%M:%S))
	$(eval BACKUP_DIR := $(shell echo ".tmux-backup.$(NOW).$$$$"))
	mkdir ~/$(BACKUP_DIR)
	mv -f ~/.tmux* ~/$(BACKUP_DIR) 2> /dev/null || true

	ln -s ~/.ciber_dotfiles/tmux/tmux.conf ~/.tmux.conf

install-vim:
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