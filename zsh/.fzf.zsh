# Setup fzf
# ---------
if [[ ! "$PATH" == */home/dare/git/fzf/bin* ]]; then
    export PATH="$PATH:/home/dare/git/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/dare/git/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/dare/git/fzf/shell/key-bindings.zsh"
