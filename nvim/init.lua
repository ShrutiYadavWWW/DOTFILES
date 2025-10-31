require("config.lazy")

vim.opt.termguicolors = true
vim.cmd([[

let g:onedark_config = {'style': 'deep', 'transparent': v:false}
" colo onedark
tnoremap <C-w> <C-\><C-o><C-w>

]])

-- Default options:
require('kanagawa').setup({
  compile = false,  -- enable compiling the colorscheme
  undercurl = true, -- enable undercurls
  commentStyle = { italic = false },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = false,   -- do not set background color
  dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = {             -- add/modify theme and palette colors
    palette = {},

    theme = {
      -- change specific usages for a certain theme, or for all
      wave = {
        ui = {
          float = {
            bg = "none",
          },
        },
      },
      dragon = {},
      all = {
        ui = {
          bg_gutter = "none"
        }
      }
    },
  }
})

require('screenkey').setup({
  clear_after = 2,
})

-- COLORSCHEME
-- setup must be called before loading
require("kanagawa").load("wave")
vim.cmd([[
  hi Search gui=bold cterm=bold guibg=#063e63 ctermbg=063e63 guifg=#eeeeee
  hi clear SpellBad
]])
-- nord theme config
-- vim.cmd([[colorscheme gruvbox]])

-- load screenkey by Default (<leader>tk to toggle)
-- vim.cmd("Screenkey toggle")

-- Show errors and warnings in a floating window
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false, source = "if_many", })
  end,
})

-- fuzzy file picker
-- vim.cmd([[
--
-- set findfunc=Find
-- func Find(arg, _)
--   if empty(s:filescache)
--     let s:filescache = globpath('.', '**', 1, 1)
--     call filter(s:filescache, '!isdirectory(v:val)')
--     call map(s:filescache, "fnamemodify(v:val, ':.')")
--   endif
--   return a:arg == '' ? s:filescache : matchfuzzy(s:filescache, a:arg)
-- endfunc
-- let s:filescache = []
-- autocmd CmdlineEnter : let s:filescache = []
--
-- ]])
