#add some color to our terminal, if ls supports it
ls_color_support=`ls --color 2>/dev/null 1>/dev/null ; echo $?`
if [ $ls_color_support == "0" ]; then 
    alias ls='ls --color=auto'
    alias ll='ls --color=auto -l'
    alias grep='grep --color=auto'
fi

#careful copy, don't overwrite by default
alias cp='cp -ip'

# User specific aliases and functions
alias gpa="GIT_CURRENT=\`git branch | grep \* | awk '{print \$2}'\`; for x in \`git branch | tr -d \* \`; do git checkout \$x && git pull; done; git checkout \$GIT_CURRENT"
alias freshen_repos="for repo in * ;do cd $repo ;gpa ;cd - ;done"


#for those of us with lazy thumbs/stiff space bars
alias cd..='cd ../'

#check alias when querying 'which'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
