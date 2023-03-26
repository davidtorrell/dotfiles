# aliases
function _tmux_new_or_attach()
{
    tmux has-session -t $1 2>/dev/null
    if [ "$?" -eq 1 ] ; then
        # No session found
        tmux -2 new-session -d -s $1
    fi
    tmux -2 attach-session -t $1
}

alias tmux='tmux -2'
alias t=_tmux_new_or_attach

if hash "tmux" > /dev/null 2>&1; then
    alias tmux='TMPDIR=/tmp tmux -2'
fi