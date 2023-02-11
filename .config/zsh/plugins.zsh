##
## Plugins
##

# Configure and load plugins using Zinit's
ZINIT_HOME="${ZINIT_HOME:-${XDG_DATA_HOME:-${HOME}/.local/share}/zinit}"

# Added by Zinit's installer
if [[ ! -f ${ZINIT_HOME}/zinit.git/zinit.zsh ]]; then
    print -P "%F{14}▓▒░ Installing Flexible and fast ZSH plugin manager %F{13}(zinit)%f"
    command mkdir -p "${ZINIT_HOME}" && command chmod g-rwX "${ZINIT_HOME}"
    command git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}/zinit.git" && \
        print -P "%F{10}▓▒░ Installation successful.%f%b" || \
        print -P "%F{9}▓▒░ The clone has failed.%f%b"
fi

source "${ZINIT_HOME}/zinit.git/zinit.zsh"

zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

autoload compinit
compinit

zinit light-mode for \
  hlissner/zsh-autopair \
  zdharma-continuum/fast-syntax-highlighting \
  MichaelAquilina/zsh-you-should-use \
  zsh-users/zsh-autosuggestions \
  Aloxaf/fzf-tab

zinit ice wait'3' lucid
zinit light zsh-users/zsh-history-substring-search

zinit ice wait'2' lucid
zinit light zdharma-continuum/history-search-multi-word

# FZF
zinit ice from"gh-r" as"command"
zinit light junegunn/fzf-bin

# EXA
zinit ice wait lucid from"gh-r" as"program" mv"bin/exa* -> exa"
zinit light ogham/exa

# BAT
zinit ice wait lucid from"gh-r" as"program" mv"*/bat -> bat" atload"export BAT_THEME='Nord'"
zinit light sharkdp/bat

# FD
zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd

# DOCKER
zinit ice from"gh-r" as"program" mv"docker* -> docker-compose"
zinit light docker/compose

# NVM
zinit ice lucid wait'1'
zinit load lukechilds/zsh-nvm # This load nvm on first use of node, npm

# PYENV
zinit ice lucid wait'1' \
 as'command' pick'bin/pyenv' \
 atload'eval "$(pyenv init - --no-rehash zsh)"' \
 src'completions/pyenv.zsh' nocompile'!'
zinit light pyenv/pyenv

# RUSTUP
zinit light zdharma-continuum/zinit-annex-rust
zinit ice \
    id-as"rust" \
    wait"0" \
    lucid \
    rustup \
    as"command" \
    pick"bin/rustc" \
    atload='export CARGO_HOME=$PWD RUSTUP_HOME=$PWD/rustup'
zinit load zdharma-continuum/null

# vim:ft=zsh
