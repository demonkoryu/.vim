" Last Change: 17 Jul 2017 18:56:31 Tobias Hoffmann <th.geist@gmail.com>
"
" Created:     08 May 2007 21:45:34 Tobias Hoffmann <th.geist@gmail.com>
" Last Change: 17 Jul 2017 18:56:31 Tobias Hoffmann <th.geist@gmail.com>
"
" Copyright (C) 2013 Tobias Hoffmann <th.geist@gmail.com>
" All rights reserved.
"
" Redistribution and use, with or without modification, are permitted.
"
" This software is provided by the author 'as is' and without any warranty. In
" no event shall the author be liable for any damages however caused and on any
" theory of liability arising in any way out of the use of this software, even
" if advised of the possibility of such damage.
"
" Todo:
" explore new motions from CountJump: http://www.vim.org/scripts/script.php?script_id=3130
"
" The Daily WTF:
" never set expandtab for a .vimrc -.-
"
" Quote Of The Day:
" :nunmap can also be used outside of a monastery.
" WTF o_O
"
" (literally years later) I got it.
"
" Tip Of The Day:
" :e **/
" and forget TextMate!
"
" Tip Of The Fiscal Year:
" gv Starts Visual mode with the same area as the previous.
"
" Moment Of The Day:
" iabbrev <buffer>def defend<Left><Left><Left><Cr><Esc>kA
" Try it! =D
"
" Just A Tip:
" I just found out that I can switch to a numbered buffer (say from MBE) with :[N]b or :b [N]
" And delete buffers with :[N]bd
"
" set list/nolist: show <Tab> and <EOL>
"
" + and - can still be mapped. <LocalLeader> anyone?
" [Edit] Somehow it doesn't work... :'(
"
" There Are Useful Insert Mode Commands:
" From http://cloudhead.io/2010/04/24/staying-the-hell-out-of-insert-mode/
"
" * <C-Y> insert the character right above the cursor.you can see how this can be useful.
" * <C-U> delete the current line from the cursor position.
" * <C-A> re-insert the text inserted in the previous insert session.
"
" How To Yank Into The Command Line:
" CTRL-R {0-9a-z"%#*+:.-=}					*i_CTRL-R*
"      Insert the contents of a register.  Between typing CTRL-R and the second character, '"' will be
"      displayed to indicate that you are expected to enter the name of a register.  The text is inserted
"      as if you typed it, but mappings and abbreviations are not used.  If you have options like
"      'textwidth', 'formatoptions', or 'autoindent' set, this will influence what will be inserted.
"      This is different from what happens with the "p" command and pasting with the mouse.
"      Special registers:
"      	'"'	the unnamed register, containing the text of the last delete or yank
"      	'%'	the current file name
"      	'#'	the alternate file name
"      	'*'	the clipboard contents (X11: primary selection)
"      	'+'	the clipboard contents
"      	'/'	the last search pattern
"      	':'	the last command-line
"      	'.'	the last inserted text
"      	'-'	the last small (less than a line) delete
"      	'='	the expression register: you are prompted to enter an expression (see |expression|)
"      		Note that 0x80 (128 decimal) is used for special keys.  E.g., you can use this to move
"      		the cursor up:
"      			CTRL-R ="\<Up>"
"      		Use CTRL-R CTRL-R to insert text literally. When the result is a |List| the items are used
"      		as lines.  They can have line breaks inside too.
"      See |registers| about registers.
"
" CTRL-R CTRL-R {0-9a-z"%#*+/:.-=}			*i_CTRL-R_CTRL-R*
" 		Insert the contents of a register.  Works like using a single "CTRL-R, but the text is
" 		inserted literally, not as if typed. This differs when the register contains characters
" 		like <BS>.
" 		Example, where register a contains "ab^Hc": >
" 	CTRL-R a		results in "ac".
" 	CTRL-R CTRL-R a		results in "ab^Hc".
" <		Options 'textwidth', 'formatoptions', etc. still apply.  If you also want to avoid these,
"		use "<C-R><C-O>r", see below. The '.' register (last inserted text) is still inserted as
" 		typed.
"
" CTRL-R CTRL-O {0-9a-z"%#*+/:.-=}			*i_CTRL-R_CTRL-O*
" 		Insert the contents of a register literally and don't auto-indent.  Does the same as
" 		pasting with the mouse |<MiddleMouse>|. Does not replace characters! The '.' register
" 		(last inserted text) is still inserted as typed.
"
" CTRL-R CTRL-P {0-9a-z"%#*+/:.-=}			*i_CTRL-R_CTRL-P*
" 		Insert the contents of a register literally and fix the indent, like |[<MiddleMouse>|.
" 		Does not replace characters!  The '.' register (last inserted text) is still inserted as
" 		typed.
"
" ...and how to enlarge window size automatically when switching if the current window isn't larger than
" minwinheight...

" FIXME {{{

