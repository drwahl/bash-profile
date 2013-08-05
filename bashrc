# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

os=`uname -s`
whoami=`who | awk '{print $1}' | head -1`

#set some easily callable variables for colors
Color_Off='\e[0m'       # Text Reset
### Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
### Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White
### Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White
### Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White
### High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White
### Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White
### High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[10;95m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White

#########################################
### start ###############################
### modifications to history settings ###
#########################################

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

HISTIGNORE="reboot:shutdown *:ls:pwd:exit:mount:man *:history"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=10000
export HISTFILESIZE=10000

#append to history, don't overwrite
shopt -s histappend
PROMPT_COMMAND='history -a'

#########################################
### end #################################
### modifications to history settings ###
#########################################

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

#######################################################
### start #############################################
### modifications to PS1 prompt. order is important ###
#######################################################
color_prompt=true

PS1='\u@\h:\w'

#GNU Screen aware prompt
if [[ "$STY" ]] ; then
    if [[ "$color_prompt" ]]; then
        PS1='\u@\h[\[\e[34;1m\]$STY\[\e[0m\]]:\w'
    else
        PS1='\u@\h[$STY]:\w'
    fi
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

#git aware prompt
#assume we are on linux, unless we know we are on mac
if [[ $os == "Linux" ]]; then
    if [ -e /usr/share/bash-completion/completions/git ]; then
        git_completion="/usr/share/bash-completion/completions/git"
    elif [ -e /etc/bash_completion.d/git ]; then
        git_completion="/etc/bash_completion.d/git"
    fi
elif [[ $os == "Darwin" ]]; then
    git_completion="/opt/local/share/doc/git-core/contrib/completion/git-completion.bash"
    . $git_completion
else
    unset git_completion
fi

if [[ "$git_completion" ]]; then
    if [ -f $git_completion ]; then
        export GIT_PS1_SHOWDIRTYSTATE=true
        export GIT_PS1_SHOWUNTRACKEDFILES=true
        export GIT_PS1_SHOWSTASHSTATE=true
        if [[ "$color_prompt" ]]; then
            PS1="$PS1\$(__git_ps1 ' [\[\e[34;1m\]%s\[\e[0m\]]')"
        else
            PS1="$PS1\$(__git_ps1 ' [%s]')"
        fi
    fi
fi

#svn aware prompt
if [ -f ~/.bash/subversion-prompt ]
then
    SVNP_HUGE_REPO_EXCLUDE_PATH="nufw-svn$|/tags$|/branches"
    . ~/.bash/subversion-prompt
    if [[ "$color_prompt" ]]; then
        PS1="$PS1\[\e[34;1m\]\$(__svn_stat)\[\e[0m\]"
    else
        PS1="$PS1\$(__svn_stat)"
    fi
fi

uid=`id -u`
if [ "$uid" == 0 ]; then
    PS1="$PS1 # "
else
    PS1="$PS1 \$ "
fi

#######################################################
### end ###############################################
### modifications to PS1 prompt. order is important ###
#######################################################

#enable color support to ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

#enable colors for git
if [ -f /usr/bin/git ]; then
    git config --global color.diff True
    git config --global color.branch True
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
#load user specific aliases
if [ -f ~/.bash_aliases.$whoami ]; then
    . ~/.bash_aliases.$whoami
fi

export EDITOR="vim"

#feels like root, even when you aren't
export PATH=$PATH:/usr/local/sbin:/sbin/:/usr/sbin
#if we are on mac, include port installed stuff
if [[ $os == "Darwin" ]]; then
    export PATH=$PATH:/opt/local/bin/
fi
#include bin directory in users homedir
if [ -d ~/bin ]; then
    export PATH=$PATH:~/bin
fi

#work-around for libnss3/sipe (http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=649456)
export NSS_SSL_CBC_RANDOM_IV=0

#################################################################
### start #######################################################
### tab completion extentions. tab completion makes life good ###
#################################################################

#tab completion for ssh hosts
if [ -f ~/.ssh/known_hosts ]; then
    complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
fi

# enable programmable completion features (you don't need to enable
# this if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#################################################################
### end #########################################################
### tab completion extentions. tab completion makes life good ###
#################################################################

#########################################
### start ###############################
### ssh related stuff, like ssh-agent ###
#########################################


## FIXME ## doesn't test ssh-add for success, should add that

tmpdir="/tmp/`whoami`"
start_agent() {
        mkdir -m700 $tmpdir
        ssh-agent | grep -v echo > $tmpdir/agent.sh
        chmod 600 $tmpdir/agent.sh
        source $tmpdir/agent.sh
        ssh-add
        }

cleanup() {
        # soemthing wrong, flatten all
        rm -rf $tmpdir
        killall ssh-agent
        }

test=`ps -ef | grep [s]sh-agent | awk '{print $2}'`
if [ "$test" != "" ]; then
   # there is  an agent running, check for agent.sh file
   if [ -e "$tmpdir/agent.sh" ]; then
      source $tmpdir/agent.sh
   else
      # No agent.sh file, orphaned ssh-agent, kill it and restart it.
      cleanup
      start_agent
   fi;
else
   # No ssh-agent running, starting a  new one
   start_agent
fi;

#########################################
### end #################################
### ssh related stuff, like ssh-agent ###
#########################################

#after loading everything that is generic to our environment, load user specifc stuff
[ -f ~/.bashrc.$whoami ] && . ~/.bashrc.$whoami
