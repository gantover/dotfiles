# Colors
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[magenta]%}@%{$fg[blue]%}%m%{$fg[cyan]%} %(5~|%-1~/.../%3~|%4~)%{$fg[red]%}] %{$reset_color%}$%b "

# History
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Auto/Tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Use vi
bindkey -v
# Use vi keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

export PATH="/home/damian/.cargo/bin:$PATH"
export PATH="/home/damian/.local/bin:$PATH"

root="doas"

# Aliases
alias \
	ek="cd /usr/src/linux && $root make menuconfig" \
	sync="$root emerge --sync" \
	update="$root emerge -uUDq @world" \
	untar="tar -zxvf" \
	sha="shasum -a 256" \
	lspkgs="qlist -IRv >> packages && nvim packages" \
	lm="ls -t -1" \
	lt="ls --human-readable --size -1 -S --classify" \
	cl="clear" \
	cp="cp -iv" \
	mv="mv -iv" \
	mkd="mkdir -pv" \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi" \
	sdn="$root shutdown -h now" \
	courses="cd ~/documents/courses" \
	lc="source $HOME/documents/scripts/tiny/last_course.sh" \
	td="source $HOME/documents/scripts/tiny/edit_tex.sh" \
	fortx="$HOME/documents/scripts/big/format_tex/format_tex" \
	cs="source $HOME/documents/scripts/tiny/select_course"

# LAST LINE !!!, Syntax highlighting
# on gentoo : source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh > /dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh > /dev/null