" FIXME Why does the BufEnter autocmd for setting the commentstring only work after leaving the buffer once?
"
" There Are Five Sets Of Mappings:
"
" - For Normal mode: When typing commands.
" - For Visual mode: When typing commands while the Visual area is highlighted.
" - For Operator-pending mode: When an operator is pending (after 'd', 'y', 'c',
"   etc.).  Example: ':omap { w' makes 'y{' work like 'yw' and 'd{' like 'dw'.
" - For Insert mode.  These are also used in Replace mode.
" - For Command-line mode: When entering a ':' or '/' command.
"
" Lets Put On The Gi:
" gi			Insert text in the same position as where Insert mode
"			was stopped last time in the current buffer.
"			This uses the |'^| mark.  It's different from "`^i"
"
" gI			Insert text in column 1 [count] times.  {not in Vi}
"
" }}}

" TODO {{{

" Research: Command-line editing |ex-edit-index|
" Research: viminfo
" Research: completion forms
" Research: Window sizing (<C-W>_ sucks)
" Research: https://github.com/naneau/dot-vim/blob/master/vimrc
"
" TODO mappings for selectbuf (<F3> is mapped)
" }}}

" XXX {{{

" Some Good Colorschemes: " (I think I need a 2nd menu xD)
"
" * adobe
" * af
" * baycomb
" * clarity
" * darkspectrum(2)*
" * ekvoli
" * emacs
" * kate
" * kib_darktango
" * lingodirector
" * native
" * panda*
" * railscasts
" * shobogenzo(2)*
" * vividchalk
" * wombat(2)*
" * darkrobot
" * 256_XXX
"
" Tip: hicolors.vim / hicolors.txt are great helpers in designing a color scheme.
" Tip: Type ":help word", then hit CTRL-D to see matching help entries for "word".
"
" Notice: :help augroup
" Notice: :set list!
" Notice: ma & 'a rock!
"
" Important Plugins:
" * Align and AlignMaps		    Alignment tool par excellence.
" * Matchit			    Moving around with the % key enhanced.
" * minibufexplorer		    A small window with open buffers.
" * project			    Project management.
" * surround                        (Visually) surround and remove surroundings on text objects.
" * tagexplorer                     A ctags frontend.
" * themes/colorschemes UPDATED     Lots of good colorschemes (including inkpot, vibrantink, ps_color, moria)
"
" }}}

" Vim config {{{

" XXX OS switch {{{
" set runtimepath=
" }}}

" dein (formerly NeoBundle formerly Vundle) {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/repos/github.com/Shougo/dein.vim
if dein#load_state(expand('~/.vim/bundle'))
    call dein#begin(expand('~/.vim/bundle'))
    call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

" Bundles {{{
    call dein#add('Shougo/neocomplcache')
    call dein#add('fholgado/minibufexpl.vim')
    call dein#add('msanders/snipmate.vim')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-markdown')
    call dein#add('tpope/vim-surround')
    call dein#add('Lokaltog/powerline')
    call dein#add('vim-scripts/matchit.zip')
    call dein#add('vim-scripts/bash-support.vim')
    call dein#add('vim-scripts/project.tar.gz')
    call dein#add('vim-scripts/molokai')
    call dein#add('vim-scripts/robokai')
    call dein#add('vim-scripts/DevEiate-theme')
    call dein#add('vim-scripts/syntaxconkyrc.vim')
    call dein#add('vim-scripts/Align')
    call dein#add('vim-scripts/DrawIt')
    call dein#add('vim-scripts/ShowTrailingWhitespace')
    call dein#add('vim-scripts/DeleteTrailingWhitespace')
    call dein#add('vim-scripts/CountJump')

    call dein#end()
    call dein#save_state()
endif
" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

" [FIXME] ln -s ~/.vim/bundle/bash-support.vim/bash-support ~/.vim/ "
" [C extension] Bundle 'git://git.wincent.com/command-t.git'
" }}}

filetype plugin indent on
syntax enable
" }}}

" Powerline {{{
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"source ~/.vim/bundle/powerline/powerline/ext/vim/powerline.vim
" }}}

" Basic power config {{{
set nocp        			    " Disable vi compatibility mode
set ml                        	    " Enable setting Vim options from within files (modelines)
set mls=10			    " Scan this many lines from start and end of file to find a modeline

" vi compatibility options {{{
"set cpo+=I			    " I : When moving the cursor up or down just after inserting
                              	    "     indent for 'autoindent', do not delete the indent.
"set cpo+=n                           " n : Have 'showbreak' appear between line numbers
set cpo+=B			    " B : Use backslash like  in mappings. XXX
"set cpo-=<			    " < : Use special key codes in <> form in mappings and abbrs
set cpo-=m			    " m : Don't wait for showmatch to time out
set cpo-=>			    " > : When appending to a register, don't put a line break before
				    "     the appended text.

"set cpoptions=aABceFIs		    " old cpo
"set cpoptions=aABceFIsn	    " old cpo

" }}}

set noexrc			    " Disable reading of .vimrc, .exrc and .gvimrc in the current directory
				    " Better: use the Project plugin
set nosecure                   	    " Damn, this machine is MINE!
set mm=64000			    " Maximum memory for one buffer
set mmt=128000			    " This should be enough memory for a TEXT EDITOR!

" }}}

" Extended power config {{{

" Filetype and syntax {{{
filet plugin indent on		    " detect filetype, load filetype plugin, load indent file
syn enable                 	    " Having this on lets Vim overrule my colors

" }}}

" Terminal settings {{{
set bg=dark			    " Prefer a dark background color scheme
if !has("gui_running")
    se t_Co=256		    " For 256 color xterms
    set guioptions-=T

" GUI font {{{
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
" }}}
en

set tenc=utf-8			    " XXX Terminal encoding
set encoding=utf-8
set fileencodings=utf-8,latin1

" }}}

" Keyboard behavior {{{
set bs=indent,eol,start		    " Where can we backspace
set ww=b,s			    " Backspace and space move to the previous/next line in normal/visual mode
" map <BS> X

" }}}

" Editor behavior {{{
set ve=all			    " Allow virtual editing everywhere
"set ve=block,insert		    " Allow virtual editing for visual block and insert mode (especially useful for
				    " virtual replace mode)
set sel=inclusive		    " Use every highlighted character for operations in Visual/Select mode
set slm=				    " Don't need this
set km=				    " Don't need this

" }}}

" Tabs stops {{{
set ts=8				    " A tab is this many spaces wide
set sts=4			    " Advance this many spaces when pressing tab
set sw=4                    	    " Number of spaces for indent
set sr                      	    " Round indent to multiple of shiftwidth
set et				    " Expand tabs to spaces (this is language-dependend; for example Makefiles *do* need tabs)
set sta				    " Tab in front of a line inserts blanks according to 'shiftwidth' XXX

" }}}

" Regular expressions {{{
set magic			    " Default regex behavior, keep this at default to avoid portability problems

" }}}


" Help settings {{{
set hh=8				    " Minimum initial height for help window when opening help with :help
set hlg=en,de			    " Prefer english help text, but german is ok, too

" }}}

" File format/encoding/line endings {{{
set ffs=unix,mac,dos			" Preferred line endings
set fencs=utf-8,default,latin1,ucs-bom	" File encoding
set enc=utf-8                            " Recommended for GTK+ 2, it's sensible for other TKs too!
set nobomb                               " Don't write BOM when writing Unicode files
"set viminfo+=1%                                " XXX

" }}}

" File/cwd policies {{{
set ar				" Automatically reload files changed outside of Vim
set cf				" Ask for action if a :q or :e command would abandon an unsaved buffer

if has("netbeans_intg") || has("sun_workshop")
    set noacd			" Don't change cwd to current files directory
endif

" }}}

" Automatic backup & swap files policies {{{
set nobk    			    " don't automatically backup files
set wb				    " Make backup before overwriting a file.
"set bdir=/home/thermo/.backup
set bkc=auto			    " automatically choose backup strategy
set noaw                             " Don't save files when switching buffers
set noawa                            " Don't save files when closing/opening/quitting buffers
set noswf			    " We don't need a swap file (makes things slow)
set sws=				    " Sync method used for swap file

" }}}

" Command line {{{
set hi=50000			" Keep this many lines of command history

" }}}

" Text formatting options {{{

" }}}

" XXX Indenting {{{
set ai				" Auto indenting
set cin				" C indenting
set si				" Smart indenting

" }}}

" Map settings {{{
let mapleader=","			" Prefix for <Leader> mappings (global)
let localleader=","           		" Prefix for <LocalLeader> mappings (local to buffer)

" }}}

" Verbose, reports, messages {{{
set verbose=0				    " Don't be verbose (verbose=10 helps with debugging scripts)
set shm=atIA				    " Short messages:
                                            " a : use abbreviations for 'file written' messages [w], etc
                                            " t : truncate file message at start if too long to fit cmd line
                                            " A : no 'ATTENTION' message when a swap file is found.
                                            " I : No intro message when starting Vim
set report=1				    " Report how many lines changed after : commands if more than this
set noeb					    " Don't f*cking beep on every occasion!

" }}}

" }}}

" UI settings (ruler, linenumbers etc) {{{
"set lines=55 co=125						" Initial Vim window size
								" The values chosen are 5 more than a good terminal.
								" XXX: Incorrect values result in errors with fixed-size
								" terminal windows. For these, it isn't needed anyway.
set ls=2							" Always show status line for the last window
"set stl="%<%f\ %y\ \ 0x%B\ %h%m%r%=%-14.(%l,%c%V%)\ %P"		" Powerful status line =)
"set stl="%<%f\ %y\ \ 0x%B\ %h%m%r%=%-14.(%l,%c%V%)\ %P  %<\ %f\ %{fugitive#statusline()}"
set stl=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set smd                                                   	" Show current editing mode on last line
set ru                                                         	" Show line and column number of cursor
set ch=2							" Height of command line
set nu                                                         	" Show line numbers
set lz                                                         	" Lazy redraw while executing macros etc.
"set beval							" Enable ballon-eval

" }}}

" Buffers {{{
set hid			    " When off a buffer is unloaded when it is abandoned. When on a buffer becomes hidden.

" }}}

" XXX Window splitting behavior {{{
set noea         		    " Don't make windows equal height when splitting
"set winheight=12                " Windows will be at least this high XXX  Problems with MBE
"set winwidth=24                 " Windows will be at least this wide

" }}}

" Mouse settings {{{
set mouse=a							" Enable mouse in terminal
set mousem=extend						" XTerm like behavior for mouse (other are popup and
								" popup_setpos)
set mh       							" Hide the mouse when typing text

" }}}

" Cursor settings {{{
set nocuc							" Don't highlight cursor column
set nocul		    	    				" Dont' highlight cursor line
								" These options can be toggled with the <Leader>cc,
								" cl, nc, cu bindings
" }}}

" Undo/redo {{{

" }}}

" Search settings {{{
set hls     				" Highlight search
set is                 			" Incremental search
set ic               			" Case insensitive search
set scs      				" Case sensitive when search contains uppercase letters
set ws      		    		" Wrap around when searching

" Search path
set path+=**,.,,,			" Subdirectories, current directory, directory of current file

" }}}

" Command line {{{
set wildmenu		    " Enable autocompletion of the command line
set wildchar=<Tab>	    " This char invokes autocomplete
set wildmode=longest,full    " Complete longest common string, then each full match
" set wildmode=full           " Complete first full match, next match, etc.  (the default) >
" set wildmode=longest,full   " Complete longest common string, then each full match >
" set wildmode=list:full      " List all matches and complete each full match >
" set wildmode=list,full      " List all matches without completing, then each full match >
" set wildmode=longest,list   " Complete longest common string, then list alternatives.
set wildcharm=
				"'wildcharm' works exactly like 'wildchar', except that it is
	                      "recognized when used inside a macro.  You can find "spare" command-line
	                      "keys suitable for this option by looking at |ex-edit-index|.  Normally
	                      "you'll never actually type 'wildcharm', just use it in mappings that
	                      "automatically invoke completion mode, e.g.: >
	                      "	:set wcm=<C-Z>
	                      "	:cnoremap ss so $vim/sessions/*.vim<C-Z>
set wildignore=""
			      "A list of file patterns.  A file that matches with one of these
	                      "patterns is ignored when completing file or directory names.
	                      "The pattern is used like with |:autocmd|, see |autocmd-patterns|.
	                      "Also see 'suffixes'.
	                      "Example: >
	                      "	:set wildignore=*.o,*.obj
	                      "The use of |:set+=| and |:set-=| is preferred when adding or removing
 	                      "a pattern from the list.  This avoids problems when a future version
	                      "uses another default.
set wildoptions="tagfile"
	                      " A list of words that change how command line completion is done.
	                      " Currently only one word is allowed:
	                      "   tagfile	When using CTRL-D to list matching tags, the kind of
	                      " 		tag and the file of the tag is listed.	Only one match
	                      " 		is displayed per line.  Often used tag kinds are:
	                      " 			d	#define
	                      " 			f	function




" }}}

" Folding {{{
set fcl&				" No automatic closing of folds when moving out
set fdc=1	    		" Add 1 column at the side of the windows showing folds
set fen		    		" Enable folds
" set foldexpr=0		" Expression used when foldmethod=expr
" set foldignore=#		" Lines ignored when foldmethod=indent
set fdl=1			" Current folding level
set fdls=1		        " Automatically fold the second level when opening file (0 folds all)
se fmr={{{,}}}	    	        " The default, better not change this
set fdm=syntax	    	        " Fold by syntax hl. Other are manual, indent, marker
"set fml=12	    	        " Need this many screen lines for a fold to close
set fdn=20	    	        " Max. nested folds, internal limit is 20 (performance)
set fdo="block,hor,mark,percent,search,tag,undo"
				" Open a fold when entering it with a command of the
			    	" specified types (default works best)
"se fdt=foldtext()		" The expression used to display a fold. Default

" }}}

" Text wrapping/display/scrolling {{{
set wrap		    " Display long lines wrapped TODO: Make wrap toggle mapping
set sidescroll=5            " Minimum number of columns to scroll horizontally when wrap is off
set list listchars=tab:»·,precedes:«,extends:»,trail:·    " Special characters highlighting
			    " Strings to use in list mode
set linebreak		    " Wrap long lines at a character in 'breakat' rather than the last character
			    " that fits on screen.
" set breakat="     .,;:!?->"
set showbreak=">>> "        " XXX Show this string at the beginning of a wrapped line (Also see: cpoptions+=n)
" set highlight             " XXX TODO
" set textwidth=120	    " Make lines this many chars long when wrapping text.
set colorcolumn=120	    " Show a column for longest recommended line length
set scrolloff=3		    " When scrolling, keep this many lines of context visible

" }}}

" Display options {{{
set sm			    " Don't highlight matching brackets...
set mat=1		    " ...for 5 msecs

" }}}

" Text display {{{
set lsp=0		    " Pixels between lines (used to adjust fonts)

" }}}

" Additional runtime modules {{{
" runtime ftplugin/man.vim

" }}}

" Mappings {{{

" Cursor collumn/line {{{
nn <silent><Leader>cc :se cuc  <CR>:se nocul<CR>
nn <silent><Leader>cl :se nocuc<CR>:se cul  <CR>
nn <silent><Leader>nc :se nocuc<CR>:se nocul<CR>
nn <silent><Leader>cu :se cuc  <CR>:se cul  <CR>

" }}}

" Command line {{{

" Homedir-relative editing {{{
" Make %% an alias for home
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
" }}}
cno $$ e ../**/
"  __     ___             _       _   _  ___ _____
"  \ \   / (_)_ __ ___   (_)___  | | | |/ _ \_   _|
"   \ \ / /| | '_ ` _ \  | / __| | |_| | | | || |
"    \ V / | | | | | | | | \__ \ |  _  | |_| || |
"     \_/  |_|_| |_| |_| |_|___/ |_| |_|\___/ |_|
"          ____ _____ _   _ _____ _____ _ _
"         / ___|_   _| | | |  ___|  ___| | |
"         \___ \ | | | | | | |_  | |_  | | |
"          ___) || | | |_| |  _| |  _| |_|_|
"         |____/ |_|  \___/|_|   |_|   (_|_)

