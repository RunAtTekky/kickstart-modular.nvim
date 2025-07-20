return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  lazy = false,
  keys = {
    {
      '<leader>r',
      function()
        require('refactoring').select_refactor {
          show_success_message = true,
        }
      end,
      desc = 'Refactoring',
      mode = 'v',
      noremap = true,
      silent = true,
      expr = false,
    },
  },
  opts = {},
}
