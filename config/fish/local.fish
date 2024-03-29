if test -z "$LOCAL_FISH"
  set -gx PATH $PATH /.local/bin
  set -gx PATH $PATH /opt/gcc-arm-none-eabi-10.3-2021.10/bin
  set -gx PATH $PATH /opt/JLink_Linux_V770_x86_64
  set -gx PATH $PATH /opt/nrf-command-line-tools/bin

  set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH /opt/JLink_Linux_V770_x86_64

  # NRF5-SDK-specific
  set -gx GNU_INSTALL_ROOT (dirname (which arm-none-eabi-gcc))/

  set -gx LOCAL_FISH 1
end