cno $r e $MYVIMRC<Cr>
cno $g e $MYGVIMRC<Cr>
cno $v e $VIM/
cno $s e $VIMRUNTIME/

cno $h e ~/
cno $y syntax sync fromstart<Cr>

" Use w!! to sudo write after opening a file without sudo rights
" See https://github.com/naneau/dot-vim/blob/master/vimrc
cmap w!! w !sudo tee % >/dev/null

" }}}

" Insert mode {{{

" Tag completion (typing C-] on a german keyboard shouldn't be done without medical support nearby)
ino <C-X><C-T> <C-X><C-]>

" }}}

" Normal mode {{{

" Disable ex mode {{{
nnoremap Q <nop>
" }}}

" File operations {{{
nn <silent><Leader>e :e
nn <silent><Leader>k :clo<Cr>
nn <silent><Leader>w :w<Cr>

" Find/edit files in path
nn <M-S-F>	:fin
nn <C-T>	:e **/

" }}}

" Window switching {{{
nn <C-j> <C-W>j
nn <C-k> <C-W>k
" }}}

" Window resizing {{{
nn <M-j> 4<C-W>-
nn <M-k> 4<C-W>+
" }}}

" Tabs (maybe one day I'll use tabs...) {{{

" See http://amix.dk/blog/viewEntry/159 {{{
" Close a split and then open it in a new tab:
com! Tb :let t_bufnr=bufnr("%") | q | tabe | exe "buffer ". t_bufnr
" Close the current tab and open as a split in another existing tab:
com! Ts :let t_bufnr=bufnr("%") | tabp | sp | exe "buffer ". t_bufnr | tabn | q | tabp

