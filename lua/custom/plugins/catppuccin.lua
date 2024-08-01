return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        integrations = {
          alpha = true,
          gitsigns = true,
          neotree = true,
          which_key = true,
          noice = true,
          notify = true,
        },
      }
    end,
    init = function()
      vim.cmd.colorscheme 'catppuccin-frappe'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
