vim.g.mapleader = " "

-- Better navigation for wrapped lines
-- Better navigation for wrapped lines
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set("v", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("v", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

vim.keymap.set("n", "<C-S-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<C-S-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<C-S-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-S-k>", ":m '<-2<CR>gv=gv")

-- Optional mapping for convenience
-- delete into empty register dont override yank
vim.keymap.set({ "n", "v" }, "d", '"_d')
vim.keymap.set({ "n", "v" }, "D", '"_D')
vim.keymap.set({ "n", "v" }, "c", '"_c')
vim.keymap.set({ "n", "v" }, "C", '"_C')

local keymap = vim.keymap -- for conciseness

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- LSP
local opts = { silent = true }
-- floating diagnostic at cursor
vim.keymap.set("n", "<leader>rf", vim.diagnostic.open_float, opts)

--Open location list

vim.keymap.set("n", "<leader>rl", function()
	vim.diagnostic.setloclist()
end, opts)

--Close Location list
vim.keymap.set("n", "<leader>rc", function()
	vim.cmd("lclose")
end, opts)

--Go next diagnostic
vim.keymap.set("n", "<leader>rn", vim.diagnostic.goto_next, opts)

--Go to prev diagnostic
vim.keymap.set("n", "<leader>rp", vim.diagnostic.goto_prev, opts)

-- Show diagnostic popup on hover
-- vim.o.updatetime = 250 -- ms to wait before CursorHold triggers
-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]])

-- Go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "gp", vim.lsp.buf.references, { desc = "Go to References" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Documentation" })
-- Ctrl o go back

-- Ctrl s to save
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a") -- insert mode
vim.cmd([[nnoremap <silent> <C-s> :w<CR>]])
vim.cmd([[inoremap <silent> <C-s> <Esc>:w<CR>a]])
-- or disable flow control entirely
vim.api.nvim_set_var("guicursor", "")
