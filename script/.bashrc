# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vim='/home/share/soft/nvim-linux64/bin/nvim'

export SOFT_HOME=/home/share/w12043/soft/bin
export PATH=$PATH:$SOFT_HOME
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
