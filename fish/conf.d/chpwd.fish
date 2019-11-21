if test "$TERM_PROGRAM" = "Apple_Terminal" -a -z "$INSIDE_EMACS"
  function chpwd;
    set SEARCH ' '
    set REPLACE '%20'
    set REPLACED (string replace -a $SEARCH $REPLACE $PWD)
    set PWD_URL "file://$HOSTNAME$REPLACED"
    printf '\e]7;%s\a' "file://$HOSTNAME$REPLACED"
  end
  chpwd
end
