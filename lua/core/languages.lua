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
    mason = { 'ts_ls', 'eslint_d', 'prettier', 'prettierd' },
    lsp = { 'ts_ls' },
  },
  {
    treesitter = { 'bash' },
    mason = { 'shellcheck', 'shfmt', 'bash-language-server' },
    lsp = { 'bashls' },
  },
  {
    mason = { 'copilot-language-server' },
    lsp = { 'copilot' },
  },
  {
    mason = { 'tailwindcss-language-server' },
    lsp = { 'tailwindcss' },
  },
  {
    mason = { 'gh' },
  },
}
