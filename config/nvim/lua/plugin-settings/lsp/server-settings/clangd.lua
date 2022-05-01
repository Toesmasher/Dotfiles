local common = require("plugin-settings.lsp.server-settings.common_functions")

-- Set encoding to be compatible with NullLS-uncrustify
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { 'utf-16' }

-- Remove formatting capability from clangd, let NullLS handle it
local function on_attach(client)
  common.default_attach(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

return {
  capabilities = capabilities,
  on_attach = on_attach,
}
