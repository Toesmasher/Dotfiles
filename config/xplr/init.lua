version = "0.21.2"

local home = os.getenv("HOME")
package.path = home
.. "/.config/xplr/plugins/?/init.lua;"
.. home
.. "/.config/xplr/plugins/?.lua;"
.. package.path

require("tri-pane").setup()

xplr.config.modes.builtin.default.key_bindings.on_key["e"] = {
  help = "open with nvim",
  messages = {
    {
      BashExec0 = [===[
        nvim "${XPLR_FOCUS_PATH:?}"
      ]===]
    }
  }
}

xplr.config.modes.builtin.default.key_bindings.on_key["o"] = {
  help = "open with xdg",
  messages = {
    {
      BashExecSilently0 = [===[
        xdg-open "${XPLR_FOCUS_PATH:?}"
      ]===]
    }
  }
}
