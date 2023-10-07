function pacman_purge
  sudo pacman -Rcdnus (pacman -Qdttq)
end
