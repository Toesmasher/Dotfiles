local status_ok, t = pcall(require, 'telescope')
if not status_ok then
  return
end

t.setup({

})

local h = require('helpers')
local keys = {
  {'n', '<Leader>tt', ':Telescope<CR>',              h.key_opts_default},
  {'n', '<Leader>tg', ':Telescope live_grep<CR>',    h.key_opts_default},
  {'n', '<Leader>tf', ':Telescope find_files<CR>',   h.key_opts_default},
  {'n', '<Leader>tb', ':Telescope git_branches<CR>', h.key_opts_default},
  {'n', '<Leader>tp', ':Telescope projects<CR>',     h.key_opts_default}
}
h.map_keys(keys)
