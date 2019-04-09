FILES := \
    ${HOME}/.bashrc \
    ${HOME}/.config/nvim/init.vim \
    ${HOME}/.config/nvim/autoload/plug.vim \
    ${HOME}/.gitconfig \
    ${HOME}/.config/vifm/vifmrc \
    ${HOME}/.msmtprc \
    ${HOME}/.mbsyncrc \
    ${HOME}/.muttrc \
    ${HOME}/.muttrc.gmail \
    ${HOME}/.mailcap \
    ${HOME}/.st/patches/scrollback.diff \
    ${HOME}/.st/patches/font.diff

all: $(FILES)

clean:
	rm $(FILES)

${HOME}/.config/nvim/init.vim:
	mkdir -p $(@D)
	ln -s $(realpath nvim/init.vim) $@

${HOME}/.config/nvim/autoload/plug.vim:
	mkdir -p $(@D)
	ln -s $(realpath nvim/plug.vim) $@

${HOME}/.st/patches/%.diff: st/%.patch
	mkdir -p $(@D)
	cp $< $@

${HOME}/.config/vifm/vifmrc:
	mkdir -p $(@D)
	ln -s $(realpath vifmrc) $@

${HOME}/.%: %
	ln -s $(realpath $<) $@
