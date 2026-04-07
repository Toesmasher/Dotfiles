if type -q bat
  alias cat bat
end

if type -q rg
  alias rg "rg --hidden"
end

if type -q eza
  alias ll "eza -la --color=always --group-directories-first --icons"
  alias le "eza -a --color=always --group-directories-first --icons"
end

switch (uname -s)
  case FreeBSD
    alias ls "ls -CFG"
    ;;

  case Linux
    alias reflector_se "sudo reflector --country Sweden --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
    ;;
end
