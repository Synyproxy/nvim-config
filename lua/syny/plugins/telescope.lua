return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				file_ignore_patterns = {
					"^.git/", -- Ignore .git folders
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<esc>"] = actions.close,
						["<C-h>"] = actions.preview_scrolling_up,
						["<C-l>"] = actions.preview_scrolling_down,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		-- Regular find files with hidden files enabled
		keymap.set("n", "<leader>ff", function()
			require("telescope.builtin").find_files({
				hidden = true, -- Show hidden files
			})
		end, { desc = "Fuzzy find files in cwd (including hidden)" })
		-- Find files that bypass .gitignore (shows everything)
		keymap.set("n", "<leader>fF", function()
			require("telescope.builtin").find_files({
				hidden = true,
				no_ignore = true, -- Ignore .gitignore
				no_ignore_parent = true, -- Ignore parent .gitignore
			})
		end, { desc = "Fuzzy find ALL files (bypass .gitignore)" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fS", function()
			require("telescope.builtin").live_grep({
				additional_args = { "--no-ignore" }, -- Bypass .gitignore
			})
		end, { desc = "Find string in cwd (including ignored files)" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set("n", "<leader>fu", "<cmd>Telescope lsp_references<cr>", { desc = "Find Usage" })
		keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Find definition" })
		keymap.set("n", "<leader>fp", function()
			require("telescope.builtin").lsp_definitions({
				jump_type = "never",
				reuse_win = true,
			})
		end, { desc = "Peek Definition (Telescope)" })
	end,
}
