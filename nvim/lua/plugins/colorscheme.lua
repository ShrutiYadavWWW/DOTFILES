return {
  { "navarasu/onedark.nvim",    name = "onedark" },
  { "rebelot/kanagawa.nvim",    lazy = false },
  { "ellisonleao/gruvbox.nvim", config = true,   opts = {} },
  {
    "vague-theme/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vague").setup({})
    end
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = 'kanagawa'
    },
  },
}
