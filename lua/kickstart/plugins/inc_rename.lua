return {
  'smjonas/inc-rename.nvim',
  cmd = 'IncRename',
  keys = {
    {
      '<leader>rn',
      function()
        return ':IncRename '
      end,
      desc = 'Incremental rename',
      mode = 'n',
      noremap = true,
      expr = true,
    },
  },
  config = true,
}
