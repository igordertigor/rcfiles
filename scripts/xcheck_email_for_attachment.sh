#!/bin/bash

# SENDMAIL=/usr/sbin/sendmail
SENDMAIL="/usr/bin/msmtp"

###
# this script uses a GUI app called "zenity" to ask for confirmation,
# if not in GUI, just let it pass. If you want TUI (not GUI) query,
# which means you replace "zenity" with something else, then
# drop this DISPLAY check.
###
if [ -z "$DISPLAY" ]; then
    exec $SENDMAIL "$@"
fi

###
# save msg in file to re-use it for multiple tests
###
t=`mktemp -t mutt.XXXXXX` || exit 2
cat > $t

###
# define tests for: anything you can think of can be done.
# the return code of last exec'ed cmd is used in final decision below
###
function multipart {
    grep -q '^Content-Type: multipart' $t
}

function word-attach {
    grep -v '^>' $t | egrep -q 'attach|Anhang|anh|angeh|patch|h.ngen'
}

###
# query function must return "true" to let the msg pass.
###
function ask {
    zenity --question --title 'mutt' --text 'Did you include the attachment (if you wanted to)?'
}

###
# FINAL DECISION:
# chain series of functions, use ! || && for logic connections,
# see "man $SHELL" for more possibilites like grouping, dependencies.
###
if multipart || ! word-attach || ask; then
    echo $SENDMAIL "$@" > test.log
    $SENDMAIL "$@" < $t
    status=$?
else
    status=1
fi
rm -f $t
exit $status
