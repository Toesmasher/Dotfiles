local h = require('helpers')

local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

-- Define keybinds
local lsp_keybinds = function()
  local keys = {
    -- LSP Navigation
    { 'n', '<Leader>nd', vim.lsp.buf.declaration },
    { 'n', '<Leader>ni', vim.lsp.buf.definition },
    { 'n', '<Leader>no', vim.lsp.buf.implementation },
    { 'n', '<Leader>nb', '<C-o>' },

    -- LSP Saga
    { 'n', '<Leader>na', ':Lspsaga code_action<CR>' },
    { 'n', '<Leader>nc', ':Lspsaga hover_doc<CR>' },
    { 'n', '<Leader>nx', ':Lspsaga rename<CR>' },
    { 'n', '<Leader>nr', ':Lspsaga lsp_finder<CR>' },

    -- Symbols-Outline
    { 'n', '<Leader>ns', ':SymbolsOutline<CR>' },
  }
  h.map_keys(keys)
end

-- Define autocmd
local function lsp_autocmd()
  local cmds = {
    { 'CursorHold',  { command = 'Lspsaga show_line_diagnostics' } },
    --{ 'CursorHoldI', { command = 'Lspsaga signature_help' } },
  }
  h.create_autocmds('ToeLsp', cmds)
end

local function default_attach(client)
  lsp_keybinds()
  lsp_autocmd()

  -- Disable diagnostic virtual text.
  vim.diagnostic.config({
    virtual_text = false,
    underline = true,
    severity_sort = true,
    update_in_insert = true,
  })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { 'utf-16' } -- Temporary fix for clangd + null-ls

-- The servers
lspconfig.clangd.setup({
  capabilities = capabilities,

  -- Disable formatter, let uncrustify do it via null-ls
  on_attach = function(client)
    default_attach(client)
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
