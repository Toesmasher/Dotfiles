local status_ok, icons = pcall(require, 'icons')
if not status_ok then
  return
end

local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn' },
  always_visible = true
}

local diff = {
  'diff',
  cond = hide_in_width
}

local branch = {
  'branch',
  icons_enabled = true,
  icon = icons.git.Branch
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    always_divide_middle = true,
    globalstatus = true,
  },
  -- branch, diagnostics, diff, encoding, filetype, fileformat, location, mode, progress
  sections = {
    lualine_a = { branch },
    lualine_b = { 'diff' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding' },
    lualine_y = { diagnostics, 'filetype' },
    lualine_z = { 'location', 'progress' },
  },
  tabline = {},
  extensions = {}
})
