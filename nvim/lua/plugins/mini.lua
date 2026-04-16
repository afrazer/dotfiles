return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		require("mini.basics").setup()
		require("mini.extra").setup()
		require("mini.files").setup()
		require("mini.icons").setup()
		require("mini.git").setup()
		require("mini.diff").setup()
		require("mini.diff").setup({
			view = {
				signs = {
					add = " ",
					change = " ",
					delete = " ",
				},
			},
		})
		require("mini.indentscope").setup()
		require("mini.statusline").setup()
		require("mini.cmdline").setup()
		require("mini.ai").setup()
		require("mini.jump2d").setup({
			view = {
				dim = true,
				n_steps_ahead = 1,
			},
		})

		vim.keymap.set("n", "<C-n>", function()
			local mf = require("mini.files")
			if not mf.close() then
				mf.open(vim.api.nvim_buf_get_name(0), true)
			end
		end)

		vim.keymap.set("n", "g]", function()
			require("mini.diff").goto_hunk("next")
		end, {
			desc = "Next hunk",
		})

		vim.keymap.set("n", "g[", function()
			require("mini.diff").goto_hunk("prev")
		end, {
			desc = "Prev hunk",
		})

		vim.keymap.set("n", "<leader>s", "cmd>lua MiniJump2d.start()<cr>", {
			desc = "Start Jumping",
		})
	end,
}
