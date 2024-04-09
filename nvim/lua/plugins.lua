return {
	{
		"folke/neodev.nvim",
		opts = {},
		config = function()
			require("neodev").setup()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})
		end,
	},
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup({
				mappings = {
					basic = false,
					extra = false,
				},
			})

			local api = require("Comment.api")
			local config = require("Comment.config"):get()
			local keymap = vim.keymap

			local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
			keymap.set("n", "<leader>cc", function()
				api.comment.linewise.current()
			end, { desc = "Comment out a line" })
			keymap.set("n", "<leader>cu", function()
				api.uncomment.linewise.current()
			end, { desc = "Uncomment out a line" })
			keymap.set("v", "<leader>cc", function()
				vim.api.nvim_feedkeys(esc, "nx", false)
				api.comment.linewise(vim.fn.visualmode())
			end, { desc = "Comment out a visual block of line" })
			keymap.set("v", "<leader>cu", function()
				vim.api.nvim_feedkeys(esc, "nx", false)
				api.uncomment.linewise(vim.fn.visualmode())
			end, { desc = "Uncomment out a visual block of line" })
			keymap.set("v", "<leader>cb", function()
				vim.api.nvim_feedkeys(esc, "nx", false)
				api.toggle.blockwise(vim.fn.visualmode())
			end, { desc = "Toggle a visual block of comment" })
		end,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup()
		end,
	},
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
		config = function()
			require("barbar").setup({
				sidebar_filetypes = {
					-- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
					NvimTree = true,
					Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
				},
			})
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				tab = { sync = { open = true, close = true } },
			})
		end,
	},
	{
		"stevearc/dressing.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-frecency.nvim" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.load_extension("frecency")
			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
						},
					},
				},
				extensions = {
					frecency = {
						show_scores = false,
						show_unindexed = true,
						show_filter_column = false,
						ignore_patterns = { "*.git/*", "*/tmp/*", "*.pyc" },
					},
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local keymap = vim.keymap
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf, silent = true }

					-- set keybinds
					opts.desc = "Show LSP references"
					keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts)

					opts.desc = "Go to declaration"
					keymap.set("n", "gd", vim.lsp.buf.declaration, opts)

					opts.desc = "Show LSP definitions"
					keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts)

					opts.desc = "Show LSP implementations"
					keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

					opts.desc = "Show LSP type definitions"
					keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

					opts.desc = "See available code actions"
					keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

					opts.desc = "Smart rename"
					keymap.set("n", "rn", vim.lsp.buf.rename, opts)

					opts.desc = "Show buffer diagnostics"
					keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

					-- opts.desc = "Show line diagnostics"
					-- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

					-- opts.desc = "Go to previous diagnostic"
					-- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					--
					-- opts.desc = "Go to next diagnostic"
					-- keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

					opts.desc = "Show documentation for what is under cursor"
					keymap.set("n", "K", vim.lsp.buf.hover, opts)

					opts.desc = "Restart LSP"
					keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
				end,
			})

			local capabilities = cmp_nvim_lsp.default_capabilities()
			mason_lspconfig.setup_handlers({
				-- default handler for installed servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
			})

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"html",
					"lua_ls",
					"pyright",
				},
			})
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettierd",
					"stylua",
					"ruff",
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/vim-vsnip" },
			{ "zbirenbaum/copilot-cmp" },
		},
		config = function()
			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			local copilot_cmp = require("copilot_cmp")
			copilot_cmp.setup()

			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local feedkey = function(key, mode)
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
			end

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
					["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
					["<C-l>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-j>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif vim.fn["vsnip#available"](1) == 1 then
							feedkey("<Plug>(vsnip-expand-or-jump)", "")
						elseif has_words_before() then
							cmp.complete()
						else
							fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_prev_item()
						elseif vim.fn["vsnip#jumpable"](-1) == 1 then
							feedkey("<Plug>(vsnip-jump-prev)", "")
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", group_index = 1 },
					{ name = "copilot", group_index = 2 },
					{ name = "vsnip", group_index = 2 },
					{ name = "buffer", group_index = 3 },
					{ name = "path", group_index = 3 },
				}),
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					svelte = { "prettier" },
					css = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					graphql = { "prettier" },
					liquid = { "prettier" },
					lua = { "stylua" },
					python = { "ruff_format" },
				},
				format_on_save = {
					lsp_fallback = true,
					timeout_ms = 500,
				},
			})
		end,
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
		opts = {
			-- anaconda = { python_parent_dir = "bin", python_executable = "python" }
		},
		keys = {
			{ "<leader>vs", "<cmd>VenvSelect<cr>" },
			{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
		},
		config = function()
			require("venv-selector").setup({
				autorefresh = true,
				search_workspace = false,
				search = false,
				anaconda_base_path = "/Users/riku/miniconda3/",
				anaconda_envs_path = "/Users/riku/miniconda3/envs",
			})
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local actived_venv = function()
				local venv_name = require("venv-selector").get_active_venv()
				if venv_name ~= nil then
					return venv_name:match("([^/]+)$")
					-- return string.gsub(venv_name, ".*/pypoetry/virtualenvs/", "(poetry) ")
				else
					return "venv"
				end
			end
			local venv = {
				function()
					return actived_venv()
				end,
				on_click = function()
					vim.cmd.VenvSelect()
				end,
			}
			local sections = { lualine_x = { venv } }

			require("lualine").setup({
				sections = sections,
				options = {
					theme = "everforest",
				},
			})
		end,
	},
	{
		"nvimdev/hlsearch.nvim",
		config = function()
			require("hlsearch").setup()
		end,
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local keymap = vim.keymap
			keymap.set("n", "<leader>fr", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
			keymap.set(
				"n",
				"<leader>frw",
				'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
				{ desc = "Search current word" }
			)
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
}
