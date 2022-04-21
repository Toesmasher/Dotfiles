local h = require('helpers')

local g = {
  mapleader = ' ',
  maplocalleader = ' ',
}
h.set_globals(g)

-- Modes: 'n'ormal, 'i'nsert, 'v'isual, 'x'visual_block, 't'erm, 'c'ommand
local keys = {
  -- Set space as leader
  {'', '<Space>', '<Nop>', h.key_opts_default},

  -- No prefix bindings
  -- Window selection
  {'n', '<Leader>h',  '<C-w><Left>',  h.key_opts_default},
  {'n', '<Leader>j',  '<C-w><Down>',  h.key_opts_default},
  {'n', '<Leader>k',  '<C-w><Up>',    h.key_opts_default},
  {'n', '<Leader>l',  '<C-w><Right>', h.key_opts_default},

  -- Buffer handling
  {'n', '<Tab>',     ':bnext<CR>',   h.key_opts_default},
  {'n', '<S-Tab>',   ':bprev<CR>',   h.key_opts_default},
  {'n', '<Leader>c', ':Bdelete<CR>', h.key_opts_default},

  -- Prefixed bindings
  -- Splitting, Prefix: <Leader>s
  {'',  's',          '<nop>',  h.key_opts_default},
  {'n', '<Leader>ss', '<C-w>s', h.key_opts_default},
  {'n', '<Leader>sv', '<C-w>v', h.key_opts_default},
  {'n', '<Leader>se', '<C-w>=', h.key_opts_default},
}

h.map_keys(keys)
