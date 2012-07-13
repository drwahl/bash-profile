#this script will setup bash specifics using the configs in this repo

files="bash bash_profile bash_login bash_aliases bashrc profile"

#for file in bash_profile bash_login bash_aliases bashrc profile; do
for file in $files; do
    if [ -h ~/.$file ]; then
        true
    else
        if [ -e ~/.$file ]; then
            echo "backing up ~/.$file to ~/.$file.bak"
            mv ~/.$file ~/.$file.bak
        fi
        echo "symlinking $PWD/$file to ~/.$file"
        ln -s $PWD/$file ~/.$file
    fi
done
