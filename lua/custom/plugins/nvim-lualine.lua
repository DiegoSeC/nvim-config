local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == '' then
    return ''
  else
    return '󰐾 Recording @' .. recording_register
  end
end

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
        lualine_c = {
          'filename',
          {
            'macro-recording',
            fmt = show_macro_recording,
          },
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' }, -- I added copilot here
        lualine_y = { 'copilot', 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
