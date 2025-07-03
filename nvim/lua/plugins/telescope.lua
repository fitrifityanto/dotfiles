return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  config = function()
    local builtin = require('telescope.builtin')
    local function telescope_in_current_project(func)
      return function()
        func({ cwd = vim.fn.getcwd() })
      end
    end

    vim.keymap.set('n', '<leader>ff', telescope_in_current_project(builtin.find_files),
      { desc = 'Telescope find files in current project' })
    vim.keymap.set('n', '<leader>fg', telescope_in_current_project(builtin.live_grep),
      { desc = 'Telescope live grep in current project' })
    vim.keymap.set('n', '<leader>fb', telescope_in_current_project(builtin.buffers),
      { desc = 'Telescope buffers in current project' })
    vim.keymap.set('n', '<leader>fh', telescope_in_current_project(builtin.help_tags), { desc = 'Telescope help tags' })
  end
}
