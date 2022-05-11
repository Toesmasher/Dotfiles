local common = require('plugin-settings.lsp.server-settings.common_functions')

local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

local servers = {
  "clangd",
  "pyright",
  "sumneko_lua"
}

local default_setup = {
  on_attach = common.default_attach
}

for _, server in ipairs(servers) do
    local cfg_ok, cfg = pcall(require, 'plugin-settings.lsp.server-settings.' .. server)
    if not cfg_ok then
      cfg = default_setup
    end
    cfg = cfg or default_setup

    lspconfig[server].setup(cfg)
end
