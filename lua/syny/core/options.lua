-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
	end,
})

vim.opt.makeprg = "cmake --build build"
-- Folding LSP
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.opt.foldlevel = 99

-- set title so hyprland window rule can make vim solid color
vim.opt.title = true
vim.opt.titlestring = "nvim | %t %M (%{expand('%:p:h')})"

-- transparent
-- vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
-- explorer tree style navigation
vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = false -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- -- filetype-specific settings
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "c", "cpp", "c_sharp", "python" },
--   callback = function()
--     vim.opt_local.tabstop = 4
--     vim.opt_local.shiftwidth = 4
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "html", "css", "javascript", "typescript", "svelte" },
--   callback = function()
--     vim.opt_local.tabstop = 2
--     vim.opt_local.shiftwidth = 2
--   end,
-- })
--
-- line wrapping
opt.wrap = true -- disable line wrapping
opt.linebreak = true
opt.breakindent = true

-- opt.colorcolumn = "80"
-- search settings
opt.ignorecase = true -- ignore case when searching
-- opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- highlight current line number
opt.cursorline = true

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- QML fold since treesitter no qml, Check origami ?
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qml", "qmljs" },
	callback = function()
		-- Option A: Fold by Braces (Your specific request)
		vim.opt_local.foldmethod = "marker"
		vim.opt_local.foldmarker = "{,}"

		-- Option B: Fold by Indent (Usually cleaner for QML)
		-- vim.opt_local.foldmethod = "indent"

		vim.opt_local.foldlevel = 99 -- Start with all folds open
	end,
})
