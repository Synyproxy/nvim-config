return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},

	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	--setting keybind for lazygit with 'keys'
	--so that loads the plugins on first run
	keys = {
		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
	},
}
