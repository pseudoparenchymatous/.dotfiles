-- Colorize the line number according to 
-- diagnostic level instead of using signs
vim.fn.sign_define {
   {
      name = 'DiagnosticSignError', numhl = 'DiagnosticSignError',
      text = '', texthl = '', linehl = '',
   },
   {
      name = 'DiagnosticSignWarn', numhl = 'DiagnosticSignWarn',
      text = '', texthl = '', linehl = '',
   },
   {
      name = 'DiagnosticSignInfo', numhl = 'DiagnosticSignInfo',
      text = '', texthl = '', linehl = '',
   },
   {
      name = 'DiagnosticSignHint', numhl = 'DiagnosticSignHint',
      text = '', texthl = '', linehl = '',
   }
}
