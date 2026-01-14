return {
  'nvim-java/nvim-java',
  config = function()
    local lombok_path = vim.fn.glob(vim.fn.expand '~/.gradle/caches/modules-2/files-2.1/org.projectlombok/lombok/1.18.20/*/lombok-1.18.20.jar')

    require('java').setup {
      jdtls = {
        jvm_args = {
          '-javaagent:' .. lombok_path,
        },
      },
    }

    vim.lsp.enable 'jdtls'
  end,
}
