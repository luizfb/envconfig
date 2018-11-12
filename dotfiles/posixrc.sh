export LANG='en_US'
export LC_ALL='en_US.UTF-8'
export LC_CTYPE='UTF-8'
export CLICOLOR=1
PS1='\e[0;36m\t  \e[35m\u@\h  \e[33m\w  \e[31m[$?]\e[0m\n\$ '

export EDITOR='vim'
export HOMEBREW_CASK_OPTS='--appdir=/Applications'

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/.cargo/bin:$PATH


if [ -x $(command -v go) ]; then
    export GOROOT=$(go env GOROOT)
    export GOPATH=$(go env GOPATH)
    export GOBIN=$GOPATH/bin
    export PATH=$PATH:$GOBIN
fi


test -e ~/.aliases     && . ~/.aliases
test -e ~/.credentials && . ~/.credentials
