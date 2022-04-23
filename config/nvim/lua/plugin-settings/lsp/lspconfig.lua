local h = require('helpers')

local status_ok, lspconfig = pcall(require, 'lspconfig')
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
    { 'n', '<Leader>nb', '<C-o>',                                 h.key_opts_default },

    -- LSP Saga
    { 'n', '<Leader>nc', ':Lspsaga hover_doc<CR>',                h.key_opts_default },
    { 'n', '<Leader>nx', ':Lspsaga rename<CR>',                   h.key_opts_default },
    { 'n', '<Leader>nr', ':Lspsaga lsp_finder<CR>',               h.key_opts_default },
  }
  h.map_keys(keys)
end

-- Define autocmd
local lsp_autocmd = function()
  local cmds = {
    { 'CursorHold',  { group = group, command = 'Lspsaga show_line_diagnostics' } },
    { 'CursorHoldI', { group = group, command = 'Lspsaga signature_help' } },
  }
  h.create_autocmds('ToeLsp', cmds)
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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { 'utf-16' } -- Temporary fix for clangd + null-ls

-- The servers
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

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        },
      },
    },
  },
})
