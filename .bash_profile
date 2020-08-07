### set up global environment for a tty session

# set up terminal (after the code above has possibly updated TERM and other vars)
. ~/.bash_functions/term; term $TERM

# display-independent session customization (shared by .bash_profile & .xsession)
. ~/.bash_session

# i'm really lazy
[[ $INIT_CD ]] && eval cd $INIT_CD

# run the command ONCE 'once' :-). SIGINT's trap to interactive shell
# afterwards, leaving $ONCE set with the command string.
[[ $ONCE ]] && exec $BASH -i -c "once $ONCE"
