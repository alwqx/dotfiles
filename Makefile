.PHONY: vim zsh git chrome chromium

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
	ln $(LNOPT) $(CURDIR)/zsh/zshrc ~/.zshrc

git: 
	ln $(LNOPT) $(CURDIR)/git/gitconfig ~/.gitconfig

vscode:
	ln $(LNOPT) $(CURDIR)/vscode/config/settings.json ~/.config/Code/User/settings.json

chrome:
	echo "config chrome for hiDPI"
	ln $(LNOPT) $(CURDIR)/chrome/chrome-flags.conf ~/.config/chrome-flags.conf
	
chromium:
	echo "config chromium for hiDPI"
	ln $(LNOPT) $(CURDIR)/chromium/chromium-flags.conf ~/.config/chromium-flags.conf

lg:
	echo "config libinput gestures for chromium"
	ln $(LNOPT) $(CURDIR)/gestures/libinput-gestures.conf ~/.config/libinput-gestures.conf