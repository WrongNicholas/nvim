-- ~/.config/nvim/lsp/cxx.lua

return {
  cmd = { "clangd", },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", },
  root_markers = { ".clangd", "compile_commands.json", },
}
