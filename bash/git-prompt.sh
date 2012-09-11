# Test if git available, if not, don't do the rest
GIT_AVAIL=`which git >/dev/null 2>&1`
RETVAL=$?
	if [ $RETVAL = 0 ]; then
		. /etc/bash_completion.d/git

		export GIT_PS1_SHOWDIRTYSTATE=1
		export GIT_PS1_SHOWUNTRACKEDFILES=1
		export GIT_PS1_SHOWSTASHSTATE=1
		PROMPT='\[\033[0;32m\][\u@\h \[\033[01;34m\]\W\[\033[0;32m\]]\[\033[0;37m\]$(__git_ps1 " (%s)")\[\033[0;31m\]\\$\[\033[0m\] '
	else
		PROMPT='\[\033[0;32m\][\u@\h \[\033[01;34m\]\W\[\033[0;32m\]]\[\033[0;31m\]\\$\[\033[0m\] '
	fi

export PROMPT_COMMAND='PS1="${PROMPT}"'

