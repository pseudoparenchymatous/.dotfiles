require 'noice'.setup {
   lsp = {
      progress = {
         enabled = false,
      },
      override = {
         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
         ["vim.lsp.util.stylize_markdown"] = true,
         ["cmp.entry.get_documentation"] = true,
      },
   },
   popupmenu = {
      enabled = true,
      backend = 'cmp',
   },
   presets = {
      -- command_palette = true,
      -- long_message_to_split = true,
   },
   views = {
      cmdline_popup = {
         border = {
            style = 'solid',
            padding = { 0, 2 },
         },
   --       filter_options = {},
         win_options = {
            winhighlight = {
               -- Normal = 'NormalFloat',
               NormalFloat = 'NormalFloat',
            }
         },
      },
   }
}
