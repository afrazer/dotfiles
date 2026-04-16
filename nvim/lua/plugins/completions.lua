return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = {
				preset = "super-tab",
				["<C-j>"] = { "select_next" },
				["<C-k>"] = { "select_prev" },
			},
			completion = {
				trigger = {
					prefetch_on_insert = true,
				},
				menu = { auto_show = true },
				documentation = { auto_show = true, auto_show_delay_ms = 50 },
			},
			appearance = { nerd_font_variant = "mono" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {
					lsp = {
						min_keyword_length = 1,
						score_offset = 100,
					},
					buffer = {
						min_keyword_length = 3,
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
