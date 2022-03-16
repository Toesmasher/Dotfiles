require('plugins')

local status_ok, _ = pcall(require, 'packer')
if not status_ok then
  vim.notify('No packer available!')
  return
end

-- Resource files on update and sync plug-ins if necessary
vim.cmd([[
  augroup LuaConfig
    autocmd!
    autocmd BufWritePost *nvim/*.lua source <afile>
    autocmd BufWritePost *lua/plugins.lua PackerSync
  augroup end
]])

require('keymapping')
require('options')

require('plugin-settings.bufferline')
require('plugin-settings.cmp')
require('plugin-settings.colorizer')
require('plugin-settings.gitsigns')
require('plugin-settings.lualine')
require('plugin-settings.nvimtree')
require('plugin-settings.tree-sitter')

require('plugin-settings.lsp')

require('plugin-settings.colors.dracula')
--require('plugin-settings.colors.darkplus')
--require('plugin-settings.colors.gruvbox')

vim.cmd([[
  autocmd VimResized * wincmd =
  hi Normal guibg=None ctermbg=None
]])
