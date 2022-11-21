require 'nvim-lastplace'.setup {
   last_place_ignore_bufftype = {
      'quickfix', 'nofile', 'help',
   },
   last_place_ignore_filetype = {
      'gitcommit', 'gitrebase', 'svn', 'hgcommit',
   },
   last_place_open_folds = true
}
