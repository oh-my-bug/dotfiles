return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },

		-- example using `opts` for defining servers
		opts = {
			servers = {
				lua_ls = {},
				ts_ls = {},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end

			vim.diagnostic.config({ virtual_text = true })

			local map = vim.keymap.set
			local map_opts = { noremap = true, silent = true }
			-- LSP general
			map("n", "K", function()
				vim.lsp.buf.hover({ border = "single", max_width = 80 })
			end, map_opts)
			map("n", "<leader>la", vim.lsp.buf.code_action, map_opts)
			map("n", "<leader>lr", vim.lsp.buf.rename, map_opts)
			map("n", "<leader>ld", vim.lsp.buf.definition, map_opts)
			map("n", "<leader>lD", vim.lsp.buf.declaration, map_opts)
			map("n", "<leader>li", vim.lsp.buf.implementation, map_opts)
			map("n", "<leader>lt", vim.lsp.buf.type_definition, map_opts)
			map("n", "<leader>lf", function()
				vim.lsp.buf.format({ async = true })
			end, map_opts)
			map("n", "<leader>ls", vim.lsp.buf.signature_help, map_opts)
			map("n", "<leader>lR", vim.lsp.buf.references, map_opts)

			-- Diagnostics
			map("n", "<leader>le", vim.diagnostic.open_float, map_opts)
			map("n", "[d", vim.diagnostic.goto_prev, map_opts)
			map("n", "]d", vim.diagnostic.goto_next, map_opts)
			map("n", "<leader>lq", vim.diagnostic.setloclist, map_opts)
		end,
	},
	--	{
	--		"mrcjkb/rustaceanvim",
	--		version = "^6", -- Recommended
	--		lazy = false, -- This plugin is already lazy
	--	},
}
