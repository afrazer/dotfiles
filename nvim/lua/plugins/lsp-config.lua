return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "clangd", "lua_ls", "ts_ls", "ols", "tombi" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            vim.lsp.config("jails", {
                capabilities = capabilities,
                mason = false,
                cmd = { "jails" },
                filetypes = { "jai" },
                root_markers = { ".git" },
                single_file_support = true,
                settings = {},
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        format = {
                            enable = true,
                            defaultConfig = {
                                indent_style = "space",
                                indent_width = "4",
                            },
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            vim.lsp.enable("lua_ls")
            vim.lsp.enable("ts_ls")
            vim.lsp.enable("ols")
            vim.lsp.enable("clangd")
            vim.lsp.enable("tombi")
            vim.lsp.enable("jails")

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
