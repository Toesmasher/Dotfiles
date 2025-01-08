
switch (uname -s)
  case FreeBSD
    alias ls "ls -CFG"
    ;;

  case Linux
    alias reflector_se "sudo reflector --country Sweden --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
    ;;
end
