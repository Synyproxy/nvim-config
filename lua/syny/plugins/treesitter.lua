return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local parsers = {
			"bash", "c", "cpp", "diff", "html",
			"javascript", "jsdoc", "json",
			"lua", "luadoc", "markdown", "markdown_inline",
			"query", "tsx", "typescript", "vim", "vimdoc",
		}
		require("nvim-treesitter").install(parsers)

		-- javascriptreact/.jsx uses the javascript parser
		-- typescriptreact/.tsx uses the tsx parser
		local ft_to_lang = {
			javascriptreact = "javascript",
			typescriptreact = "tsx",
		}

		local patterns = vim.list_extend(vim.deepcopy(parsers), {
			"javascriptreact",
			"typescriptreact",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = patterns,
			callback = function(ev)
				local lang = ft_to_lang[vim.bo[ev.buf].filetype]
				pcall(vim.treesitter.start, ev.buf, lang)
			end,
		})
	end,
}
