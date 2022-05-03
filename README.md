# ciber dotfiles

My dotfiles. Includes configuration files for bash, git, tmux, vim and maybe other things.

Works on GNU/Linux debian / centos

## How to download the ciber dotfiles?
```
git clone https://github.com/davidtorrell/dotfiles.git ~/.ciber_dotfiles
```
## How to install modules?
```
cd ~/.ciber_dotfiles
```

#### Check dependences:
``` 
make check
```
#### Install modules:
* **TMUX**: configuration for tmux
* **VIM**: configuration for vim with plugins
* **SHELL**: bashrc and multiple profiles config
* **GIT**: gitconfig assembled

```
make install-tmux
make install-vim
make install-shell
make install-git
```
#### Install all (optional):
```
make install-all
```

# TODO

*Debian errors
```shell
apt install ca-certificates libgnutls30 -y
```