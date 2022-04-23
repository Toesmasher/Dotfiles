require('plugins')
local h = require('helpers')

local cmds = {
  { 'BufWritePost', { group = group, pattern = '*nvim/*.lua', command = 'source <afile>' } },
  { 'BufWritePost', { group = group, pattern = '*lua/plugins.lua', command = 'PackerSync' } },
  { 'VimResized',   { group = group, command = 'wincmd =' } },
}
h.create_autocmds('ToeInit', cmds)

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
