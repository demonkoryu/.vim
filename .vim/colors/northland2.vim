" northland
" Maintainer:   Luka Djigas <ldigas@@gmail.com>
" Last Change:  27.03.2008.
" Version:      0.11
" URL:          --

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="northland"

hi Normal             gui=NONE       guifg=White         guibg=#001020       guisp=NONE

hi StatusLine         gui=NONE       guifg=Black         guibg=DarkRed
hi StatusLineNC       gui=NONE       guifg=Black         guibg=DarkGray
 hi VertSplit          gui=NONE       guifg=Black         guibg=DarkGray

hi Cursor             gui=NONE       guifg=White         guibg=PaleTurquoise3
 hi CursorIM           gui=NONE       guifg=White         guibg=PaleTurquoise3
hi CursorLine                                            guibg=#003853
 hi CursorColumn                                          guibg=#003853

hi ErrorMsg           gui=NONE       guifg=Yellow        guibg=NONE
 hi WarningMsg         gui=NONE       guifg=Yellow        guibg=NONE
 hi MoreMsg            gui=NONE       guifg=Yellow        guibg=NONE
 hi Question           gui=NONE       guifg=Yellow        guibg=NONE
hi ModeMsg            gui=bold       guifg=White         guibg=DarkRed

hi Directory          gui=NONE       guifg=DarkGreen     guibg=NONE

hi Search             gui=NONE       guifg=White         guibg=DarkRed
 hi IncSearch          gui=NONE       guifg=White         guibg=DarkRed

hi NonText            gui=NONE       guifg=DarkRed       guibg=NONE
hi SpecialKey         gui=NONE       guifg=#999999       guibg=NONE

hi Pmenu              gui=NONE       guifg=Black         guibg=DarkRed
hi PmenuSel           gui=NONE       guifg=#507080       guibg=Black
hi PmenuSbar                                             guibg=#003853
hi PmenuThumb         gui=NONE                           guibg=Black
hi WildMenu           gui=NONE       guifg=#507080       guibg=Black

hi MatchParen         gui=bold       guifg=DarkRed       guibg=NONE

hi LineNr             gui=bold       guifg=#507080       guibg=Black

hi Visual             gui=NONE       guifg=NONE          guibg=DarkRed
hi VisualNOS          gui=underline  guifg=NONE          guibg=DarkRed

hi DiffAdd            gui=NONE       guifg=White         guibg=DarkGreen
hi DiffChange         gui=NONE       guifg=White         guibg=DarkGray
hi DiffDelete         gui=NONE       guifg=White         guibg=DarkRed
hi DiffText           gui=NONE       guifg=White         guibg=NONE

hi Folded             gui=bold       guifg=DarkGreen     guibg=Black
hi FoldColumn         gui=NONE       guifg=#507080       guibg=Black
hi SignColumn         gui=bold       guifg=DarkRed       guibg=Black

hi SpellBad           gui=undercurl                                          guisp=Red
hi SpellCap           gui=undercurl                                          guisp=White
hi SpellLocal         gui=undercurl                                          guisp=Orange
 hi SpellRare          gui=undercurl                                          guisp=Orange

hi TabLine            gui=NONE       guifg=#507080       guibg=Black
hi TabLineSel         gui=bold       guifg=Black         guibg=#507080
hi TabLineFill        gui=NONE       guifg=White         guibg=Black

hi Title              gui=bold       guifg=#507080       guibg=NONE

"hi Menu
"hi Scrollbar
"hi Tooltip

" syntax highlighting ---------
hi clear lCursor
hi clear MatchParen
"hi clear Normal
hi clear Comment
hi clear Constant
hi clear Special
hi clear Identifier
hi clear Statement
hi clear PreProc
hi clear Type
hi clear Underlined
hi clear Ignore
hi clear Error
hi clear Todo
hi clear CursorIM
" -----------------------------
hi fortranComment     gui=NONE       guifg=Orange
hi fortranLabelNumber gui=NONE       guifg=#507080
hi fortranReadWrite   gui=NONE       guifg=Green
"READ/WRITE, PRINT, OPEN/CLOSE, REWIND

"hi fortranString      gui=NONE       guifg=Yellow        guibg=NONE
"Ako ne postoji fortranStringEx onda je string sve izmedu ' ' i " " pri cemu
"C comment uzima kao string a ! comment kao comment

"hi fortranStringEx    gui=NONE       guifg=DarkYellow    guibg=NONE
"Ako postoji fortranStringEx onda on definira ' ', u protivnom to automatski
"odlazi pod fortranString

"fortranTarget
"fortranConstructName

"fortranExtraIntrinsic
"fortran90Intrinsic
"fortran77IntrinsicEx
"fortran90IntrinsicEx
"fortran77IntrinsicR
"fortran95Intrinsic
"fortran66Intrinsic
"fortran77Intrinsic

"fortranFormatSpec
"Format F unutar FORMATa, 1x, ali ne integeri (i2 i sl.)

"fortranKeyword
"ALLOCATE, DEALLOCATE, STOP, RETURN
"fortranKeywordEx
"GO TO, GOTO, CONTINUE
"fortranKeywordOb
"

"fortranConditional
"IF, THEN, ELSE, ENDIF, END IF
"fortranConditionalEx
"

"fortranRepeat
"DO, ENDDO, END DO

"fortranOperator
"+ - * / ** = > <
"fortran77OperatorR
".LT. .GT. .OR. .LE. .GE. ...

"fortranIO
"FILE, UNIT, STATUS, FORM
"fortranIOEx
"FORMAT

"fortranInclude
"INCLUDE

"fortranPreCondit
"PROGRAM, SUBROUTINE, END
"USE, CALL

"fortranUnitHeader
"PROGRAM, SUBROUTINE, END
"USE, CALL
"fortranUnitHeaderEx
"
"fortranUnitHeaderR
"

"fortranCall
"CALL

"fortranType
"INTEGER, REAL, CHARACTER, IMPLICIT, NONE, TYPE
"fortranTypeEx
"EXTERNAL
"fortranTypeR
"DOUBLE PRECISION

"fortranStructure
"DIMENSION, INTENT, ALLOCATABLE

"fortranStorageClass
"IN, OUT, PARAMETER
"fortranStorageClassR
"DATA
"fortran90StorageClassR
"

"fortranTodo
"TODO u ! i C comment - posebno oznacen
"fortranContinueMark
"> &

"fortranParen
"
"fortranParenError
"visak zagrada i sl.
"fortranTab
"(nejasno) oznacavanje tabova

"fortranLabelError
"
"fortranSerialNumber
"
"fortranObsolete
"
"fortranLeftMargin
"

"fortranModule
"
"fortranProgram
"
"fortranSubroutine
"
"fortranFunction
"
"fortran77Loop
"
"fortranCase
"
"fortran90Loop
"
"fortranIfBlock
"
"fortranBlockData
"
"fortranMultiCommentLines
"

"fortranNumber
"fortranFloat
"fortranFloatNoDec
"fortranFloatDExp
"fortranFloatIniDec
"fortranFloatEndDec
"fortranBoolean
"
"
