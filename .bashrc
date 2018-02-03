echo "executing bashrc"
cd ~/
eval `ssh-agent -s`
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.bin # Add RVM to PATH for scripting
export PGHOST=localhost

# Append current git branch in prompt
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export _JAVA_AWT_WM_NONREPARENTING=1


parse_git_branch() {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  echo " ($git_branch) "
}

PS1="${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u@\h\[\033[00m\]:\[\033[01;32m\]\w\[\033[00m\]\[\033[01;31m\]\$(parse_git_branch)\[\033[00m\]$ "

export XAUTHORITY=~/.Xauthority
export EDITOR=vim


export PATH=$PATH:/home/dev/x-tools/arm-unknown-linux-gnueabi/bin
export PATH=$PATH:$HOME/.bin 
export LD_LIBRARY_PATH=~/projects/arm-rust-cross-compiler/bin/lib/
export PATH=$PATH:~/projects/arm-rust-cross-compiler/bin/bin/

export NVM_DIR="/home/dev/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export CHROME_BIN=/usr/bin/chromium 


eval "$(rbenv init -)"
source /usr/share/nvm/init-nvm.sh
