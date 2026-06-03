return {
{
	"OXY2DEV/markview.nvim",
	enabled = true,
	lazy = false,
	ft = { "markdown", "norg", "rmd", "org", "vimwiki", "Avante" },
	opts = {
		filetypes = { "markdown", "norg", "rmd", "org", "vimwiki", "Avante" },
		buf_ignore = {},
		max_length = 99999,
		markdown = {
			headings = {
				enable = true,
				heading_1 = { style = "simple" },
				heading_2 = { style = "simple" },
				heading_3 = { style = "simple" },
				heading_4 = { style = "simple" },
				heading_5 = { style = "simple" },
				heading_6 = { style = "simple" },
			},
			tables = {
				enable = true,
				strict = false,
				block_decorator = true,
				use_virt_lines = true,
			},
		},
	},
},
}
