# default shell
export SHELL=/bin/zsh

# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# default editor
export EDITOR='subl -n -w'

# default user
export DEFAULT_USER=kaicataldo

# oh-my-zsh theme
ZSH_THEME="kai-omz-theme"

# oh-my-zsh plugins
plugins=(git brew)

# source oh-my-zsh
export ZSH=/Users/kaicataldo/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# heroku cli
export PATH="/usr/local/heroku/bin:$PATH"

# nvm
. ~/.nvm/nvm.sh

# rbenv
if which rbenv > /dev/null;
  then eval "$(rbenv init -)";
fi

# This is mark/and jump
export MARKPATH=$HOME/.marks

jump() {
	cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}

mark() {
	if (( $# == 0 )); then
		MARK=$(basename "$PWD")
	else
		MARK="$1"
	fi
	if read -q \?"Mark $PWD as ${MARK}? (y/n) "; then
		mkdir -p "$MARKPATH"; ln -s "$PWD" "$MARKPATH/$MARK"
	fi
}

unmark() {
	rm -i "$MARKPATH/$1"
}

marks() {
	for link in $MARKPATH/*(@); do
		local markname="$fg[cyan]${link:t}$reset_color"
		local markpath="$fg[blue]$(readlink $link)$reset_color"
		printf "%s\t" $markname
		printf "-> %s \t\n" $markpath
	done
}

_completemarks() {
	if [[ $(ls "${MARKPATH}" | wc -l) -gt 1 ]]; then
		reply=($(ls $MARKPATH/**/*(-) | grep : | sed -E 's/(.*)\/([_a-zA-Z0-9\.\-]*):$/\2/g'))
	else
		if readlink -e "${MARKPATH}"/* &>/dev/null; then
			reply=($(ls "${MARKPATH}"))
		fi
	fi
}
compctl -K _completemarks jump
compctl -K _completemarks unmark

_mark_expansion() {
	setopt extendedglob
	autoload -U modify-current-argument
	modify-current-argument '$(readlink "$MARKPATH/$ARG")'
}
zle -N _mark_expansion
bindkey "^g" _mark_expansion
