bash-profile
============

This repo contains bash profiling specifics, such as color control or PS1 manipulation, that can be shared with other to increase productivity.  It is suggested to link the default user files (~/.bash_profile, ~/.bash_login, and ~/.profile) to the files in this repo (<git_repo>/bash_profile, <git_repo>/bash_login, and <git_repo>/profile, respectively) then simply update the files in the repo.  Please consider that other users may be using these as well, so please keep the configurations as portable as possible. ./setup.sh has been provided to conveniently do the initial symlink setup.

Installation
============

To install these bash profiling files, run setup.sh.  This will backup anything that may be in it's way (in ~/.<file>.bak), then create symlinks into this repository so you can keep your bash profile updated with just a git pull.

Important Information
=====================

Order of files loaded by a "login" bash shell:

1. /etc/profile
2. ~/.bash_profile
3. ~/.bash_login
4. ~/.profile

Order of files loaded by a non-login shell:

1. /etc/bash.bashrc
2. ~/.bashrc

Difference between each file:

- /etc/profile and /etc/bash.bashrc are system wide files that gets executed by all users by default.
- ~/.profile and ~/.bash_login are loaded when a new shell is spawned that requires login credentials (like new ssh sessions, new terminal sessions, or new X sessions)
- ~/.bashrc is loaded when a new shell is spawned that does not require login credentials (like a new terminal window being spawned inside an existing X session)


Tips/Tricks
===========

Host specific configuration:

The following line can be used to call host specific configurations:

    . `hostname`.rc

Then, you simply need to create a file whose title is the name of the host you want a specific config for, such as 'foo.rc'.


Use external scripts/methods/aliases in bashrc:

To make use of external scripts/methods/aliases in any of the bashrc scripts, please include them in the "bash" folder in this repo, which will be stored as ~/.bash when setup with setup.sh.

Colors reference
================

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

TODO
====

- Make ~/.profile load some stuff that maybe should be in the MOTD, but isn't, like maybe load avarage or system time
