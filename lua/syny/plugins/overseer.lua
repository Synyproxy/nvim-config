return {
	"stevearc/overseer.nvim",
	---@module 'overseer'
	---@type overseer.SetupOpts
	event = "VeryLazy",
	opts = {
		task_list = {
			direction = "bottom",
			min_height = 8,
			max_height = 15,
			default_detail = 1,
		},
	},
	config = function(_, opts)
		require("overseer").setup(opts)
		vim.keymap.set("n", "<leader>o", "<cmd>OverseerToggle<CR>")
		vim.keymap.set("n", "<F6>", "<cmd>OverseerRun<CR>")
		vim.keymap.set("n", "<C-/>", "<cmd>OverseerShell<CR>")
	end,
}
