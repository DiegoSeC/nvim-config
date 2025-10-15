return {
  {
    'nvim-treesitter/nvim-treesitter',
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= 'all' then
        opts.ensure_installed = require('core').list_insert_unique(opts.ensure_installed, { 'javascript', 'typescript', 'tsx', 'jsdoc' })
      end
    end,
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require('core').list_insert_unique(opts.ensure_installed, { 'js' })
    end,
  },
  {
    'vuki656/package-info.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {},
    event = 'BufRead package.json',
  },
}
