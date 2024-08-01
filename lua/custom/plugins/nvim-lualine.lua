return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'catppuccin',
      },
      extensions = { 'neo-tree' },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          'diff',
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
          },
        },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' }, -- I added copilot here
        lualine_y = { 'copilot', 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