" }}}

nn <Leader>tm		:tabm

nn <silent><Leader>tn	:tabnew %<CR>
nn <silent><Leader>tk	:tabc<CR>
nn <silent><Leader>tb 	:Tb<CR>
nn <silent><Leader>ts 	:Ts<CR>

nn <silent><C-S-Tab>	:tabp<CR>
nn <silent><C-Tab>	:tabn<CR>

" }}}

" Buffers {{{
nn <silent><unique><C-H> :bp<Cr>
nn <silent><unique><C-L> :bn<Cr>
nn <silent><Leader>d :bw<Cr>

" }}}

" Remap some basic operation {{{

" Follow tag:
nn <C-Space> <C-]>
" Visual Studio style autocompletion (XXX mapping removed, see SuperTab)
" imap <C-Space> <C-N>

" }}}

" Shortcuts for common operations {{{

" Indent with tab
noremap  <tab> >>
vnoremap <tab> >gv

noremap  <S-tab> <<
vnoremap <S-tab> <gv

" Follow tag:
nn <C-Space> <C-]>
" Visual Studio style autocompletion (XXX mapping removed, see SuperTab)
" imap <C-Space> <C-N>

" }}}

" }}}

" Visual mode {{{

" from: http://amix.dk/vim/vimrc.html
" Really useful!
" In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" }}}

