-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function toggleScreenKey()
  vim.cmd("Screenkey toggle")
end
vim.keymap.set("n", "<leader>tk", toggleScreenKey, { desc = "[T]oggle [S]creen[K]ey" })
vim.keymap.set('n', "<BS>", function()
  vim.cmd([[
  :bp
  :echo 'Previous buffer'
  ]])
end)
-- cccpick
vim.keymap.set('n', "<leader>c", function()
  vim.cmd([[
    :CccHighlighterEnable
    :CccPick
  ]])
end)

vim.cmd([[
:nnoremap / /\v
:nnoremap // //
:nnoremap ? ?\v
:nnoremap ?? ??
]])
