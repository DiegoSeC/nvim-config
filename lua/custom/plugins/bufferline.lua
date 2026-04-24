return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin/nvim' },
  event = 'VeryLazy',
  opts = {
    options = {
      -- stylua: ignore
      close_command = function(n) vim.cmd('bdelete! ' .. n) end,
      -- stylua: ignore
      right_mouse_command = function(n) vim.cmd('bdelete! ' .. n) end,
      diagnostics = 'nvim_lsp',
      always_show_bufferline = false,
      -- diagnostics_indicator = function(_, _, diag)
      --   local icons = require('lazyvim.config').icons.diagnostics
      --   local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
      --   return vim.trim(ret)
      -- end,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'File Explorer',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
  },
  config = function(_, opts)
    opts.highlights = require('catppuccin.special.bufferline').get_theme()
    require('bufferline').setup(opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd('BufAdd', {
      callback = function()
        vim.schedule(function()
          pcall(require('bufferline').refresh)
        end)
      end,
    })
  end,
}
