return {
	"stevearc/overseer.nvim",
	---@module 'overseer'
	---@type overseer.SetupOpts
	config = function()
		vim.keymap.set("n", "<leader>o", "<cmd>OverseerToggle<CR>")
		vim.keymap.set("n", "<F6>", "<cmd>OverseerRun<CR>")
		vim.keymap.set("n", "<C-/>", "<cmd>OverseerShell<CR>")
	end,
	opts = {},
}
