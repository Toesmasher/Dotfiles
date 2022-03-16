local h = require("helpers")

local status_ok, dracula = pcall(require, 'dracula')
if not status_ok then
  return
end

local g = {
  dracula_transparent_bg = true
}
h.set_globals(g)

vim.cmd([[
  color dracula
]])
