vim.g.mapleader = " "

vim.opt.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.smartcase = true

vim.opt.cursorline = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.undodir = vim.fn.expand("~/.vim/undo-dir")
vim.opt.undofile = true


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("everforest").load()

vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

local function toggle_replace()
	local api = require("nvim-tree.api")
	api.node.open.replace_tree_buffer()
	if api.tree.is_visible() then
		api.tree.close()
	else
		api.tree.open({ current_window = true })
	end
end


vim.keymap.set('n', '-', toggle_replace)

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
map('n', '<A-q>', '<Cmd>BufferClose<CR>', opts)
map('n', '<A-w>', '<Cmd>BufferClose<CR>', opts)

map('n', '<leader>ff', ":Telescope frecency workspace=CWD<CR>", opts)
map('n', '<leader>fg', ":Telescope live_grep<CR>", opts)
map('n', '<leader>fb', ":Telescope buffers<CR>", opts)
map('n', '<leader>fh', ":Telescope help_tags<CR>", opts)
