" Vim syntax file
" Language:	C++
" Maintainer:	Tobias Hoffmann <th.geist@googlemail.com>
" Last Change:	2008 22 Jan

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

runtime! syntax/c.vim
unlet b:current_syntax

" C++ extentions
syn keyword cppStatement	new delete this friend using
syn keyword cppAccess		public protected private slots signals Q_OBJECT
syn keyword cppType		inline virtual explicit export bool wchar_t
syn keyword cppExceptions	throw try catch
syn keyword cppOperator		operator typeid emit
syn keyword cppOperator		and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq SLOT SIGNAL
syn match cppCast		"\<\(const\|qt\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match cppCast		"\<\(const\|qt\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword cppStorageClass	mutable
syn keyword cppStructure	class typename template namespace
syn keyword cppNumber		NPOS NULL null nil
syn keyword cppBoolean		true false

" The minimum and maximum operators in GNU C++
syn match cppMinMax "[<>]?"

" Default highlighting
if !exists("did_cpp_syntax_inits")
command -nargs=+ HiLink hi def link <args>
  HiLink cppAccess		cppStatement
  HiLink cppCast		cppStatement
  HiLink cppExceptions		Exception
  HiLink cppOperator		Operator
  HiLink cppStatement		Statement
  HiLink cppType		Type
  HiLink cppStorageClass	StorageClass
  HiLink cppStructure		Structure
  HiLink cppNumber		Number
  HiLink cppBoolean		Boolean
  delcommand HiLink
endif

let b:current_syntax = "cpp"

" vim: ts=8
