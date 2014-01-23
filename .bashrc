# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -atrlF'
alias la='ls -A'
alias l='ls -CF'
alias p='python'
alias ut='python -m unittest'
alias api='cd /home/ivan/workspace/blibb-api'
alias web=' cd /home/ivan/workspace/blibb-web'
alias depweb='cd /home/ivan/workspace/deploy-web'
alias depap='cd /home/ivan/wokspace/deploy-api'
alias ..='cd ..'
alias gs='git status'
alias gc='git commit -m'
alias gp='git pull'
alias ga='git add .'
alias size='du -hs'

# ----------------------------------------------------------------------
# ALIASES / FUNCTIONS
# ----------------------------------------------------------------------

# disk usage with human sizes and minimal depth
alias du1='du -h --max-depth=1'
alias fn='find . -name'
alias hi='history | tail -20'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# function definitions
if [ -f ~/.functions ]; then
    . ~/.functions
fi

# z directory frequency
. ~/bin/z.sh

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

rfkill unblock all

# Everyone needs a little color in their lives
RED='\[\033[31m\]'
GREEN='\[\033[32m\]'
YELLOW='\[\033[33m\]'
BLUE='\[\033[34m\]'
PURPLE='\[\033[35m\]'
CYAN='\[\033[36m\]'
WHITE='\[\033[37m\]'
NIL='\[\033[00m\]'

# Hostname styles
FULL='\H'
SHORT='\h'

# System => color/hostname map:
# UC: username color
# LC: location/cwd color
# HD: hostname display (\h vs \H)
# Defaults:
UC=$GREEN
LC=$BLUE
HD=$FULL

# Prompt function because PROMPT_COMMAND is awesome
function set_prompt() {
    # show the host only and be done with it.
    host="${UC}${HD}${NIL}"

    # Special vim-tab-like shortpath (~/folder/directory/foo => ~/f/d/foo)
    _pwd=`pwd | sed "s#$HOME#~#"`
    if [[ $_pwd == "~" ]]; then
       _dirname=$_pwd
    else
       _dirname=`dirname "$_pwd" `
        if [[ $_dirname == "/" ]]; then
              _dirname=""
        fi
       _dirname="$_dirname/`basename "$_pwd"`"
    fi
    path="${LC}${_dirname}${NIL}"
    myuser="${UC}\u@${NIL}"

    # Dirtiness from:
    # http://henrik.nyh.se/2008/12/git-dirty-prompt#comment-8325834
    if git update-index -q --refresh 2>/dev/null; git diff-index --quiet --cached HEAD --ignore-submodules -- 2>/dev/null && git diff-files --quiet --ignore-submodules 2>/dev/null
        then dirty=""
    else
       dirty="${RED}*${NIL}"
    fi
    _branch=$(git symbolic-ref HEAD 2>/dev/null)
    _branch=${_branch#refs/heads/} # apparently faster than sed
    branch="" # need this to clear it when we leave a repo
    if [[ -n $_branch ]]; then
       branch=" ${NIL}[${PURPLE}${_branch}${dirty}${NIL}]"
    fi

    # Dollar/pound sign
    end="${LC}\$${NIL} "

    # Virtual Env
    if [[ $VIRTUAL_ENV != "" ]]
       then
           venv=" ${RED}(${VIRTUAL_ENV##*/})"
    else
       venv=''
    fi

    export PS1="${myuser}${path}${venv}${branch} ${end}"
}

export PROMPT_COMMAND=set_prompt
export ANDROID_HOME=/home/ivan/bin/android-sdk-linux


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH:/home/ivan/bin/android-sdk-linux/platform-tools:/home/ivan/bin:/home/ivan/bin/android-sdk-linux/tools"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/home/ivan/.gvm/bin/gvm-init.sh" ]] && source "/home/ivan/.gvm/bin/gvm-init.sh"
