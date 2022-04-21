require('plugins')

local group = vim.api.nvim_create_augroup('ToeInit', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost',
  { pattern = '*nvim/*.lua', command = 'source <afile>', group = group })
vim.api.nvim_create_autocmd('BufWritePost',
  { pattern = '*lua/plugins.lua', command = 'PackerSync', group = group })
vim.api.nvim_create_autocmd('VimResized',
  { command = 'wincmd =', group = group })

require('keymapping')
require('options')

require('plugin-settings.bufferline')
require('plugin-settings.cmp')
require('plugin-settings.colorizer')
require('plugin-settings.gitsigns')
require('plugin-settings.hop')
require('plugin-settings.lualine')
require('plugin-settings.nvim-notify')
require('plugin-settings.nvimtree')
require('plugin-settings.project')
require('plugin-settings.telescope')
require('plugin-settings.tree-sitter')

require('plugin-settings.lsp.lspconfig')
require('plugin-settings.lsp.lspsaga')
require('plugin-settings.lsp.null-ls')

--require('plugin-settings.colors.dracula')
--require('plugin-settings.colors.darkplus')
require('plugin-settings.colors.gruvbox')
