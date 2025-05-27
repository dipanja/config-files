# load local env variables
[ -f ~/.env ] && source ~/.env
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
PATH="$HOME/.local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"



# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="fletcherm"
# ZSH_THEME="simple"
# ZSH_THEME="af-magic" # most used by me.
# ZSH_THEME="imajes"
# ZSH_THEME="amuse" # working
# ZSH_THEME="frontcube"
# ZSH_THEME="powerlevel10k/powerlevel10k"

ENABLE_CORRECTION="true"

plugins=(
git
zsh-autosuggestions
#zsh-syntax-highlighting
zsh-vi-mode
web-search
sudo
# autopep8
python
fzf
alias-finder
history
tmux
)


# only save unique value in history
setopt HIST_IGNORE_ALL_DUPS
source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi


alias ll='ls -alF'
alias la='ls -lA'
alias l='ls -CF'
alias open='xdg-open'
# alias vi='nvim'
alias v='nvim .'
alias vim='nvim'
alias cl='clear'
alias hg='history | grep'
alias af="alias-finder -l"
alias p="cd /media/bappa/DATA/projects"
alias fe="cd /media/bappa/DATA/projects/fe"
alias al="cd /media/bappa/DATA/projects/algo"
alias mt="cd /media/bappa/DATA/projects/mtn"
alias ca="conda activate ./venv"
alias r="ranger"
alias cn="cd ~/.config/nvim"
alias e="echo $git"
alias fd="fdfind"
alias da="conda deactivate"
alias lg="lazygit"
alias dl="yt-dlp"
# Obsidian
alias oo="cd /media/bappa/DATA/obsidian/notes/"
alias ob="~/applications/Obsidian-1.8.4.AppImage --no-sandbox"

# tmux
alias t="tmux new -s HOME -c ~"
alias tk="tmux kill-server"
alias tl="tmux ls"  # list tmux sessions
alias tt="tmuxhere"

# alias for eza and zoxide
alias ls='eza --icons=always'
# eval "$(zoxide init zsh)"
alias cd="z"
alias y="yazi"

set -o vi

# own functions 
mkcd () {
  mkdir -p "$1" && cd "$1"
}

# Function to create or attach to tmux session named after current directory
tmuxhere() {
    # Get the current directory name, strip any leading path
    local SESSION_NAME=$(basename "$PWD" | tr . _)
    
    # Check if tmux is already running
    if [[ -z "$TMUX" ]]; then
        # Check if a session with this name exists
        if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
            # If exists, attach to it
            tmux attach-session -t "$SESSION_NAME"
        else
            # If doesn't exist, create new session and attach
            tmux new-session -s "$SESSION_NAME"
        fi
    else
        echo "Already inside a tmux session"
    fi
}
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bappa/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bappa/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/bappa/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/bappa/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export RANGER_LOAD_DEFAULT_RC=false

# fzf 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"
export FZF_DEFAULT_COMMAND="fdfind --type f"

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


# zoxide init for zsh
eval "$(zoxide init zsh)"

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# export PATH="/home/linuxbrew/.linuxbrew/opt/node@18/bin:$PATH"

# yazi config from docs.
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
eval "$(uv generate-shell-completion zsh)"
