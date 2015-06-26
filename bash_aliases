#add some color to our terminal, if ls supports it
ls_color_support=`ls --color 2>/dev/null 1>/dev/null ; echo $?`
if [ $ls_color_support == "0" ]; then 
    alias ls='ls --color=auto'
    alias ll='ls --color=auto -l'
    alias grep='grep --color=auto'
fi

#careful copy, don't overwrite by default
alias cp='cp -ip'

#for those of us with lazy thumbs/stiff space bars
alias cd..='cd ../'

#check alias when querying 'which'
# Doesn't work on Debian derived distros. Removing for now. 
#alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

#openstack aliases which provide bash-completion support
NOVA_OUTPUT_LOG=$(mktemp)
GLANCE_OUTPUT_LOG=$(mktemp)
CINDER_OUTPUT_LOG=$(mktemp)
KEYSTONE_OUTPUT_LOG=$(mktemp)
export NOVA_OUTPUT_LOG GLANCE_OUTPUT_LOG CINDER_OUTPUT_LOG KEYSTONE_OUTPUT_LOG
_nova() {
	nova $* | tee -a $NOVA_OUTPUT_LOG
}
alias nova="_nova $*"
_glance() {
	glance $* | tee -a $GLANCE_OUTPUT_LOG
}
alias glance="_glance $*"
_cinder() {
	cinder $* | tee -a $CINDER_OUTPUT_LOG
}
alias cinder="_cinder $*"
_keystone() {
	keystone $* | tee -a $KEYSTONE_OUTPUT_LOG
}
alias keystone="_keystone $*"
