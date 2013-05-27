# some more ls aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -atrhlF'
alias la='ls -Ah'
alias l='ls -CFh'
alias log='tail -f /var/log/nginx/error.log'
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
alias i='sudo apt-get install'
alias u='sudo apt-get update'
# ----------------------------------------------------------------------
# ALIASES / FUNCTIONS
# ----------------------------------------------------------------------

# disk usage with human sizes and minimal depth
alias du1='du -h --max-depth=1'
alias fn='find . -name'
alias hi='history | tail -20'
alias s='sudo'

alias lolcat='adb logcat | coloredlogcat.py'
#API
function jsonCurl(){
	if [ $1 ];then
		curl $1 | pjson
	else
		echo "No url present"
	fi
}


