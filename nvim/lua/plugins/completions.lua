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
                    show_on_trigger_character = true,
                    prefetch_on_insert = true,
                    show_on_keyword = true,
                },
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = true,
                    },
                },
                menu = {
                    auto_show = true,
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 50,
                },
            },
            appearance = { nerd_font_variant = "mono" },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    lsp = {
                        score_offset = 100,
                    },
                },
            },
        },
        opts_extend = { "sources.default" },
    },
}
