" Vim syntax file
" Language:	Diff (context or unified)
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2003 Apr 02

if exists("b:current_syntax")
  finish
end

syn match diffBegin         "^TRACE START"
syn match diffEnd           "^TRACE END"
syn match diffDate          "\[.*\]"

syn match diffMinMemory    "+\d\+"
syn match diffPlsMemory    "-\d\+"
syn match diffNllMemory    "+0"

syn match diffLevel         "->"
syn match diffLineno        ":\d\+$"

syn match diffResult        ">=>.\+"

syn match diffMethodCall    "\k\+->"
syn match diffStaticCall    "\k\+::"
syn match diffFunctionB     "\k\+("
syn match diffFunctionE     ") "

syn match diffMain          "{main}()"
syn match diffInclude       "include\(_once\)\=('.\+')"

" Define the default highlighting only when an item doesn't have highlighting yet
if !exists("did_diff_syntax_inits")
  command -nargs=+ HiLink hi def link <args>

  HiLink diffBegin	Label
  HiLink diffEnd	Label
  HiLink diffDate       Label

  HiLink diffLevel      SpecialChar
  HiLink diffResult     Constant

  HiLink diffMinMemory  Constant
  HiLink diffPlsMemory  Structure
  HiLink diffNllMemory  Comment

  HiLink diffMain       Structure
  HiLink diffInclude    Structure
  
  HiLink diffLineno     Delimiter
  HiLink diffMethodCall Function
  HiLink diffStaticCall Function
  HiLink diffFunctionB  Function
  HiLink diffFunctionE  Function

  delcommand HiLink
end

let b:current_syntax = "xt"

set foldmethod=expr
set foldexpr=strlen(substitute(substitute(substitute(substitute(getline(v:lnum),'^TR.*$','',''),'\\s>=>','->',\"g\"),'^\\s.\\{20\\}\\(\\s\\+\\)\\?->.*$','\\1',''),'\\s\\s','\ ',\"g\"))-2
set foldlevel=9999

" vim: ts=8 sw=2