" Plugin settings {{{

" SuperTab {{{
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

" }}}

" NERDcommenter {{{
let NERDAllowAnyVisualDelims=1		" Allow alternative delimiters in visual or visual block mode.
let NERDBlockComIgnoreEmpty=1		" Ignore unchanged lines if commenting visual blocks.
let NERDCommentWholeLinesInVMode=0	" Comment exactly what was selected.
let NERDRemoveAltComs=1			" Remove alternative comment delimiters, too.
let NERDSpaceDelims=1			" Use extra spaces when commenting.
let NERDRemoveExtraSpaces=1		" Remove extra spaces around comment delimiters.
let NERDUsePlaceHolders=1		" Use place-holder delimiters in nested comments.
let NERDLPlace="[>"			" Left nested comment marker.
let NERDRPlace="<]"			" Right nested comment marker.
let NERDMapleader=",c"			" NERDcommenter command bindings start with this.
let NERDMenuMode=2			" Turn on menu with shortcut.
					" 0 Turns the menu off.
    					" 1 Turns the 'comment' menu on with no menu shortcut.
    					" 2 Turns the 'comment 'menu on with <alt>-c as the shortcut.
    					" 3 Turns the 'Plugin -> comment' menu on with <alt>-c as the shortcut.
let NERDShutUp=1			" Don't echo 'Unknown filetype' messages
let NERDCompactSexyComs=0		" No compact comments.
let NERDDefaultNesting=1		" Nest comments automatically.
"
" If you want the NERD commenter to use the alternative delimiters for a
" specific filetype by default then put a line of this form into your vimrc: >
"     let NERD_<&filetype>_alt_style=1

" }}}

" TOhtml {{{
let use_xhtml=1			    " Use XHTML tags
let html_use_css=1                  " Use css instead of <font> tags
" unlet html_use_css                " Disable CSS for forums
let html_number_lines=0		    " Enable line numbering
let html_ignore_folding=1           " Ignore folding
let html_no_pre=1                   " XXX
let g:html_use_encoding="UTF-8"     " Encode as UTF8

" }}}

" Project settings and mappings {{{
let g:proj_flags="iLst"
let g:proj_window_width="24"

nm <silent> <Leader>P <Plug>ToggleProject

" }}}

" MiniBufExplorer settings and mappings {{{
let g:miniBufExplForceSyntaxEnable=0	" Reenable syntax if disabled by VIM buf (disabled because it clashes
					" with the project plugin's syntax HL
let g:miniBufExplModSelTarget=1		" Put new windows into a non-file buffer
let g:miniBufExplSplitBelow=0		" Put new window above/left of current window
" let g:miniBufExplSplitBelow=1        	  " Put new window below/right of current window
let g:miniBufExplSplitToEdge=1         	" Force the MiniBufExplorer window to the edge of the screen
let g:miniBufExplMinSize=1             	" Minimum width of vertical MiniBufExplorer window.
let g:miniBufExplMaxSize=32            	" Maximum width of vertical MiniBufExplorer window. 0 means fixed size.
" let g:miniBufExplVSplit=16           	  " Enable and set width for vertical explorer windows
let g:miniBufExplMinSize=1             	" Minimum size of explorer window
let g:miniBufExplMaxSize=4             	" Maximum size of explorer window (0 means auto size)
let g:miniBufExplorerMoreThanOne=0     	" Always open MiniBufExplorer window even if only one file is open.
" Bindings
" let g:miniBufExplMapWindowNavVim=1     " Map Control + hjkl to window movement
let g:miniBufExplMapWindowNavArrows=1	" Map Control + arrow keys to window movement
" let g:miniBufExplMapCTabSwitchBufs=1   " Map <C-Tab> and <C-S-Tab> to :bn and :bp
" let g:miniBufExplMapCTabSwitchWindows=1 " Map <C-Tab> and <C-S-Tab> to next and prev window
let g:miniBufExplUseSingleClick=1	" Single clicking switches to the buffer
" NOTE: It is possible to customize the the highlighting for the tabs in
"       the MBE by configuring the following highlighting groups:
"
"       MBEChanged        - CHANGED	    NOT VISIBLE
"       MBEVisibleChanged - CHANGED	    VISIBLE
"       MBENormal         - NOT CHANGED	    NOT VISIBLE.
"       MBEVisibleNormal  - NOT CHANGED	    VISIBLE

map <Leader>t :TMiniBufExplorer<Cr>
"map <Leader>u :UMiniBufExplorer<Cr>
"map <Leader>c :CMiniBufExplorer<Cr>
map <Leader>e :MiniBufExplorer<Cr>

" }}}

" selectbuf {{{
"nmap <Silent> <Unique> <F3> <Plug>SelectBuf

