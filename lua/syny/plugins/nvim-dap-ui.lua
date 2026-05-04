return {
  'rcarriga/nvim-dap-ui',
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
  opts = {},
  config = function()
    require('dapui').setup()
    vim.keymap.set('n', '<Leader><F3>', function() require('dapui').toggle() end)
  end,
}
