export EDITOR=vim

if [ -d $HOME/go ]
then
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$PATH

    for d in $(ls $GOPATH/src)
    do
        export CDPATH=$CDPATH:$GOPATH/src/$d
    done
fi

export DOT_SAGENB=$HOME/sync/sage
