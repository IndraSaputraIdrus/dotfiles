-- local gruvbox = {
--   -- source: https://github.com/NvChad/base46/blob/v3.0/lua/base46/themes/gruvbox.lua
--   base00 = "#282828",
--   base01 = "#3c3836",
--   base02 = "#423e3c",
--   base03 = "#484442",
--   base04 = "#bdae93",
--   base05 = "#d5c4a1",
--   base06 = "#ebdbb2",
--   base07 = "#fbf1c7",
--   base08 = "#fb4934",
--   base09 = "#fe8019",
--   base0A = "#fabd2f",
--   base0B = "#b8bb26",
--   base0C = "#8ec07c",
--   base0D = "#83a598",
--   base0E = "#d3869b",
--   base0F = "#d65d0e",
-- }

local gruvchad = {
  -- source: https://github.com/NvChad/base46/blob/v3.0/lua/base46/themes/gruvchad.lua
  base00 = "#1e2122",
  base01 = "#2c2f30",
  base02 = "#36393a",
  base03 = "#404344",
  base04 = "#d4be98",
  base05 = "#c0b196",
  base06 = "#c3b499",
  base07 = "#c7b89d",
  base08 = "#ec6b64",
  base09 = "#e78a4e",
  base0A = "#e0c080",
  base0B = "#a9b665",
  base0C = "#86b17f",
  base0D = "#7daea3",
  base0E = "#d3869b",
  base0F = "#d65d0e",
}

return {
  "nvim-mini/mini.base16",
  lazy = false,
  priority = 1000,
  opts = {
    palette = gruvchad
  }
}
