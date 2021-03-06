" Vim color file
"
" Author: Brian Mock <mock.brian@gmail.com>
"
" Note: Based on Oblivion color scheme for gedit (gtk-source-view)
"
" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark

hi clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name="darkspectrum2"

hi Normal					guifg=#eeeeec guibg=#2e3436

" highlight groups
hi Cursor					guibg=#ffffff guifg=#000000
hi CursorLine				guibg=#000000
"hi CursorLine				guibg=#3e4446
hi CursorColumn				guibg=#3e4446

hi DiffText					guibg=#4e9a06 guifg=#ffffff 
hi DiffChange				guibg=#4e9a06 guifg=#ffffff 
hi DiffAdd					guibg=#204a87 guifg=#ffffff 
hi DiffDelete				guibg=#5c3566 guifg=#ffffff 
"hi ErrorMsg

hi Number					guifg=#fce94f
hi VertSplit				guibg=#eeeeec guifg=#000000 gui=none
hi Folded					guibg=#555753 guifg=#fce94f
hi FoldColumn				guibg=#555753 guifg=tan
hi LineNr					guifg=#555753 guibg=#000000
hi NonText					guifg=#555753 guibg=#000000
hi ModeMsg					guifg=#fce94f
hi MoreMsg					guifg=#fce94f
hi Visual					guifg=#ffffff guibg=#4e5456 gui=none
hi IncSearch				guibg=#ffffff guifg=#ef5939
hi Search					guibg=#ad7fa8 guifg=#ffffff
hi SpecialKey				guifg=#888a85
hi StatusLine				guibg=#eeeeec guifg=#000000 gui=none
hi StatusLineNC				guibg=#babdb6 guifg=#000000 gui=none
hi Title					guifg=#ef5939
hi WarningMsg				guifg=#ef5939
hi Number					guifg=#fcaf3e

hi MatchParen				guibg=#ad7fa8 guifg=#ffffff
hi Comment					guifg=#888a85
hi Constant					guifg=#ef5939 gui=none
hi String					guifg=#fce94f
hi Identifier				guifg=#729fcf
hi Statement				guifg=#ffffff
hi PreProc					guifg=#ffffff
hi Type						guifg=#8ae234
hi Special					guifg=#e9b96e
hi Underlined				guifg=#ad7fa8 gui=underline
hi Directory				guifg=#729fcf
hi Ignore					guifg=#555753
hi Todo						guifg=#ffffff guibg=#ef5939
hi Function					guifg=#ad7fa8

hi htmlBold					guifg=#bbbbbb gui=bold
hi htmlItalic				guifg=#cccccc gui=italic
hi htmlUnderline			guifg=#cccccc gui=underline
hi htmlBoldItalic			guifg=#bbbbbb gui=bold,italic
hi htmlBoldUnderline		guifg=#bbbbbb gui=bold,underline
hi htmlBoldUnderlineItalic	guifg=#bbbbbb gui=bold,underline,italic
hi htmlUnderlineItalic		guifg=#cccccc gui=underline,italic

hi link Error			Todo
hi link Character		Number
hi link rubySymbol		Number
hi link htmlTag			htmlEndTag
hi link htmlLink		Underlined
hi link pythonFunction	Identifier
hi link Question		Type
hi link CursorIM		Cursor
hi link VisualNOS		Visual
hi link xmlTag			Identifier
hi link xmlTagName		Identifier
hi link shDeref			Identifier
hi link shVariable		Function
hi link rubySharpBang	Special
hi link perlSharpBang	Special
"hi link shSpecialVariables Constant
"hi link bashSpecialVariables Constant

" tabs (non gui)
hi TabLine		guifg=#AAAAAA guibg=#000000 gui=none
hi TabLineFill	guifg=#555753 guibg=#000000 gui=none
hi TabLineSel	guifg=#FFFFFF
"hi TabLineSel	guifg=#FFFFFF guibg=#000000 gui=bold
" vim: sw=4 ts=4
