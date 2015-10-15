PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PGHOST=localhost

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

PS1="${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u@\h\[\033[00m\]:\[\033[01;32m\]\w\[\033[00m\]\[\033[01;31m\]\$(parse_git_branch)\[\033[00m\]$ "

EDITOR=vim
