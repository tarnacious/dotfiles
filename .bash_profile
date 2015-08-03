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
 
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u@\h\[\033[00m\]:\[\033[01;32m\]\w\[\033[00m\]\[\033[01;31m\]\$(parse_git_branch)\[\033[00m\]$ "

function mountAndroid { hdiutil attach ~/projects/android/android.dmg.sparseimage -mountpoint /Volumes/android; }

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


export JAVA_HOME=$(/usr/libexec/java_home)
export SHIFT_CONFIG_BASE=/Users/tarn/projects/etc
