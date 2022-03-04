local status_ok, nt = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

nt.setup{
  git = {
    enable = true,
    ignore = false,
    timeout = 500
  },
  view = {
    width = 35,
    height = 30,
    auto_resize = true,
    hide_root_folder = false,
    side = 'left',
  },
  show_icons={
    git = 1,
    folders = 0,
    files = 0,
    folder_arrows = 0,
    tree_width = 30
  }
}
