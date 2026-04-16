return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "main",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"lua",
				"javascript",
				"cpp",
				"python",
				-- [[ "cmake" --]]
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
