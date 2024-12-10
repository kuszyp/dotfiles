# Setup fzf
# ---------
if [[ ! "$PATH" == */home/kuszyp/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/kuszyp/.fzf/bin"
fi

eval "$(fzf --bash)"
