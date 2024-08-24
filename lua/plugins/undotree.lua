return {
  {
    'mbbill/undotree',
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { noremap = true, silent = true })

      local function remap_directional_keys(normal_key, arrow_key, action)
        vim.keymap.set('n', normal_key, action, { buffer = 0, noremap = true, silent = true, nowait = true })
        vim.keymap.set('n', arrow_key, action, { buffer = 0, noremap = true, silent = true, nowait = true })
      end

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('UndotreeMappings', { clear = true }),
        pattern = 'undotree',
        callback = function()
          remap_directional_keys('k', '<up>', '<plug>UndotreeNextState')
          remap_directional_keys('j', '<down>', '<plug>UndotreePreviousState')
          remap_directional_keys('h', '<left>', '<plug>UndotreeNextSavedState')
          remap_directional_keys('l', '<right>', '<plug>UndotreePreviousSavedState')
        end,
      })

      -- diff command does not work on windows, its equivalent in windows is FC
      if vim.fn.has 'win64' == 1 or vim.fn.has 'win32' == 1 then
        vim.g.undotree_DiffCommand = 'FC'
      end
    end,
  },
}
