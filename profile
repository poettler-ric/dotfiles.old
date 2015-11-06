export EDITOR=vim

if [ -d $HOME/go ]
then
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$PATH
fi

export DOT_SAGENB=$HOME/sync/sage
