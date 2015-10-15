alias tmux="TERM=screen-256color-bce tmux"
PATH=/usr/local/bin:/usr/bin:$PATH
PATH=$PATH:$HOME/Library/Haskell/ghc-7.6.3/lib/haste-compiler-0.2.99/bin/

# Append current git branch in prompt
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
 
parse_git_branch() {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  echo " ($git_branch) "
}
 

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


