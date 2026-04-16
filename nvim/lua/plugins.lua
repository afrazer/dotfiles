return {
	{ "tpope/vim-surround", lazy = false },
	{ "tpope/vim-abolish", lazy = false },
	{
		"tpope/vim-commentary",
		config = function()
			vim.cmd("autocmd FileType h,hpp,c,cpp,proto setlocal commentstring=//\\ %s")
		end,
		lazy = false,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>gf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format Buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufWritePre" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				python = { "ruff" },
			}

			-- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			-- vim.api.nvim_create_augroup({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			-- 	group = lint_augroup,
			-- 	callback = function()
			-- 		lint.try_lint()
			-- 	end,
			-- })
		end,
	},
}
