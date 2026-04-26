return {
    "Mofiqul/dracula.nvim",
    lazy = false,
    name = "dracula",
    priority = 1000,
    opts = {
        italic = false,
        overrides = function(colors)
            return {
                ["@type.builtin"] = { fg = colors.cyan, italic = false },
            }
        end,
    },
    config = function(_, opts)
        require("dracula").setup(opts)
        vim.cmd.colorscheme("dracula")
    end,
}
