local h = require('helpers')

local g = {
  mapleader = ' ',
  maplocalleader = ' ',
}
h.set_globals(g)

-- Modes: 'n'ormal, 'i'nsert, 'v'isual, 'x'visual_block, 't'erm, 'c'ommand
local n_keys = {
  -- Set space as leader
  { '', '<Space>', '<Nop>' },

  -- No prefix bindings
  -- Buffer handling
  { 'n', '<Tab>',     ':bnext<CR>' },
  { 'n', '<S-Tab>',   ':bprev<CR>' },
  { 'n', '<Leader>c', ':Bdelete<CR>' },

  -- Prefixed bindings
  -- Splitting, Prefix: <Leader>s
  { '',  's',          '<nop>' },
  { 'n', '<Leader>ss', ':split<CR>' },
  { 'n', '<Leader>sv', ':vsplit<CR>' },
  { 'n', '<Leader>se', ':wincmd =<CR>' },

  -- Window selection
  { 'n', '<Leader>h',  ':wincmd h<CR>' }, -- Left
  { 'n', '<Leader>j',  ':wincmd j<CR>' }, -- Down
  { 'n', '<Leader>k',  ':wincmd k<CR>' }, -- Up
  { 'n', '<Leader>l',  ':wincmd l<CR>' }, -- Right
}

local v_keys = {
  -- Indentation re-select
  { 'v', '<', '<gv' },
  { 'v', '>', '>gv' },
}

h.map_keys(n_keys)
h.map_keys(v_keys)
