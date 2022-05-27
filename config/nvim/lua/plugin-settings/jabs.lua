local status_ok, jabs = pcall(require, 'jabs')
if not status_ok then
  return
end

jabs.setup({
  position = 'center',
  width = 50,
  height = 20,
  border = 'rounded',
})
