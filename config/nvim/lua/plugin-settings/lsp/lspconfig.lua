local h = require('helpers')

local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
  return
end

-- Define keybinds
local lsp_keybinds = function()
  local keys = {
    -- LSP Navigation
    { 'n', '<Leader>nd', ':lua vim.lsp.buf.declaration()<CR>',    h.key_opts_default },
    { 'n', '<Leader>ni', ':lua vim.lsp.buf.definition()<CR>',     h.key_opts_default },
    { 'n', '<Leader>no', ':lua vim.lsp.buf.implementation()<CR>', h.key_opts_default },
    { 'n', '<Leader>nb', '<C-o',                                  h.key_opts_default },

    -- LSP Symbols, via saga
    { 'n', '<Leader>nc', ':Lspsaga hover_doc<CR>',                h.key_opts_default },
    { 'n', '<Leader>nx', ':Lspsaga rename<CR>',                   h.key_opts_default },
    { 'n', '<Leader>nr', ':Lspsaga lsp_finder<CR>',               h.key_opts_default },
  }
  h.map_keys(keys)
end

-- Define autocmd
local lsp_autocmd = function()
  local group = vim.api.nvim_create_augroup("ToeLSP", { clear = true })

  vim.api.nvim_create_autocmd('CursorHold',
    { command = 'Lspsaga show_line_diagnostics', group = group })
  vim.api.nvim_create_autocmd('CursorHoldI',
    { command = 'Lspsaga signature_help', group = group})
end

local default_attach = function(client)
  lsp_keybinds()
  lsp_autocmd()

  -- Disable diagnostic virtual text.
  vim.diagnostic.config({
    virtual_text = false,
    underline = true,
    severity_sort = true,
  })
end

-- Get capabilities, attach CMP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
capabilities.offsetEncoding = { 'utf-16' } -- Temporary fix for clangd + NullFS

-- Start up the servers
lspconfig.clangd.setup({
  capabilities = capabilities,

  -- Disable formatter, let uncrustify do it via null-ls
  on_attach = function(client)
    default_attach()
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
})

lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = default_attach
})

lspconfig.sumneko_lua.setup({
  capabilities = capabilities,
  on_attach = default_attach,
})
