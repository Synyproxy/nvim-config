return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/lazydev.nvim", opts = {} },
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- 1. Apply capabilities globally to all LSP configs
		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		-- 2. Explicitly ENABLE the servers you want to run.
		-- This replaces the old setup{} calls.
		-- It tells Neovim: "If you see a C++ or CMake file, start these."
		vim.lsp.enable("clangd")
		vim.lsp.enable("cmake") -- or "neocmakelsp" if that's what you use

		-- You can also enable your other servers here:
		-- vim.lsp.enable("lua_ls")
		-- vim.lsp.enable("pyright")
	end,
}
