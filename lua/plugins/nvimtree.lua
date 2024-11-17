return {
  { -- File explorer
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        view = { side = 'right' },
        update_focused_file = { enable = true },
        filters = {
          dotfiles = true,
        },
        on_attach = function(bufnr)
          local api = require 'nvim-tree.api'
          -- default mappings
          api.config.mappings.default_on_attach(bufnr)
          vim.keymap.set('n', '<leader>n', api.tree.toggle, { desc = 'Toggle file explorer' })

          -- Make nvim-tree bg transparent
          vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = 'none' })
          vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'none' })
          vim.api.nvim_set_hl(0, 'NvimTreeNormalFloat', { bg = 'none' })
          vim.api.nvim_set_hl(0, 'NvimTreeNormalNC', { bg = 'none' })
          vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { bg = 'none', fg = '#1f2335' })
        end,
      }
    end,
  },
}
