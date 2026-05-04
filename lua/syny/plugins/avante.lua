return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",

    opts = {
      provider = "copilot",
    },

    dependencies = {
      -- REQUIRED
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",

      -- Copilot provider
      {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        opts = {
          suggestion = { enabled = false },
          panel = { enabled = false },
        },
      },

      -- file pickers (optional but useful)
      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
      "nvim-mini/mini.pick",

      -- UI / input helpers
      "stevearc/dressing.nvim",
      "folke/snacks.nvim",
      "hrsh7th/nvim-cmp",

      -- images (paste screenshots into chat)
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
            use_absolute_path = true,
          },
        },
      },

      -- markdown rendering for Avante UI
      {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "Avante" },
        opts = {
          file_types = { "markdown", "Avante" },
        },
      },
    },
  },
}
