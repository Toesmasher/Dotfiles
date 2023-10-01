switch (uname -s)
  case Darwin
    # Do nothing, MacOS should have agent running

  case '*'
    set -gx SSH_AUTH_SOCK /tmp/$USER-ssh-agent.socket

    if test -f $SSH_AUTH_SOCK
      ssh-agent -a $SSH_AUTH_SOCK > /dev/null 2>&1
    end
end
