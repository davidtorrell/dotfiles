
alias ll='ls -lF -h'
alias la='ls -lFa -h'
alias l='ls -CF -h'

alias ..='cd ..'
alias cd..='cd ..'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias du='du -sh'
alias df='df -h'


if [[ `uname` == "Darwin"  ]]; then
    alias syslog='tail -f /var/log/system.log'
    alias xopen='open'
else
    alias syslog='tail -f /var/log/syslog'
    alias xopen='xdg-open'
fi

if [[ `uname` == "Linux"  ]]; then
    alias screen-off='xset dpms force off'
fi
