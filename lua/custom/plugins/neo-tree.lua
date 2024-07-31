return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim', lazy = true },
    { 'MunifTanjim/nui.nvim', lazy = true },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
  },
  opts = {
    default_component_configs = {
      git_status = {
        symbols = {
          -- Change type
          added = '✚',
          deleted = '✖',
          modified = '󰛿',
          renamed = '󰁕',
          -- Status type
          untracked = '󱞇',
          ignored = '',
          unstaged = '󰄱',
          staged = '',
          conflict = '',
        },
      },
    },
    close_if_last_window = true,
    autocmds = {
      neotree_refresh = {
        {
          event = 'TermClose',
          pattern = '*lazygit*',
          desc = 'Refresh Neo-Tree sources when closing lazygit',
          callback = function()
            local manager_avail, manager = pcall(require, 'neo-tree.sources.manager')
            if manager_avail then
              for _, source in ipairs { 'filesystem', 'git_status', 'document_symbols' } do
                local module = 'neo-tree.sources.' .. source
                if package.loaded[module] then
                  manager.refresh(require(module).name)
                end
              end
            end
          end,
        },
      },
    },
    commands = {
      system_open = function(state)
        -- TODO: remove deprecated method check after dropping support for neovim v0.9
        (vim.ui.open)(state.tree:get_node():get_id())
      end,
      parent_or_close = function(state)
        local node = state.tree:get_node()
        if node:has_children() and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
        end
      end,
      child_or_open = function(state)
        vim.inspect(state)
        local node = state.tree:get_node()
        if node:has_children() then
          if not node:is_expanded() then -- if unexpanded, expand
            state.commands.toggle_node(state)
          else -- if expanded and has children, seleect the next child
            if node.type == 'file' then
              state.commands.open(state)
            else
              require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
            end
          end
        else -- if has no children
          state.commands.open(state)
        end
      end,
      copy_selector = function(state)
        local node = state.tree:get_node()
        local filepath = node:get_id()
        local filename = node.name
        local modify = vim.fn.fnamemodify

        local vals = {
          ['BASENAME'] = modify(filename, ':r'),
          ['EXTENSION'] = modify(filename, ':e'),
          ['FILENAME'] = filename,
          ['PATH (CWD)'] = modify(filepath, ':.'),
          ['PATH (HOME)'] = modify(filepath, ':~'),
          ['PATH'] = filepath,
          ['URI'] = vim.uri_from_fname(filepath),
        }

        local options = vim.tbl_filter(function(val)
          return vals[val] ~= ''
        end, vim.tbl_keys(vals))
        if vim.tbl_isempty(options) then
          --  astro.notify('No values to copy', vim.log.levels.WARN)
          return
        end
        table.sort(options)
        vim.ui.select(options, {
          prompt = 'Choose to copy to clipboard:',
          format_item = function(item)
            return ('%s: %s'):format(item, vals[item])
          end,
        }, function(choice)
          local result = vals[choice]
          if result then
            --   astro.notify(('Copied: `%s`'):format(result))
            vim.fn.setreg('+', result)
          end
        end)
      end,
    },
    window = {
      width = 30,
      mappings = {
        ['<S-CR>'] = 'system_open',
        ['<Space>'] = false, -- disable space until we figure out which-key disabling
        ['[b'] = 'prev_source',
        [']b'] = 'next_source',
        O = 'system_open',
        Y = 'copy_selector',
        h = 'parent_or_close',
        l = 'child_or_open',
      },
      fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
        ['<C-j>'] = 'move_cursor_down',
        ['<C-k>'] = 'move_cursor_up',
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = 'open_current',
      use_libuv_file_watcher = vim.fn.has 'win32' ~= 1,
    },
  },
}
