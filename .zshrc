# ---------- Editor ----------
export EDITOR=nvim
export VISUAL=$EDITOR

# ---------- History ----------
export HISTORY_IGNORE='(history|hist|pwd|ls|ll|la)'
setopt HIST_IGNORE_SPACE

# ---------- Directory navigation ----------
setopt AUTO_CD               # type a dir name to cd into it
setopt AUTO_PUSHD            # cd pushes onto the dir stack
setopt PUSHD_IGNORE_DUPS     # no duplicate dirs on the stack
setopt PUSHD_SILENT          # don't print the stack after pushd/popd
# Using the dir stack these build:
#   dirs -v     list visited dirs, newest first (0 = current)
#   cd -<TAB>   menu to jump back to any visited dir
#   cd -2       jump straight to stack position 2
#   cd -        toggle to the previous dir
#   ~2 / ~-     reference stack position 2 / the previous dir in any command (e.g. cp file.txt ~2)

[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases
