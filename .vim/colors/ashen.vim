" Vim color file
" Maintainer:  Tuomas Kasmra <kasmra@gmail.com>
" Last Change: 02 Mar 2009 02:07:31 Tobias Hoffmann <tobias_hoffmann@gmx.de>
" Version: 0.3

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="ashen"

hi Normal       guifg=#000000                   guibg=#e9e9e9
hi Title        guifg=#000000   gui=NONE        guibg=#ffffcc
hi lCursor      guifg=NONE                      guibg=#000000
hi LineNr       guifg=#e0e0e0                   guibg=#84986C
hi Comment      guifg=#c03417   gui=italic
hi Identifier   guifg=#000000   gui=NONE
hi Visual       guifg=NONE      gui=NONE        guibg=#00ccff
hi Directory    guifg=#8b8b8b
hi NonText      guifg=#6f8b17
hi Special      guifg=#32329e
hi Operator     guifg=#01c1c7   gui=NONE
hi Statement    guifg=#006600   gui=NONE
hi TypeDef      guifg=#dcdce0   gui=NONE
hi Type         guifg=#4848f3   gui=NONE
hi Boolean      guifg=#669900   gui=NONE
hi String       guifg=#eb2c2c   gui=NONE
hi Number       guifg=#9d7d4a   gui=NONE
hi Constant     guifg=#9d7d4a   gui=NONE
hi Function     guifg=#660066   gui=NONE
hi PreProc      guifg=#000080   gui=NONE
hi Keyword      guifg=#c03417   gui=NONE

