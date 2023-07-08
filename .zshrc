# path
export PATH="$HOME/.local/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# antidote
[ ! -d "${ZDOTDIR:-~}/.antidote" ] > /dev/null || git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

# prompt
autoload -Uz promptinit && promptinit && prompt pure
if command -v colorscript > /dev/null; then
	colorscript -r
fi

# ----aliases----
# exa
if command -v exa > /dev/null; then
	alias ls='exa' # just replace ls by exa and allow all other exa arguments
	alias l='ls -lbF' #   list, size, type
	alias ll='ls -la' # long, all
	alias llm='ll --sort=modified' # list, long, sort by modification date
	alias la='ls -lbhHigUmuSa' # all list
	alias lx='ls -lbhHigUmuSa@' # all list and extended
	alias tree='exa --tree' # tree view
	alias lS='exa -1' # one column by just names
fi

# quit
alias q="exit"

# kitty
alias s="kitty +kitten ssh"

# ----env variables----
# path
export PATH="$HOME/.local/bin:$PATH"
# editor
if command -v nvim > /dev/null; then
	export EDITOR=nvim
elif command -v vim > /dev/null; then
	export EDITOR=vim
else
	export EDITOR=vi
fi


