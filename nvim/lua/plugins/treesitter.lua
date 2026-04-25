local function register_jai_parser()
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
end

vim.filetype.add({ extension = { jai = "jai" } })

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
                "jai",
            },
            highlight = { enable = true },
            indent = { enable = true },
        })

        register_jai_parser()

        vim.api.nvim_create_autocmd("User", {
            group = vim.api.nvim_create_augroup("jai_treesitter_parser", {
                clear = true,
            }),
            pattern = "TSUpdate",
            callback = register_jai_parser,
        })
    end,
}
