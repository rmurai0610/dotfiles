-- Bootstrap lazy.nvim
local vim = vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4   -- Number of spaces to use for indentation
vim.opt.tabstop = 4      -- Number of spaces for a tab
vim.opt.softtabstop = 4  -- Number of spaces a <Tab> counts for in insert mode

vim.keymap.set("i", "jk", "<esc>", { noremap = true })

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- add your plugins here
        { import = "plugins" },
    },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
