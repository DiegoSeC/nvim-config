return {
  {
    treesitter = { 'lua' },
    mason = { 'stylua', 'lua-language-server' },
    lsp = { 'lua_ls' },
  },
  {
    treesitter = { 'json' },
    mason = { 'jq', 'jsonlint' },
  },
  {
    treesitter = { 'yaml' },
    mason = { 'yq', 'yamllint', 'yaml-language-server', 'actionlint' },
    lsp = { 'yamlls' },
  },
  {
    treesitter = { 'javascript', 'typescript', 'tsx', 'html', 'css' },
    mason = { 'typescript-language-server', 'eslint_d', 'prettier', 'prettierd', 'js-debug-adapter' },
    lsp = { 'ts_ls', 'eslint' },
  },
  {
    treesitter = { 'bash' },
    mason = { 'shellcheck', 'shfmt', 'bash-language-server' },
    lsp = { 'bashls' },
  },
  -- copilot LSP removed: zbirenbaum/copilot.lua handles Copilot via its own mechanism
  {
    mason = { 'tailwindcss-language-server' },
    lsp = { 'tailwindcss' },
  },
  {
    mason = { 'gh' },
  },
}
