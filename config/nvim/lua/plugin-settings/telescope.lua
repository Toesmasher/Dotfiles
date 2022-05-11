local status_ok, t = pcall(require, 'telescope')
if not status_ok then
  return
end

t.setup({
})

local h = require('helpers')
local keys = {
  { 'n', '<Leader>tt', ':Telescope<CR>' },
  { 'n', '<Leader>tg', ':Telescope live_grep<CR>' },
  { 'n', '<Leader>tf', ':Telescope git_files<CR>' },
  { 'n', '<Leader>tF', ':Telescope find_files<CR>' },
  { 'n', '<Leader>tb', ':Telescope git_branches<CR>' },
  { 'n', '<Leader>tp', ':Telescope projects<CR>' }
}
h.map_keys(keys)
