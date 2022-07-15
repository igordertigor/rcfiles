MAIL=$HOME/.Mail
MAILDIR=archive/$1

# Create maildir
for d in cur new tmp;
do
  mkdir -p $MAIL/$MAILDIR/$d
done

# Add to muttrc
echo TODO: Add $MAILDIR to mailboxes in muttrc

# Update command
echo TODO: Update archiving command in filtering
