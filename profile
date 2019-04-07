export EDITOR=vi
if [ -n "$(which nvim 2>/dev/null)" ]
then
	export EDITOR=nvim
fi

if [ -d $HOME/go ]
then
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$PATH

    for d in $(ls $GOPATH/src)
    do
        export CDPATH=$CDPATH:$GOPATH/src/$d
    done
fi

# python helper library
export PYTHONPATH=~/pylib
