return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		ft = { "markdown", "Avante" },
		opts = {
			file_types = { "markdown", "Avante" },
			heading = {
				-- Use simple ASCII icons to avoid double-width Nerd Font rendering issues
				icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
				signs = {},
			},
		},
	},
}