let g:selBufAlwaysHideBufNums=0		" Show buffer numbers
let g:selBufAlwaysShowDetails=0		" Don't show details by default
let g:selBufAlwaysShowHelp=0      	" Don't show help by default
let g:selBufAlwaysShowHidden=0		" Don't show hidden buffers by default
let g:selBufAlwaysShowPaths=2		" Show full pathnames separate to file name
let g:selBufShowRelativePath=1		" Display relative paths
let selBufBrowserMode="split"		" Split open the browser window
let g:selBufSplitType="botright"	" Where to split the browser (topleft messes up MBE)
let g:selBufDefaultSortDirection=1	" Ascending sort order
let g:selBufDefaultSortOrder="mru"	" MRU sorting order
let g:selBufEnableDynUpdate=1		" Update browser as buffers get added and deleted
let g:selBufDelayedDynUpdate=0		" Don't wait for the browser to get focus to update
let g:selBufDisableMRUlisting=0		" Collect file usage statistics for MRU listing
let g:selBufDisableSummary=1		" No buffer summary messages in command line
let g:selBufIgnoreCaseInSort=0		" Sort case sensitive
let g:selBufIgnoreNonFileBufs=1		" Don't list non-file buffers
let g:selBufRestoreWindowSizes=1	" Remember and restore window sizes when opening the browser
let g:selBufUseVerticalSplit=0		" Use vertical split for browser window
let g:selBufDoFileOnClose=1		" Execute :file command after the browser window is closed
let g:selBufDisplayMaxPath=-1		" Trim the paths
let g:selBufLauncher=":!konqueror"	" Command to execute when SBLaunch is used
let g:selBufRestoreSearchString=1	" Save and restore search strings used inside the browser window

" }}}

" " -- Taglist settings and mappings {{{
" map <Leader>tl :Tlist<CR>
" nnoremap <silent> <S-F8> :TlistToggle<CR>
"
" " }}}

" Tagexplorer settings and mappings {{{
let TE_Ctags_Path="/usr/local/bin/ctags"
let TE_WinWidth=24
"map <Leader>te :TagExplorer<CR>
nn <silent> <F8> :TagExplorer<CR>

" }}}

" Make {{{
set mp="gmake"

" }}}

" netrw XXX {{{

" Hexplore and Sexplore, yeah right
" nmap <C-E> :Hexplore!<CR>
" nmap <C-H> :Sexplore!<CR>

" }}}

" }}}

" Syntax plugins settings {{{

" Vim {{{

" Which scripting languages to highlight in Vim scripts
let g:vimsyn_embed = "Pr"
"   g:vimsyn_embed == 0   : don't embed any scripts
"   ~= 'm' : mzScheme
"   ~= 'p' : Perl
"   ~= 'P' : Python
"   ~= 'r' : Ruby
"   ~= 't' : TCL

" }}}

" HTML {{{
let html_extended_events=1
let html_my_rendering=1

" }}}

" SQL {{{
" let b:sql_type_override='mysql'
let b:sql_type_override='psql'

" }}}

" PHP {{{

" Settings for http://www.2072productions.com/vim/indent/php.vim {{{

"let PHP_removeCRwhenUnix=1	    " Remove \r from before newlines
"let PHP_autoformatcomment=1        " Automatically format comments
"let PHP_default_indenting=0        " # of sw to add to the indent of each PHHP line
"let PHP_BracesAtCodeLevel=         " Indent braces at the same level as the code they contain (makes things slower)

" }}}

" Settings for syntax/php.vim by Peter Hodge 0.9.7 {{{
"         :let php_folding = 0
"         :let php_strict_blocks = 0
let php_sql_query = 1		    " SQL inside strings
let php_htmlInStrings = 0   	    " HTML inside strings
let php_baselib = 0	    	    " baselib functions
let php_special_vars = 1    	    " superglobals
let php_special_functions = 1	    " functions with special behaviour e.g., unset(), extract()
let php_alt_comparisons = 1	    " comparison operators in alternate color
let php_alt_assignByReference = 1   " '=&' in alternate color.
let php_smart_members = 1	    " whether -> indicates a property or method. XXX
let php_alt_properties = 1	    " different color for '->' based on whether it is used
				    " for property access, method access, or dynamic access
				    " (using '->{...}')
let php_highlight_quotes = 0	    " quote characters the same colour as the string
				    " contents, like in C syntax.
let php_show_semicolon = 1	    " make the semicolon more visible
let php_smart_semicolon = 1	    " semicolon adopts the color of 'return' or 'break' keyword
				    " Note: this also includes the ':' or ';' which follows a
				    " 'case' or 'default' inside a switch
let php_alt_blocks = 1		    " colorize { and } around class/function/try/catch bodies
				    " according to the type of code block.
let php_alt_arrays = 2		    " to colorize ( and ) around an array body, as well as '=>'
				    " '2' will highlighting the commas as well.
let php_alt_construct_parents = 1   " colorize the ( and ) around an if, while, foreach, or
				    " switch body.
let php_show_spl = 1		    " colorize methods which are defined by SPL
let php_show_pcre = 1		    " highlight regular expression patterns inside calls
				    " to preg_match(), preg_replace(), etc.
				    "
let php_parent_error_close = 1	    " highlight parent error ] or ) or }
let php_parent_error_open = 0	    " skip php end tag, if there exists an open ( or [ without
				    " a closing one
				    " Note: this option is now enabled permanently (unless
				    " php_strict_blocks is disabled).
let php_empty_construct_error = 0   " highlight ';' as an error if it comes immediately after
				    " an if/else/while/for/foreach/switch statement
let php_show_semicolon_error = 0    " highlight certain cases when ';' is followed by an
				    " operator such as '+'.
let php_nested_functions = 0	    " to allow containing one function inside
				    " another.  This option is mostly for speeding up syntax
				    " highlighting - { } blocks can by inserted much faster
				    " while editting a large class.
				    " Note: this is the only option which might break valid PHP
				    " code, although only if you define one function inside
				    " another, which is usually discouraged.
let php_large_file = 5000	    " If a PHP script has more lines than this limit, some
				    " options are automatically turned off
				    " Note: If you set this option to '0', then this feature
				    " will be disabled; thus you can use:
				    " :let b:php_large_file = 0 | setfiletype php
				    " to reload the current file with the disabled syntax
				    " options reactivated.
let php_strict_blocks = 1	    " to match together all {} () and [] blocks correctly.
let php_asp_tags = 0		    " highlight ASP-style short tags: <% %>
let php_short_tags = 1		    " highlight <?...?> blocks as php.
" let php_oldStyle = 1		    " for old colorstyle
let php_folding = 3		    " 1: fold classes and functions
				    " 2: fold all { } regions
				    " 3: fold only functions
