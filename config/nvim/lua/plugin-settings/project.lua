local status_ok, p = pcall(require, "project_nvim")
if not status_ok then
  return
end

p.setup({
  silent_chdir = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
})

local status_ok, t = pcall(require, "telescope")
if not status_ok then
  return
end
t.load_extension('projects')
