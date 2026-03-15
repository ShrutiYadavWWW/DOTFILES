return {
  require('lspconfig').lua_ls.setup({ opts = {} }),
  require('lspconfig').ruff.setup({ opts = {} }),
  -- require('lspconfig').pyrefly.setup({ opts = {} }),
  require('lspconfig').jedi_language_server.setup({ opts = {} }),
}
