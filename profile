#allow users to specify their own ~/.profile
if [ -f ~/.profile.`whoami` ]; then
    source ~/.profile.`whoami`
fi

#ensure our ssh-agent is running and that our keys are added
eval `ssh-agent` > /dev/null
keys=`ssh-add -l > /dev/null ; echo $?`
if [[ $keys != "0" ]]; then
    ssh-add
fi

#move on to .bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
