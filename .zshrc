# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR=vim
export ZSH=/home/niklas/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    fasd
)

source $ZSH/oh-my-zsh.sh

# Alacritty comptaible key bindings
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Aliases
alias conf_zsh="vim ~/.zshrc"
alias conf_polybar="vim ~/.config/polybar/config.ini"
alias conf_i3="vim ~/.config/i3/config"
alias conf_vim="vim ~/.vimrc"
alias conf_alacritty="vim ~/.config/alacritty/alacritty.yml"

alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset %C(cyan)(%cn)%Creset' --abbrev-commit --date=relative"
alias gu="git up"
alias gco="git checkout"
alias gc="git commit"
alias gcm="git commit -m "
alias ga="git add"
alias gaa="git add -A"
alias gai="git add -i"
alias gap="git add -p"
alias gs="git status --short"
alias gss="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gr="git rebase"
alias gra="git rebase --abort"
alias grco="git rebase --continue"
alias gfu="git fetch upstream"
alias grd="git rebase develop"
alias grm="git rebase master"

alias dc="docker-compose"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dck="docker-compose kill"
alias de="docker exec -it --user $(id -u):$(id -g) "

alias cu="composer update"
alias cda="composer dump-autoload"
alias cr="composer require"
alias crd="composer require --dev "

alias ll="exa -l -g --icons"
alias ls="exa --icons"
alias lt="exa --tree --icons -a -I '.git|__pycache__|.mypy_cache|.ipynb_checkpoints'"

alias tail="grc tail"
alias ps="grc ps"
alias cat="grc cat"

phpco() { docker run --init -v $PWD:/mnt/src:cached --rm -u "$(id -u):$(id -g)" frbit/phpco:latest $@; return $?; }

# Path
export PATH=vendor/bin:../../vendor/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:/usr/local/lib/node_modules/bin"
export PATH=~/.dotfiles/scripts:$PATH
export PATH=$PATH:/var/lib/flatpak/exports/share
export NODE_PATH=/usr/lib/node_modules
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
export XDG_CONFIG_HOME=$HOME/.config/

# Includes
[ -f ~/.aws-credentials ] && source ~/.aws-credentials
[ -f ~/.github_token ] && source ~/.github_token
[ -f ~/.aliases ] && source ~/.aliases

[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ ! -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] || source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
