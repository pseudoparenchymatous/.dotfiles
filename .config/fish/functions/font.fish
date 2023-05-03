function font -d "Change termux font"
    cp $argv ~/.dotfiles/.termux/font.ttf
    termux-reload-settings
end