let php_fold_arrays = 0		    " fold arrays
let php_fold_heredoc = 0	    " Fold heredoc blocks
let php_sync_method = -1	    " -1:  sync by search (default)
				    " > 0: sync at least x lines backwards
				    " 0:   sync from start
" }}}

" Settings for indent/php.vim by John Wellesz 1.28 {{{
let PHP_autoformatcomment = 1		" enable autoformating of comment by default, if set to 0, this script will
					" let the 'formatoptions' setting intact.
let PHP_default_indenting = 0		" # of sw (default is 0), # of sw will be added to the indent of each
					" line of PHP code.
let PHP_removeCRwhenUnix = 0		" make the script automatically remove CR at end of lines (by default this
					" option is unset), NOTE that you MUST remove CR when the fileformat is
					" UNIX else the indentation won't be correct...
let PHP_BracesAtCodeLevel = 0		" 1: indent the '{' and '}' at the same level than the code they contain.
					" Example:
					" Instead of:
					" 	if ($foo)
					" 	{
					" 		foo();
					" 	}
					"
					" You will write:
					" 	if ($foo)
					" 		{
					" 		foo();
					" 		}
					" NOTE: The script will be a bit slower if you use this option because
					" some optimizations won't be available.

let PHP_vintage_case_default_indent = 0 " 1 to add a meaningless indent before case: and default:
					" statement in switch blocks.

" }}}

" }}}

" Doxygen {{{
let g:load_doxygen_syntax=1	" Add doxygen highlighting to C, C++, IDL
let doxygen_enhanced_colour=1

" }}}

" Ruby {{{

" Syntax highlighting
let ruby_operators=1
" let ruby_space_errors=1
let ruby_fold = 1
"unl! ruby_fold
unl! ruby_no_expensive
" let ruby_no_expensive = 1
unl! ruby_no_special_methods
let ruby_minlines = 80
let ruby_no_comment_fold = 1

" Omnicomplete
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_include_object=1
let g:rubycomplete_include_objectspace=1

" }}}

" Perl {{{
" let perl_no_extended_vars=1
let perl_include_pod=1
let perl_sync_dist=200
let perl_fold=1
let perl_nofold_blocks=1
" let perl_nofold_packages=1
let perl_nofold_subs=1

" }}}

" C {{{

let c_gnu=1
let c_comment_strings=1
unl! c_space_errors
let c_ansi_typedefs=1
let c_ansi_constants=1
let c_minlines=150
" % sudo ctags -R -f ~/.vim/systags /usr/include/* /usr/local/include/*
set tags+=~/.vim/systags
" FIXME
" }}}

" NASM {{{
let nasm_amd64_syntax=1
"let nasm_loose_syntax	" unofficial parser allowed syntax not as Error (parser dependent; not recommended)

" }}}

" ChangeLog {{{
let g:changelog_username="Tobias Hoffmann  <th.geist@gmail.com>"

" }}}

" }}}

" Misc. functions {{{

" Trailing spaces {{{

" See also "listchars"
let g:ShowTrailingWhitespace = 1
let g:DeleteTrailingWhitespace = 0

nnoremap <silent> <F12> :<C-u>call ShowTrailingWhitespace#Toggle(0)<Bar>echo (ShowTrailingWhitespace#IsSet() ? 'Show trailing whitespace' : 'Not showing trailing whitespace')<CR>

nnoremap <S-F12> :<C-u>%DeleteTrailingWhitespace<CR>
vnoremap <S-F12> :DeleteTrailingWhitespace<CR>
" }}}

" Eat the space after an expanded iabbrev {{{
" Use like this: :ia <silent> if if ()<Left><C-R>=Eatspace()<CR>
fu Eatspace()
	let c = nr2char(getchar(0))
	return c =~ '\s' ? '' : c
endf
" }}}

" XXX Remove ?> tags at the end of a PHP file to avoid output of whitespace before the HTTP header is sent {{{
" TODO buggy. Eats end tags *inside* code.
fu! PHP_OnWrite()
    " if match(getline(1), "<?php") > 1
    "     let linenumber = search("\?>", "W")
    "     if linenumber == 0
    "         retu
    "     en
    "     let line = getline(linenumber)
    "     let repl = substitute(line, '?>', "", "")
    "     cal setline(linenumber, repl)
    " en
endf

" }}}

" Create/modify timestamps in files {{{
let g:timestamplines=10	    " numbers of lines to scan for a timestamp

let s:my_name		= "Tobias Hoffmann"
let s:my_email     	= "th.geist@gmail.com"
let s:my_signature 	= s:my_name . " <" . s:my_email . ">"
let s:my_copyright 	= "Copyright (C) %Y " . s:my_name . " <" . s:my_email . ">\nAll rights reserved."
let s:my_timestamp 	= "%d %b %Y %X"
let s:my_modified  	= "Last Change: "
let s:my_created   	= "Created:     "

fu! s:copyright()
    retu strftime(s:my_copyright)
endf

fu! s:modified_timestamp()
    retu s:my_modified . strftime(s:my_timestamp) . " " . s:my_signature
endf

fu! s:created_timestamp()
    retu s:my_created  . strftime(s:my_timestamp) . " " . s:my_signature
endf


" search for an existing time stamp and update it
fu! s:UpdateTimeStamp()
    let l:lines = range(1, g:timestamplines) + range(line("$") - 10, line("$"))
    for l:line in l:lines
	if match(getline(l:line), s:my_modified . ".*$") != -1
	    exe l:line " s/" . s:my_modified . ".*$/" . s:modified_timestamp()
	endif
    endfo
endf

" }}}

" Lorem ipsum {{{
iab <silent> lorem <Esc>:read ~/lorem<CR>i<C-R>=Eatspace()<CR>
" }}}
"
" }}}

" Timestamp mappings/autocmds {{{

" autocommand to update an existing time stamp when writing the file.
" It uses the functions above to replace the time stamp and restores cursor
" position afterwards (this is from the FAQ).
au BufWritePre,FileWritePre *   ks | cal <SID>UpdateTimeStamp() | 's

