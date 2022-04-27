local status_ok, nt = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

local h = require('helpers')
local keys = {
  {'n', '<Leader>nt', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', h.key_opts_default},
}
h.map_keys(keys)

nt.setup({
  git = {
    enable = true,
    ignore = false,
    timeout = 500
  },
  view = {
    width = 35,
    height = 30,
    hide_root_folder = false,
    side = 'left',
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
    },
  },
})
