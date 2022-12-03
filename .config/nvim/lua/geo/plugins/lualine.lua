require 'lualine'.setup {
   options = {
      globalstatus = true,
      section_separators = { right = '', left = '' },
   },
   sections = {
      lualine_c = {
         {
            'filename',
            path = 1,
         },
      },
      lualine_x = { 'filetype' },
   },
   extensions = {
      'nvim-tree',
   }
}

