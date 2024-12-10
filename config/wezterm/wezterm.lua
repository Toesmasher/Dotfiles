local wezterm = require('wezterm')

return {
  color_scheme = 'Catppuccin Macchiato',
  hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = 0.85,

  default_prog = { 'tmux.sh' },

  font_size = 11.0,
  font = wezterm.font('FiraCode Nerd Font'),
  font_rules = {
    {
      italic = true,
      font = wezterm.font('FiraCode Nerd Font', { italic = true, weight = 'DemiBold' }),
    },
    {
      italic = true,
      intensity = 'Bold',
      font = wezterm.font('FiraCode Nerd Font', { italic = true, weight = 'Bold' }),
    },
    {
      intensity = 'Bold',
      font = wezterm.font('FiraCode Nerd Font', { weight = 'Bold' }),
    },
  },
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  warn_about_missing_glyphs = false,

  keys = {
    { key = '+', mods = 'SUPER', action = wezterm.action.IncreaseFontSize },
    { key = '-', mods = 'SUPER', action = wezterm.action.DecreaseFontSize }
  }
}
