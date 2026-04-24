return {
  {
    'onsails/lspkind.nvim',
    lazy = true,
    enabled = vim.g.icons_enabled ~= false,
    opts = {
      mode = 'symbol',
      symbol_map = {
        Array = '󰅪',
        Boolean = '⊨',
        Class = '󰌗',
        Constructor = '',
        Key = '󰌆',
        Namespace = '󰅪',
        Null = 'NULL',
        Number = '#',
        Object = '󰀚',
        Package = '󰏗',
        Property = '',
        Reference = '',
        Snippet = '',
        String = '󰀬',
        TypeParameter = '󰊄',
        Unit = '',
      },
      menu = {},
    },
    config = function(_, opts)
      require('lspkind').init(opts)
    end,
  },
}
