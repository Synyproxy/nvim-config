return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Git [d]iff view' },
    { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'Git file [h]istory' },
    { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = 'Git repo [H]istory' },
    { '<leader>gq', '<cmd>DiffviewClose<cr>', desc = 'Git diff [q]uit' },
  },
  opts = {
    keymaps = {
      merge_tool = {
        { 'n', '<leader>co', '<cmd>DiffviewConflictChooseOurs<cr>',   { desc = 'Conflict choose [o]urs' } },
        { 'n', '<leader>ct', '<cmd>DiffviewConflictChooseTheirs<cr>', { desc = 'Conflict choose [t]heirs' } },
        { 'n', '<leader>cb', '<cmd>DiffviewConflictChooseBase<cr>',   { desc = 'Conflict choose [b]ase' } },
        { 'n', '<leader>ca', '<cmd>DiffviewConflictChooseAll<cr>',    { desc = 'Conflict choose [a]ll' } },
        { 'n', '<leader>cx', '<cmd>DiffviewConflictChooseNone<cr>',   { desc = 'Conflict choose none' } },
      },
    },
  },
}