" Insert mode abbreviations {{{


" Timestamp Mappings {{{
ia <silent>TIMEST <C-R>=<SID>modified_timestamp()<CR><C-R>=Eatspace()<CR>
ia <silent>DATEST <C-R>=<SID>created_timestamp()<CR><C-R>=Eatspace()<CR>

" }}}

" Legal stuff {{{
ia <silent>COPY	<C-R>=<SID>copyright()<CR><C-R>=Eatspace()<CR>

ia <silent>BSDL <Esc>:r /docs/LICENSES/BSD<CR>i<C-R>=Eatspace()<CR>
ia <silent>GPLL <Esc>:r /docs/LICENSES/GPL_V2<CR>i<C-R>=Eatspace()<CR>
ia <silent>MYL <Esc>:r /docs/LICENSES/MY_LICENSE<CR>i<C-R>=Eatspace()<CR>

" }}}
" }}}
" }}}

" See vimtip #165 {{{
com! Bdel cal <SID>BufDel()

fu! <SID>BufDel()
   let l:currentBufNum	    = bufnr("%")
   let l:alternateBufNum    = bufnr("#")

   if buflisted(l:alternateBufNum)
      b #
   el
      bn
   en
   if bufnr("%") == l:currentBufNum
      new
   en
   if buflisted(l:currentBufNum)
      execute("bdelete ".l:currentBufNum)
   en
endf
" }}}

" Filetype detection {{{
let g:asmsyntax="nasm"
let g:bash_is_sh=1

" }}}

" Filetype autocmds {{{

" File type {{{
au BufNewFile,BufRead *conkyrc set filetype=conkyrc
" }}}

" For Vim Help files:
"au BufNewFile,BufRead,BufEnter *vim*/doc/*.txt let <buffer> s:my_timestamp="%Y %b %d"

" PHP {{{

" XXX These need to go into the ft plugin

au BufNewFile,BufRead,BufEnter *.php set complete=k~/php.dict
au BufNewFile,BufRead,BufEnter *.phtml set complete=k~/php.dict
au BufNewFile,BufRead,BufEnter *.php ia <buffer> xxro require_once ';<Left><Left><C-R>=Eatspace()<Cr>
au BufNewFile,BufRead,BufEnter *.php ia <buffer> xxrr require ';<Left><Left><C-R>=Eatspace()<Cr>
au BufNewFile,BufRead,BufEnter *.php ia <buffer> xxio include_once ';<Left><Left><C-R>=Eatspace()<Cr>
au BufNewFile,BufRead,BufEnter *.php ia <buffer> xxii include ';<Left><Left><C-R>=Eatspace()<Cr>

au BufNewFile,BufRead,BufEnter *.php ia <buffer> xxrz require_once 'Zend/.php<Left><Left><Left><Left><C-R>=Eatspace()<Cr>
au BufNewFile,BufRead,BufEnter *.php ia <buffer> xxrg require_once 'Gravity/.php<Left><Left><Left><Left><C-R>=Eatspace()<Cr>
au BufNewFile,BufRead,BufEnter *.php ia <buffer> xxrp require_once 'Pulse/.php<Left><Left><Left><Left><C-R>=Eatspace()<Cr>
au BufNewFile,BufRead,BufEnter *.php ia <buffer> xxrd require_once 'Zend/Debug.php;<Right><Cr><C-R>=Eatspace()<Cr>
au BufNewFile,BufRead,BufEnter *.php ia <buffer> zdd Zend_Debug::dump();<Right><Left><Left><Left><C-R>=Eatspace()<Cr>
"iif if () {<Cr><Esc>k$<Left><Left>i<C-R>=Eatspace()<Cr>

au BufNewFile,BufRead *.php iabbrev <buffer> _php <?php<CR><ESC>kO
au BufNewFile,BufRead *.php iabbrev <buffer> _fun function()<CR>{<CR>}<CR><ESC>kkk^wi

au BufNewFile,BufRead *.php   se cms=//\ %s
au BufNewFile,BufRead *.phtml se cms=//\ %s
au BufNewFile,BufRead *.phtml im <buffer> <C-z> <lt>?=  ?><Left><Left><Left>
au BufNewFile,BufRead *.phtml im <buffer> <C-u> <lt>?  ?><Left><Left><Left>
au BufNewFile,BufRead *.php   ia <buffer> <silent> th $this-><C-R>=Eatspace()<CR>
au BufNewFile,BufRead *.phtml ia <buffer> <silent> th $this-><C-R>=Eatspace()<CR>

au BufWrite *.php   cal PHP_OnWrite()
au BufWrite *.phtml cal PHP_OnWrite()

au BufNewFile,BufRead,BufEnter *.php   se ts=4 ai cin si
au BufNewFile,BufRead,BufEnter *.phtml se ts=4 ai cin si
au BufNewFile,BufRead,BufEnter *.html  se ts=4 ai cin si


"}}}

" X((HT?)?ML {{{
"au BufNewFile,BufRead,BufEnter *.xml   se equalprg=xmllint\ -xmlout\ -format\ -
"au BufNewFile,BufRead,BufEnter *.xhtml se equalprg=xmllint\ -xmlout\ -format\ -
"autocmd BufNewFile,BufRead,BufEnter *.html set equalprg=xmllint\ -xmlout\ -format\ -

" }}}

" }}}

" }}}

au VimLeave * if v:dying | echo "\nAAAAaaaarrrggghhhh!!!\n" | endif


" source ~/.vim/php-doc.vim
" imap <C-o> :set paste<CR>:exe PhpDoc()<CR>:set nopaste<CR>i

" disable debugger.vim (PHP debugger) key bindings
let g:loaded_pyphpdebugger = 1


if has("gui_running")
    "colorschem panda
    "colorscheme rubyblue
    "colorscheme molokai
    colorscheme wombat2
else
    colorscheme 256_wombat
endif


