local wezterm = require('wezterm')

return {
  color_scheme = 'Catppuccin Macchiato',
  hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = 0.95,

  font_size = 10.0,
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
}
