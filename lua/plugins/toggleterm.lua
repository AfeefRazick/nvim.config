return {
  { -- Terminal emulator
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<c-\>]],
        terminal_mappings = true,
      }

      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new {
        cmd = 'lazygit status',
        hidden = true,
        direction = 'float',
        float_opts = {
          border = 'curved',
        },
        on_open = function(term)
          -- Enter insert mode and type '_' to have status pane in split view
          vim.api.nvim_command 'startinsert'
          vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('_', true, false, true), 'n', true)
        end,
      }

      local function lazygit_toggle()
        lazygit:toggle()
      end

      vim.keymap.set('n', '<leader>lg', lazygit_toggle, { desc = 'Open [L]azy [G]it', noremap = true, silent = true })
    end,
  },
}
