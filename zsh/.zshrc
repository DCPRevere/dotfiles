# Path to your oh-my-zsh installation.
export ZSH=/home/dare/.oh-my-zsh

ZSH_THEME="agnoster"
RPROMPT="[%D{%Y-%m-%d} %*]"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    command-not-found
    debian
    dirhistory
    docker
    git
    git-extras
    github
    gitignore
    git-hubflow
    history-substring-search
    lein
    mvn
    pass
    vi-mode
    web-search
)

# User configuration
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

ALIASES=~/.aliases.zsh
if [[ -a $ALIASES ]]; then
    source $ALIASES
fi

# Local aliases are not source controlled
LOCAL_ALIASES=~/.aliases.local.zsh
if [[ -a $LOCAL_ALIASES ]]; then
    source $LOCAL_ALIASES
fi

# Use emacs as EDITOR
export ALTERNATE_EDITOR=emacs EDITOR="emacsclient -c" VISUAL="emacsclient -c"

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Use VIM keybindings
set -o vi

# Syntax highlighting
source ~/.zsh.d/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History substring search
source ~/.zsh.d/zsh-history-substring-search/zsh-history-substring-search.zsh

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Set key repeat delay and rate
xset r rate 150 50

# Remap CAPS --> ESC
setxkbmap -option caps:escape
