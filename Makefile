.PHONY: vim zsh git

CURDIR=$(shell pwd)
LNOPT=-fs
#ifdef force
#	ifeq ($(force),1)
#		LNOPT=-fs
#	endif
#endif

submodule:
	git submodule update --init

vim: submodule
	cat $(CURDIR)/vim/adolphlwq.vim > $(CURDIR)/vim/vim-config/my_configs.vim
	ln $(LNOPT) $(CURDIR)/vim/vim-config ~/.vim_runtime
	sh $(CURDIR)/vim/vim-config/install_awesome_vimrc.sh

zsh: submodule
	ln $(LNOPT) $(CURDIR)/zsh/oh-my-zsh ~/.oh-my-zsh

git: 
	ln $(LNOPT) $(CURDIR)/git/gitconfig ~/.gitconfig

vscode:
	ln $(LNOPT) $(CURDIR)/vscode/config/settings.json ~/.config/Code/User/settings.json
