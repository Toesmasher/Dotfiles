local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
  return
end

-- Get capabilities, attach CMP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
capabilities.offsetEncoding = { 'utf-16' } -- Temporary fix

-- Start up the servers
lspconfig.ccls.setup({
  capabilities = capabilities,

  -- Put cache in tmp
  init_options = {
    cache = {
      directory = "/tmp/ccls-cache"
    }
  },

  -- Disable formatter, let uncrustify do it via null-ls
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
})

lspconfig.pyright.setup({
  capabilities = capabilities
})
