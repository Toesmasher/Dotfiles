local status_ok, odp = pcall(require, 'darkplus')
if not status_ok then
  return
end

vim.cmd([[
  color darkplus
]])
