local h = require('helpers')

local g = {
  mapleader = ' ',
  maplocalleader = ' ',
}
h.set_globals(g)

-- Modes: 'n'ormal, 'i'nsert, 'v'isual, 'x'visual_block, 't'erm, 'c'ommand
local keys = {
  -- Set space as leader
  { '', '<Space>', '<Nop>' },

  -- No prefix bindings
  -- Window selection
  { 'n', '<Leader>h',  '<C-w><Left>' },
  { 'n', '<Leader>j',  '<C-w><Down>' },
  { 'n', '<Leader>k',  '<C-w><Up>' },
  { 'n', '<Leader>l',  '<C-w><Right>' },

  -- Buffer handling
  { 'n', '<Tab>',     ':bnext<CR>' },
  { 'n', '<S-Tab>',   ':bprev<CR>' },
  { 'n', '<Leader>c', ':Bdelete<CR>' },

  -- Prefixed bindings
  -- Splitting, Prefix: <Leader>s
  { '',  's',          '<nop>' },
  { 'n', '<Leader>ss', ':split<CR>' },
  { 'n', '<Leader>sv', ':vsplit<CR>' },
  { 'n', '<Leader>se', '<C-w>=' },
}

h.map_keys(keys)
