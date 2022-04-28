local status_ok, hop = pcall(require, 'hop')
if not status_ok then
  return
end

local h = require('helpers')
local keys = {
  { 'n', '<Leader>w', ':HopWord<CR>' },
}
h.map_keys(keys)

hop.setup()
