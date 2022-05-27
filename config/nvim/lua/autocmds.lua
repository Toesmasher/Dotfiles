local h = require('helpers')

local cmds = {
  -- Reload config files and sync plugins on write
  { 'BufWritePost', { pattern = '*/nvim/*.lua', command = 'source <afile>' } },
  { 'BufWritePost', { pattern = '*lua/plugins.lua', command = 'PackerSync' } },

  -- Resize windows on terminal resize
  { 'VimResized',   { command = 'wincmd =' } },

  -- Add spellcheck for some files
  -- TODO: Figure out how to do setlocal in LUA
  { 'FileType',     { pattern = { 'gitcommit', 'markdown' }, command = 'setlocal spell' } },
}
h.create_autocmds('ToeAutoCmds', cmds)
