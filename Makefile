FILES := ${HOME}/.config/nvim/init.vim \
    ${HOME}/.config/nvim/autoload/plug.vim \
    ${HOME}/.gitconfig \
    ${HOME}/.st/def.h

all: $(FILES)

${HOME}/.config/nvim/init.vim:
	mkdir -p $(@D)
	ln -s $(realpath nvim/init.vim) $@

${HOME}/.config/nvim/autoload/plug.vim:
	mkdir -p $(@D)
	ln -s $(realpath nvim/plug.vim) $@

${HOME}/.gitconfig:
	mkdir -p $(@D)
	ln -s $(realpath gitconfig) $@

${HOME}/.st/def.h:
	mkdir -p $(@D)
	ln -s $(realpath st/def.h) $@
