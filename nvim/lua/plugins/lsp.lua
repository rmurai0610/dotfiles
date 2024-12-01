return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup()
        mason_lspconfig.setup()

        lspconfig.lua_ls.setup {}
        lspconfig.pyright.setup {
            handlers = {
                ["textDocument/publishDiagnostics"] = function() end,
            },
            on_attach = function(client, _)
                client.server_capabilities.codeActionProvider = false
            end,

            python = { analysis = { typeCheckingMode = "off", diagnosticMode = "off" } }
        }
        lspconfig.ruff.setup {}
        lspconfig.glsl_analyzer.setup {}

        vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)
        vim.keymap.set('n', '<leader>qf', vim.lsp.buf.code_action)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references)
        vim.keymap.set('n', 'rn', vim.lsp.buf.rename)
        vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
    end,
}
