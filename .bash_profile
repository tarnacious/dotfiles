PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.bin # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=$PATH:/home/dev/x-tools/arm-unknown-linux-gnueabi/bin
export PGHOST=localhost
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


alias svg="feh --magick-timeout 1"
alias pdf="apvlv"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias sendmail="msmtp -a seedad"
alias ios-debug="ios_webkit_debug_proxy -f chrome-devtools://devtools/bundled/inspector.html"

destroy_branch() {
    git branch --delete $1
    git push origin --delete $1
}

close_port() {
    if [ -z "$1" ]; then
        echo "Usege: close_port PORT"
    else 
        echo "Closing port $1"
        iptables -D INPUT -p tcp --dport $1 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
        iptables -D OUTPUT -p tcp --sport $1 -m conntrack --ctstate ESTABLISHED -j ACCEPT
    fi
}

open_port() {
    if [ -z "$1" ]; then
        echo "Usege: open_port PORT"
    else 
        echo "Opening port $1"
        iptables -I INPUT -p tcp --dport $1 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
        iptables -I OUTPUT -p tcp --sport $1 -m conntrack --ctstate ESTABLISHED -j ACCEPT
    fi
}

map_port80() {
    if [ -z "$1" ]; then
        echo "Usege: map_port PORT"
    else 
        echo "Mapping port 80 to $1"
        iptables -A PREROUTING -t nat -p tcp --dport 80 -j REDIRECT --to-port $1
        iptables -A OUTPUT -t nat -o lo -p tcp --dport 80 -j REDIRECT --to-port $1
    fi
}

unmap_port80() {
    echo "hello"
}


export NVM_DIR="/home/dev/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export CHROME_BIN=/usr/bin/chromium 
