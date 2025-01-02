
return {
  "Mofiqul/dracula.nvim",
  lazy = false,
  name = "dracula",
  priority = 1000,
  config = function()
    require("dracula").setup({
      overrides = function(colors)
        return {
          ['@type.builtin'] = { fg = colors.cyan, italic = false }
        }
      end
    })
    vim.cmd.colorscheme "dracula"
  end
}
