return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local filetypes = {
			"bash",
			"c",
			"cpp",
			"diff",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"jsx",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
		}
		require("nvim-treesitter").install(filetypes)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetypes,
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
