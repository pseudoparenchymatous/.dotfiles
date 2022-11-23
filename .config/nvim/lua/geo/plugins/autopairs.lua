require 'nvim-autopairs'.setup {
   fast_wrap = {
      map = '<A-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%)%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'aoeuidhtnsqjkxbmwvz',
      check_comma = true,
      highlight = 'Search',
      highlight_grey='Comment'
   },
}
