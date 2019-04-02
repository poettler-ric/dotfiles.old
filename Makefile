FILES := ${HOME}/.config/nvim/init.vim \
    ${HOME}/.config/nvim/autoload/plug.vim \
    ${HOME}/.gitconfig \
    ${HOME}/.config/vifm/vifmrc \
    ${HOME}/.st/patches/scrollback.diff \
    ${HOME}/.st/patches/font.diff

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

${HOME}/.st/patches/%.diff: st/%.patch
	mkdir -p $(@D)
	cp $< $@

${HOME}/.config/vifm/vifmrc:
	mkdir -p $(@D)
	ln -s $(realpath vifmrc) $@
