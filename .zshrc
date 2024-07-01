# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR=nvim
export BROWSER=firefox
export ZSH=/home/niklas/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

plugins=(
    git
    zsh-autosuggestions
    fzf-zsh-plugin
    zoxide
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias vim="nvim"
alias v="nvim"

alias r="ranger"

alias g="lazygit"
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
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gpF="git push --force"

alias dc="docker compose"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dck="docker compose kill"
alias de="docker exec -it --user $(id -u):$(id -g) "

alias cu="composer update"
alias cda="composer dump-autoload"
alias cr="composer require"
alias crd="composer require --dev "

alias ll="exa -l -g --icons"
alias lla="exa -la -g --icons"
alias ls="exa --icons"
alias lt="exa --tree --icons -a -I '.git|__pycache__|.mypy_cache|.ipynb_checkpoints'"

alias co="php bin/console"

alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# Path
export PATH=vendor/bin:../../vendor/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH="$PATH:/usr/local/lib/node_modules/bin"
export PATH=$PATH:/var/lib/flatpak/exports/share
export PATH=~/.npm-global/bin:$PATH
export PATH=~/.dotfiles/scripts:$PATH
export PATH=~/.scripts:$PATH
export PATH=$HOME/.tmux/plugins/tmuxifier/bin:$PATH

# Other exports
export NODE_PATH=/usr/lib/node_modules
export XDG_CONFIG_HOME=$HOME/.config
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"
export AWS_PROFILE=sweetspot

# Includes
[ -f ~/.aws-credentials ] && source ~/.aws-credentials
[ -f ~/.github_token ] && source ~/.github_token
[ -f ~/.secrets/chatgpt ] && source ~/.secrets/chatgpt
[ -f ~/.aliases ] && source ~/.aliases

[[ -f ~/.fzf/fzf.zsh ]] && source ~/.fzf/fzf.zsh

eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
