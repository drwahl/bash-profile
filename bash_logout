# ~/.bash_logout: executed by bash(1) when login shell exits.

# cleanup our temp files
rm -f $NOVA_OUTPUT_LOG $CINDER_OUTPUT_LOG $GLANCE_OUTPUT_LOG $KEYSTONE_OUTPUT_LOG

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

