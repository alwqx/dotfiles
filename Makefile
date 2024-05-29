.PHONY: vim zsh git chrome chromium redshift

CURDIR=$(shell pwd)
LNOPT=-fs
#ifdef force
#	ifeq ($(force),1)
#		LNOPT=-fs
#	endif
#endif

g:
	git submodule update --init
	# git clone https://github.com/zsh-users/zsh-syntax-highlighting zsh/ohmyzsh/plugins/zsh-syntax-highlighting
	# git clone https://github.com/zsh-users/zsh-autosuggestions zsh/ohmyzsh/plugins/zsh-autosuggestions

vim:
	cat $(CURDIR)/vim/adolphlwq.vim > $(CURDIR)/vim/vim-config/my_configs.vim
	ln $(LNOPT) $(CURDIR)/vim/vim-config ~/.vim_runtime
	sh $(CURDIR)/vim/vim-config/install_awesome_vimrc.sh

zsh:
	ln $(LNOPT) $(CURDIR)/zsh/ohmyzsh ~/.oh-my-zsh
	ln $(LNOPT) $(CURDIR)/zsh/zshrc ~/.zshrc

bash:
	ln $(LNOPT) $(CURDIR)/zsh/zshrc ~/.bashrc

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

redshift:
	@echo "redshift config location is Shanghai(lat=31.23 lon=121.47) you can config it"
	ln $(LNOPT) $(CURDIR)/redshift/redshift.conf ~/.config/redshift/redshift.conf
