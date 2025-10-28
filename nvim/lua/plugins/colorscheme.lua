return {
  { "navarasu/onedark.nvim",    name = "onedark" },
  { "rebelot/kanagawa.nvim",    lazy = false },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = {} },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = 'kanagawa'
    },
  },
}
