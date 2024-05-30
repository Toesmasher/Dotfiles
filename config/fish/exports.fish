set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx ELECTRON_OZONE_PLATFORM_HINT "wayland"

if type -q nvim
  set -gx PAGER "nvim +Man!"
  set -gx EDITOR "nvim"
end

if type -q brave
  set -gx BROWSER "brave"
end

set -gx PASSWORD_STORE_GPG_OPTS "--force-mdc"
