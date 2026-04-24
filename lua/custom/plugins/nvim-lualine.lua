local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == '' then
    return ''
  else
    return '󰐾 Recording @' .. recording_register
  end
end

-- Refresh lualine when macro recording starts/stops so the component updates
vim.api.nvim_create_autocmd({ 'RecordingEnter', 'RecordingLeave' }, {
  callback = function() require('lualine').refresh() end,
})

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'catppuccin-frappe',
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
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
          },
        },
        lualine_c = {
          'filename',
          {
            function() return show_macro_recording() end,
            cond = function() return vim.fn.reg_recording() ~= '' end,
          },
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'copilot', 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
