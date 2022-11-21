require 'lualine'.setup {
   options = {
      globalstatus = true,
      section_separators = { right = '', left = '' },
   },
   sections = {
      lualine_x = { 'filetype' },
   }
}

