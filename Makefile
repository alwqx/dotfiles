.PHONY: vim zsh git chrome chromium redshift

CURDIR=$(shell pwd)
LNOPT=-fs
#ifdef force
#	ifeq ($(force),1)
#		LNOPT=-fs
#	endif
#endif

submodule:
	git submodule update --init

vim:
	cat $(CURDIR)/vim/adolphlwq.vim > $(CURDIR)/vim/vim-config/my_configs.vim
	ln $(LNOPT) $(CURDIR)/vim/vim-config ~/.vim_runtime
	sh $(CURDIR)/vim/vim-config/install_awesome_vimrc.sh

zshinit:
	git clone https://github.com/ohmyzsh/ohmyzsh.git zsh/ohmyzsh-repo
	git clone https://github.com/zsh-users/zsh-syntax-highlighting zsh/ohmyzsh-repo/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions zsh/ohmyzsh-repo/plugins/zsh-autosuggestions

zsh:
	ln $(LNOPT) $(CURDIR)/zsh/ohmyzsh-repo ~/.oh-my-zsh
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

mac:
	brew install --cask visual-studio-code
	brew install --cask orbstack
	brew install autojump
	brew install docker

brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

macpy:
	brew install pyenv
	pyenv install 3.10.6
	pyenv global 3.10.6
	pyenv root
	pyenv versions
