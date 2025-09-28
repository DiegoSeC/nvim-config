return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        float = {
          transparent = true, -- enable transparent floating windows
          solid = false, -- use solid styling for floating windows, see |winborder|
        },
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
