#!/bin/bash

# Platform-specific setups
unamestr=$(uname)
case $unamestr in
  'Darwin')        # OSX
    # Set up MacPorts paths
    #export PATH=/opt/local/libexec/gnubin/:/opt/local/bin:/opt/local/sbin:$PATH
    #export MANPATH=/opt/local/share/man:$MANPATH
    # Give precedence to user/local/bin because that's where Homebrew installs their stuff
    export PATH=/usr/local/bin:$PATH

    # Path extension for Haskell Platform on OSX
    export PATH="$HOME/Library/Haskell/bin:$PATH"

    # I can set alias ls=ls_osx if I don't have gnu coreutils installed
    alias ls_osx="ls -p -F -G -h"
    # Colorize ls
    export LSCOLORS=hxdxDxGxbxfxFxBxBxHxHx

    # Attempt at fixing OSX tomfoolery
    export ARCHFLAGS="-arch x86_64"

    # Add homebrew bash completion file
    source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
    ;;

  'Linux')
    if command -v keychain ; then
      keychain id_rsa
      . ~/.keychain/`uname -n`-sh
    fi

    # set variable identifying the chroot you work in
    if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
      debian_chroot=$(cat /etc/debian_chroot)
    fi
esac

# Handle potential pagers
if [[ -n `command -v vimpager` ]] ; then
  export PAGER=vimpager
else
  if [[ -n `command -v vimless` ]] ; then
    export PAGER=vimless
  fi
  if [[ -n `command -v vimman` ]] ; then
    export MANPAGER=vimman
  fi
fi

# add path to user bin and xbin directories
export PATH=$HOME/bin:$HOME/xbin:$PATH:$HOME/phantomjs/bin

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

# load up my git-enabled prompt
source git_prompt

# load up bash completion scripts from other people
source git-completion.bash
source git-flow-completion.bash

# searches for given string in filenames in current and all subdirectories
function s { find . -nowarn -name "*$1*" 2>/dev/null; }
# searches for given filename exactly in current and all subdirectories
function ss { find . -nowarn -name "$1" 2>/dev/null; }

# ls with showall, colors, and /'s after directories
alias ls="ls -AFhxX --color --group-directories-first "
alias l="\ls -FhxX --color --group-directories-first "
alias ll='ls -alF'
alias lk="ls -gGhLXS"
alias la='ls -A'

# makes sure bash knows it's dealing with a color terminal-emulator and sets the colors for ls
# LSCOLORS is BSD/OSX format, LS_COLORS is linux format
export CLICOLOR=1

# grep customizations
alias grep='grep -Hns --binary-files=without-match --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
function gr { grep -R $1 $2./*; }
function grr { grep -R $*; }

function rg { find . -name '*.*rb' -exec grep "$*" {} \; -print; }

# diff with unified format (why use anything else?!)
alias diff='diff -U3'

# prints out the ps header and then displays all processes matching the given argument
function psg { ps -A | awk 'NR==1; /'$1'/&&!/awk/'; }

# spell checker
function spell { echo $@|aspell -a; }

# bash history: removes dups, increases size, and saves on shell exit
export HISTCONTROL=ignoredups:ignorespace
export HISTSIZE=10000
export HISTFILESIZE=2000
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Extra alias definitions
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# Load RVM if available
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

