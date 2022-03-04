local status_ok, c = pcall(require, 'colorizer')
if not status_ok then
  return
end

c.setup({
  '*';
})

