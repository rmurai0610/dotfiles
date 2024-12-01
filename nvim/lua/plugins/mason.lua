return {{
    "neovim/nvim-lspconfig",
    dependencies = {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim"}
}, {
    "williamboman/mason.nvim",
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}, {"williamboman/mason-lspconfig.nvim", 
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },

}}

