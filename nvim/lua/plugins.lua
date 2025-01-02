
return {
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-abolish", lazy = false },
  { "tpope/vim-commentary",
      config = function()
        vim.cmd("autocmd FileType h,hpp,c,cpp,proto setlocal commentstring=//\\ %s")
      end,
      lazy = false },
}

