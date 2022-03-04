require('plugin-settings.lsp.lspconfig')
require('plugin-settings.lsp.lspsaga')
require('plugin-settings.lsp.lspsignature')
require('plugin-settings.lsp.null-ls')

-- Let diagnostic use popups instad of virtual text
vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  }
})

vim.cmd([[
  augroup UserLsp
    autocmd!
    autocmd CursorHold  * Lspsaga show_line_diagnostics
    autocmd CursorHoldI * Lspsaga signature_help
    autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()
  augroup end
]])



