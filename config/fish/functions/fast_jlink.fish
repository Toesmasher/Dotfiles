function fast_jlink
  set TELNETPORT "$argv[1]"
  set USB "$argv[2]"

  set EXTRAARGS ""
  if test ! -z "$TELNETPORT"
    set EXTRAARGS "$EXTRAARGS -RTTTelnetPort $TELNETPORT"
  end
  if test ! -z "$USB"
    set EXTRAARGS "$EXTRAARGS -USB $USB"
  end

  eval JLinkExe -Device NRF52840_XXAA -If SWD -Speed 4000 -AutoConnect 1 $EXTRAARGS
end
