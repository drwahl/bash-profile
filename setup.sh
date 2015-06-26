#this script will setup bash specifics using the configs in this repo

files="bash bash_profile bash_login bash_aliases bashrc profile bash_completion"
date=`date +"%Y%m%d"`

for file in $files; do
    if [ -h ~/.$file ]; then
        unlink ~/.$file
    else
        if [ -f ~/.$file ]; then
            echo "backing up ~/.$file to ~/.$file.bak$date"
            mv ~/.$file ~/.$file.bak$date
        fi
    fi
    echo "symlinking $PWD/$file to ~/.$file"
    ln -s $PWD/$file ~/.$file
done


if [ -d ~/bin ]
	then cp -d bin/* ~/bin
else cp -rd bin ~/bin
fi

