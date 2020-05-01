export ZSH="$HOME/.oh-my-zsh"

plugins=(git
	z
	zsh-autosuggestions
	fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Enable 256 color
export TERM="xterm-256color"

# Initialize command prompt
export PS1="%n@%m:%~%# "

eval $(thefuck --alias)

# alias settings
alias s=neofetch
alias up='sudo pacman -Syu'
alias c=clear
alias ra=ranger
alias cs=cowsay
alias vim=nvim
alias sudo='sudo -E'

# vi mode
bindkey -v
bindkey -M vicmd "n" vi-insert
bindkey -M vicmd "N" vi-insert-bol
bindkey -M vicmd "j" vi-backward-char
bindkey -M vicmd "l" vi-forward-char
bindkey -M vicmd "J" vi-beginning-of-line
bindkey -M vicmd "L" vi-end-of-line
bindkey -M vicmd "k" down-line-or-history
bindkey -M vicmd "I" up-line-or-history
bindkey -M vicmd "u" undo
bindkey -M vicmd "=" vi-repeat-search
bindkey -M vicmd "h" vi-forward-word-end

function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
	fi
}
zle -N zle-keymap-select

echo -ne '\e[5 q'
