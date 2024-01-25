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
					"clangd",
					"cmake",
					"lua_ls",
					"tsserver",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.cmake.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "L", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>.", vim.lsp.buf.code_action, {})
		end,
	},
}
