return {}
-- return {
-- 	"jay-babu/mason-null-ls.nvim",
-- 	event = { "BufReadPre", "BufNewFile" },
-- 	dependencies = {
-- 		"williamboman/mason.nvim",
-- 		"nvim-lua/plenary.nvim",
-- 		"nvimtools/none-ls.nvim",
-- 	},
-- 	config = function()
-- 		local mason = require("mason")
-- 		local null_ls = require("null-ls")
-- 		local mason_null_ls = require("mason-null-ls")
-- 		mason.setup()
-- 		null_ls.setup({
-- 			sources = {
-- 				null_ls.builtins.formatting.stylua,
-- 			},
-- 		})
-- 		mason_null_ls.setup({
-- 			ensure_installed = nil,
-- 			automatic_installation = true,
-- 		})
-- 	end,
-- }
