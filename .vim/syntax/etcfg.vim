" Vim syntax file
" Language:	Good old ET CFG files
" Maintainer:	N!ghtfly* (tobias_hoffmann@gmx.de)
" Last change:	2008 Jan 25

if exists ("b:current_syntax")
    finish
endif

syn case ignore
syn keyword EtBindCmd unbindall bind unbind
"syn case 
syn keyword EtKeys TAB ENTER ESCAPE SPACE
syn match EtString "\".*\""
"syn keyword CfgOnOff  ON OFF YES NO TRUE FALSE  contained
"syn match UncPath "\\\\\p*" contained
"syn match CfgDirectory "[a-zA-Z]:\\\p*" contained
""Parameters
"syn match   CfgParams    ".*="me=e-1 contains=CfgComment
""... and their values (don't want to highlight '=' sign)
"syn match   CfgValues    "=.*"hs=s+1 contains=CfgDirectory,UncPath,CfgComment,CfgString,CfgOnOff
"
"" Sections
"syn match CfgSection	    "\[.*\]"
"syn match CfgSection	    "{.*}"
"
"" String
"syn match  CfgString	"\".*\"" contained
"syn match  CfgString    "'.*'"   contained
"
"" Comments (Everything before '#' or '//' or ';')
"syn match  CfgComment	"#.*"
"syn match  CfgComment	";.*"
"syn match  CfgComment	"\/\/.*"
"
"" Define the default hightlighting.
"" For version 5.7 and earlier: only when not done already
"" For version 5.8 and later: only when an item doesn't have highlighting yet
"if version >= 508 || !exists("did_cfg_syn_inits")
"    if version < 508
"	let did_cfg_syn_inits = 1
"	command -nargs=+ HiLink hi link <args>
"    else
"	command -nargs=+ HiLink hi def link <args>
"    endif
"    HiLink CfgComment	Comment
"    HiLink CfgSection	Type
"    HiLink CfgString	String
"    HiLink CfgParams    Keyword
"    HiLink CfgValues    Constant
"    HiLink CfgDirectory Directory
"    HiLink UncPath      Directory
"
"    delcommand HiLink
"endif
let b:current_syntax = "etcfg"
" vim:ts=8
