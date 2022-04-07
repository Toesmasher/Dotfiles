local h = require('helpers')

local opts_default = { silent = true, silent = true }

local g = {
  mapleader = ' ',
  maplocalleader = ' ',
}
h.set_globals(g)

-- Modes: 'n'ormal, 'i'nsert, 'v'isual, 'x'visual_block, 't'erm, 'c'ommand
local keys = {
  -- Set space as leader
  {'', '<Space>', '<Nop>', opts_default},

  -- No prefix bindings
  -- Window selection
  {'n', '<Leader>h',  '<C-w><Left>',  opts_default},
  {'n', '<Leader>j',  '<C-w><Down>',  opts_default},
  {'n', '<Leader>k',  '<C-w><Up>',    opts_default},
  {'n', '<Leader>l',  '<C-w><Right>', opts_default},

  -- Buffer handling
  {'n', '<Tab>',     ':bnext<CR>',   opts_default},
  {'n', '<S-Tab>',   ':bprev<CR>',   opts_default},
  {'n', '<Leader>c', ':Bdelete<CR>', opts_default},

  -- Hop
  {'n', '<Leader>hw', ':HopWord<CR>', opts_default},

  -- Nvimtree
  {'n', '<Leader>nt', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', opts_default},

  -- Prefixed bindings
  -- Splitting, Prefix: <Leader>s
  {'',  's',          '<nop>',  opts_default},
  {'n', '<Leader>ss', '<C-w>s', opts_default},
  {'n', '<Leader>sv', '<C-w>v', opts_default},
  {'n', '<Leader>se', '<C-w>=', opts_default},

  -- LSP avigation, Prefix: <Leader>n
  {'n', '<Leader>nd', ':lua vim.lsp.buf.declaration()<CR>', opts_default},
  {'n', '<Leader>ni', ':lua vim.lsp.buf.definition()<CR>',  opts_default},
  {'n', '<Leader>nb', '<C-o>',                              opts_default},
  
  -- LSP symbols, Prefix: <Leader>n
  {'n', '<Leader>nc', ':Lspsaga hover_doc<CR>',  opts_default},
  {'n', '<Leader>nx', ':Lspsaga rename<CR>',     opts_default},
  {'n', '<Leader>nr', ':Lspsaga lsp_finder<CR>', opts_default},

  -- Gitsigns, Prefix: <Leader>g
  {'n', '<Leader>gh', ':Gitsigns toggle_linehl<CR>', opts_default},
  {'n', '<Leader>gd', ':Gitsigns preview_hunk<CR>',  opts_default},

  -- Telescope, Prefix: <Leader>t
  {'n', '<Leader>tt', ':Telescope<CR>',              opts_default},
  {'n', '<Leader>tg', ':Telescope live_grep<CR>',    opts_default},
  {'n', '<Leader>tf', ':Telescope find_files<CR>',   opts_default},
  {'n', '<Leader>tb', ':Telescope git_branches<CR>', opts_default}
}

h.map_keys(keys)
