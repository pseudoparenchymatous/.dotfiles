let-env config = ($env.config | upsert keybindings [
   {
      modifier: control
      keycode: char_L
      mode: vi_insert
      event: { send: HistoryHintComplete }
   }
   {
      modifier: control
      keycode: char_W
      mode: vi_insert
      event: { send: HistoryHintWordComplete }
   }
   {
      modifier: none
      keycode: tab
      mode: vi_insert
      event: {
         until: [
            { send: menu name: completion_menu }
            { send: menunext }
         ]
      }
   }
   {
      modifier: control
      keycode: char_U
      mode: vi_insert
      event: { edit: Clear }
   }
   {
      modifier: control
      keycode: char_K
      mode: vi_insert
      event: { edit: ClearToLineEnd }
   }
   {
      modifier: control
      keycode: char_B
      mode: vi_insert
      event: { edit: BackspaceWord }
   }
])
