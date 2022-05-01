local common = require("plugin-settings.lsp.server-settings.common_functions")

return {
  on_attach = common.default_attach,

  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [ vim.fn.expand('$VIMRUNTIME/lua') ] = true,
        }
      },
    },
  },
}
