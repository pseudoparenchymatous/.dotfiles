function font --description 'Change termux font to specified font file'
   rm $HOME/.termux/font.ttf 
   cp $argv $HOME/.termux/font.ttf 
   echo "Loading font..."
   termux-reload-settings 
end
