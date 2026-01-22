return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	-- enable transparent
	--[=[
	{
		"typicode/bg.nvim",
		lazy = false,
		config = function()
			-- make NvimTree use same background
			vim.cmd([[
                hi NvimTreeNormal guibg=NONE
                hi NvimTreeNormalNC guibg=NONE
                hi NvimTreeVertSplit guibg=NONE
                hi NvimTreeEndOfBuffer guibg=NONE
            ]])
		end,
	},
  -- ]=]
}
