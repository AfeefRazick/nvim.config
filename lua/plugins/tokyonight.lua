return {
  { -- Theme
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      on_highlights = function(hl)
        hl.Comment['fg'] = '#828282'
      end,
    },
    init = function()
      vim.cmd.colorscheme 'tokyonight-storm'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'

      -- Make bg transparent
      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })

      -- Make git sign colum transparent
      vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'SignColumnNC', { bg = 'none' })

      -- Make line number more visible
      vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#51B3EC', bold = true })
      vim.api.nvim_set_hl(0, 'LineNr', { fg = '#616161', bold = true })
      vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#FB508F', bold = true })
    end,
  },
}
