return {
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- load this before other start plugins
    config = function()
      -- Load the colorscheme variant you want:
      vim.cmd([[colorscheme tokyonight-night]])
      -- Options: tokyonight-storm, tokyonight-day, tokyonight-moon
    end,
  },
}
