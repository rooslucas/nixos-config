 default:
	darwin-rebuild switch --flake .#RoosBook

move-default:
	echo "moving default macOS config files if they exist"
	[ ! -f /etc/zshenv ] || sudo mv /etc/zshenv /etc/zshenv.bak
	[ ! -f /etc/zshrc ] || sudo mv /etc/zshrc /etc/zshrc.bak
	[ ! -f /etc/bashrc ] || sudo mv /etc/bashrc /etc/bashrc.bak
