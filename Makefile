.DEFAULT_GOAL := help

install: install-go install-shell install-powerline install-bin install-git install-misc

install-go:
	apt install golang -y

install-powerline:
	go get -u github.com/davidtorrell/powerline-go
	cp -rf `pwd`/misc/.tmux/tmux-powerline/* ~/.tmux/tmux-powerline/

install-shell:
	rm -f ~/.profile
	rm -f ~/.bashrc
	cp -f `pwd`/shell/profile ~/.profile
	cp -f `pwd`/shell/bashrc ~/.bashrc

install-bin:
	mkdir -p ~/.bin
	cp -f `pwd`/bin/* ~/.bin/

install-git:
	rm -f ~/.gitconfig
	rm -f ~/.gitignore
	rm -f ~/.git-completion.bash
	cp -f `pwd`/git/gitconfig ~/.gitconfig
	cp -f `pwd`/git/gitignore ~/.gitignore
	cp -f `pwd`/git/git-completion.bash ~/.git-completion.bash

install-misc:
	rm -rf ~/.tmux*
	rm -rf ~/.tmux*

	cp -f `pwd`/misc/vimrc ~/.vimrc

	ifeq ($(shell uname), Darwin)
		mkdir -p ~/.tmux
		cp -f `pwd`/misc/tmux-mac.conf ~/.tmux.conf
		cp -f `pwd`/misc/tmux/ip_address.sh ~/.tmux/ip_address.sh
		touch ~/.hushlogin
	else
		cp -f `pwd`/misc/tmux-linux.conf ~/.tmux.conf
	endif


## OK
help:
	echo "install-tmux"
	echo "install-vim"

install-tmux:
	@rm -rf ~/.tmux* || true
	@rm -r ~/.tmux* || true
	ln -s ~/.ciber_dotfiles/tmux/tmux.conf ~/.tmux.conf

install-vim:
	@rm -rf ~/.vim* || true
	bash ~/.ciber_dotfiles/vim_runtime/install_awesome_vimrc.sh