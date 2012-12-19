" Maintainer:  Tobias Hoffmann <tobias_hoffmann@gmx.de>
" Created:     02 May 2008 03:55:45 Tobias Hoffmann <tobias_hoffmann@gmx.de>
" Last Change: 05 Mar 2009 05:12:05 Tobias Hoffmann <tobias_hoffmann@gmx.de>

set background=dark

highlight clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "panda"


" General colors
highlight Cursor 		            guifg=NONE    guibg=#656565 gui=none
highlight CursorColumn              guibg=#2d2d2d
highlight CursorLine                guibg=#2d2d2d
highlight Folded 		            guibg=#384048 guifg=#a0a8b0 gui=none
"highlight FoldColumn                guifg=
highlight LineNr 		            guifg=#857b6f guibg=#000000 gui=none
highlight MatchParen                guifg=#f6f3e8 guibg=#857b6f gui=bold
highlight NonText 		            guifg=#808080 guibg=#303030 gui=none
highlight Normal 		            guifg=#f6f3e8 guibg=#242424 gui=none
highlight Pmenu 		            guifg=#f6f3e8 guibg=#444444
highlight PmenuSel 	                guifg=#000000 guibg=#cae682
highlight SpecialKey	            guifg=#808080 guibg=#343434 gui=none
highlight StatusLine 	            guifg=#f6f3e8 guibg=#444444 gui=italic
highlight StatusLineNC              guifg=#857b6f guibg=#444444 gui=none
highlight Title		                guifg=#d4d1b6 guibg=NONE	gui=bold
highlight VertSplit 	            guifg=#444444 guibg=#444444 gui=none
highlight Visual		            guifg=#f6f3e8 guibg=#444444 gui=none

" Syntax highlighting general colors
highlight Comment 		            guifg=#aeabb8 gui=italic
highlight Constant 	                guifg=#d78262 gui=none
highlight Function 	                guifg=#e2dc82 gui=none
highlight Identifier 	            guifg=#cae682 gui=none
highlight Keyword		            guifg=#cecece gui=none
highlight Number		            guifg=#d5786e gui=none
highlight Operator		            guifg=#eaeffa gui=none
highlight PreProc 		            guifg=#e5786d gui=none
highlight Special		            guifg=#e7f6da gui=none
highlight Statement 	            guifg=#8ac6f2 gui=none
highlight String 		            guifg=#87df71 gui=none 
"#86d563
highlight Todo 		                guifg=#cfcfcf guibg=#12125a gui=italic
highlight Type 		                guifg=#e5e682 gui=none

" HTML
highlight htmlBold		            guifg=#88a9aC gui=bold
highlight htmlBoldItalic		    guifg=#88a9aC gui=bold,italic
highlight htmlBoldUnderline		    guifg=#88a9aC gui=bold,underline
highlight htmlBoldUnderlineItalic	guifg=#88a9aC gui=bold,underline,italic
highlight htmlItalic	            guifg=#88a9aC gui=italic
highlight htmlUnderline		        guifg=#88a9aC gui=underline
highlight htmlUnderlineItalic		guifg=#88a9aC gui=underline,italic


" vim: ts=4 sts=4 sw=4 et:
