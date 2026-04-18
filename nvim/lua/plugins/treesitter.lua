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

        vim.api.nvim_create_autocmd("User", {
            pattern = "TSUpdate",
            callback = function()
                require("nvim-treesitter.parsers").jai = {
                    install_info = {
                        path = vim.fn.expand("$HOME") .. "/.local/share/nvim/tree-sitter-jai",
                        files = { "src/parser.c", "src/scanner.c" },
                        generate = true,
                        generate_requires_npm = false,
                        requires_generate_from_grammar = false,
                        queries = "queries",
                    },
                    filetype = "jai",
                }
            end,
        })
    end,
}
