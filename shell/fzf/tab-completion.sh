#===============================================================================
# Custom options for fzf tab completion.
# https://github.com/lincheney/fzf-tab-completion?tab=readme-ov-file#specifying-custom-fzf-options
#===============================================================================

preview_dir='eval $CMD_LIST_DIR --tree {1}'
preview_file='eval $CMD_PAGER {1}'

zstyle ':completion::*:*' fzf-completion-opts --preview="[[ -d {2} ]] && ${preview_dir} || ([[ -f {2} ]] && eval ${preview_file})"
zstyle ':completion::*:cd::*' fzf-completion-opts --preview="${preview_dir}"
zstyle ':completion::*:git::git,add,*' fzf-completion-opts --preview='git -c color.status=always status --short'
