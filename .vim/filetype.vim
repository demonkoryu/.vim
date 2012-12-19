" vim: set sw=4 ts=8 sts=4 noet fen fdm=marker fdl=1 fdls=0 tw=120: 
"
" Created:     19 Aug 2008 00:39:37 Tobias Hoffmann <tobias_hoffmann@gmx.de>
" Last Change: 20 Aug 2008 10:56:56 Tobias Hoffmann <tobias_hoffmann@gmx.de>
"
" Copyright (c) 2008 Tobias Hoffmann <tobias_hoffmann@gmx.de>
" All rights reserved.
" 
" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions
" are met:
" 
" 1. Redistributions of source code must retain the above copyright
"    notice, this list of conditions and the following disclaimer.
" 2. Redistributions in binary form must reproduce the above copyright
"    notice, this list of conditions and the following disclaimer in the
"    documentation and/or other materials provided with the distribution.
" 
" THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
" IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
" OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
" IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
" INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
" NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
" DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
" THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
" (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
" THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    " Enemy Territory .cfg {{{
    au BufNewFile,BufRead etconfig.cfg setf et
    " }}}
    " Markdown {{{
    au BufNewFile,BufRead *.text    setfiletype mkd
    au BufNewFile,BufRead *.mkd	    setfiletype mkd
    " }}}
    " Makefile {{{
    au BufNewFile,BufRead *.d	    setfiletype gmake
    au BufNewFile,BufRead *.mk	    setfiletype gmake
    au BufNewFile,BufRead *.mak	    setfiletype gmake
    au BufNewFile,BufRead *Makefile setfiletype gmake
    " }}}
    " Apache config {{{
    au BufNewFile,BufRead *.conf    setfiletype apache
    " }}}
    " PHP {{{
    au BufNewFile,BufRead *.phtml   setfiletype php
    " }}}
    " MySQL config {{{
    au BufNewFile,BufRead my.cnf    setfiletype dosini
    " }}}
augroup END

