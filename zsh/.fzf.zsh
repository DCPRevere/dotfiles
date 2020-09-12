# Setup fzf
# ---------
if [[ ! "$PATH" == */home/dare/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/dare/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/dare/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/dare/.fzf/shell/key-bindings.zsh"
