local apiKey = os.getenv 'CODECOMPANION_API_KEY'

return {
  'olimorris/codecompanion.nvim',
  opts = {},
  dependencies = {
    'ravitemer/mcphub.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('codecompanion').setup {
      opts = {
        log_level = 'DEBUG', -- or "TRACE"
      },
      adapters = {
        globant = function()
          return require('codecompanion.adapters').extend('openai_compatible', {
            name = 'globant',
            env = {
              url = 'https://api.clients.geai.globant.com',
              api_key = apiKey,
              chat_url = '/chat/completions',
              models_endpoint = '/models',
            },
            schema = {
              model = { default = 'awsbedrock/us.deepseek.r1-v1:0' },
              num_ctx = {
                default = 128000,
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = 'copilot',
          inline = 'copilot',
        },
      },
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
    }
  end,
}
