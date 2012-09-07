#add some color to our terminal, if ls supports it
ls_color_support=`ls --color 2>/dev/null 1>/dev/null ; echo $?`
if [ $ls_color_support == "0" ]; then 
    alias ls='ls --color=auto'
    alias ll='ls --color=auto -l'
    alias grep='grep --color=auto'
fi

#careful copy, don't overwrite by default
alias cp='cp -ip'

#usrun is weird... sudo is better
[ -f /usr/bin/usrun ] && alias sudo='usrun'

#for those of us with lazy thumbs/stiff space bars
alias cd..='cd ../'

#check alias when querying 'which'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'