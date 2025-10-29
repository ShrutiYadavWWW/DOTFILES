return {
  require('lspconfig').lua_ls.setup({ opts = {} }),
  require('lspconfig').ruff.setup({ opts = {} })
}
