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
					-- "cmake",
					"lua_ls",
					"ts_ls",
                    "ols",
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
			-- lspconfig.cmake.setup({
			-- 	capabilities = capabilities,
			-- })
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.ruff.setup({
				capabilities = capabilities,
			})

            vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
            vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
            vim.keymap.set("n", "q]", vim.diagnostic.goto_next)
            vim.keymap.set("n", "q[", vim.diagnostic.goto_prev)

			vim.keymap.set("n", "L", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "re", vim.lsp.buf.rename, {})

			vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, {})

			vim.keymap.set({ "n", "v" }, "<leader>F", vim.lsp.buf.format, {})
		end,
	},
}
