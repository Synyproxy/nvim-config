-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	init = function()
		-- When nvim is opened with a directory, neo-tree auto-opens and grabs focus.
		-- This moves focus back to the main window so global keymaps (telescope etc.) work immediately.
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				if vim.fn.argc(-1) == 1 then
					local stat = vim.uv.fs_stat(vim.fn.argv(0))
					if stat and stat.type == "directory" then
						vim.schedule(function()
							vim.cmd("wincmd p")
						end)
					end
				end
			end,
		})
	end,
	opts = {
		open_files_do_not_replace_types = { "terminal", "trouble", "qf", "neo-tree" },
		filesystem = {
			window = {
				mappings = {
					["\\"] = "close_window",
				},
			},
			filtered_items = {
				visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
				hide_dotfiles = false,
				hide_gitignored = true,
			},
		},
	},
}
