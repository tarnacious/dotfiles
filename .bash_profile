export PATH=$PATH:$HOME/.bin
export PGHOST=localhost
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim
export NVM_DIR="/home/dev/.nvm"
export DISPLAY=:0
export HISTCONTROL=ignoredups
export CHROME_BIN=/usr/bin/chromium

alias svg="feh --magick-timeout 1"
alias pdf="apvlv"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias sendmail="msmtp -a seedad"
alias ios-debug="ios_webkit_debug_proxy -f chrome-devtools://devtools/bundled/inspector.html"

parse_git_branch() {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  echo " ($git_branch) "
}

PS1="${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u@\h\[\033[00m\]:\[\033[01;32m\]\w\[\033[00m\]\[\033[01;31m\]\$(parse_git_branch)\[\033[00m\]$ "

if [ -d "$HOME/.rbenv" ]; then
  echo "configuring rbenv"
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
else
  echo "rbenv not installed"
fi

if [ -f "/usr/share/nvm/init-nvm.sh" ]; then
  echo "configuring nvm"
  source /usr/share/nvm/init-nvm.sh
else
  echo "nvm not installed"
fi

if [ -f "$HOME/.fzf.bash" ]; then
  echo "configuring fzf"
  source ~/.fzf.bash
else
  echo "fzf not installed"
fi

if [ -n "$SSH_AUTH_SOCK" ]; then
  echo "assuming ssh agent is forwarded"
else
  echo "using gpg ssh agent"
  unset SSH_AGENT_PID
  if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
  fi
fi

#eval `ssh-agent -s`


for f in ~/.profiles/*; do
   . $f
done
