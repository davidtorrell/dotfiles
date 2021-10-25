
install: install-shell install-powerline install-bin install-git install-misc

install-powerline:
	go get -u github.com/justjanne/powerline-go

install-shell: install-powerline
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
	rm -f ~/.vimrc
	rm -f ~/.tmux.conf
	rm -rf ~/.tmux
	cp -f `pwd`/misc/vimrc ~/.vimrc
	mkdir -p ~/.tmux/tmux-powerline
	cp -rf `pwd`/misc/.tmux/tmux-powerline/* ~/.tmux/tmux-powerline/
ifeq ($(shell uname), Darwin)
	cp -f `pwd`/misc/.tmux/.tmux.conf ~/.tmux.conf
	cp -f `pwd`/misc/.tmux/.tmux.conf.local ~/.tmux.conf.local
	touch ~/.hushlogin
else
	ln -s `pwd`/misc/.tmux/tmux.conf ~/.tmux.conf
endif

