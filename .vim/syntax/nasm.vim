" Vim syntax file
" Language:	NASM - The Netwide Assembler (v2.02)
" Maintainer:	Tobias Hoffmann <tobias_hoffmann@gmx.de>
" Last Change:	2008 Apr 16
" Vim URL:	http://www.vim.org/lang.html
" NASM Home:	http://www.cryogen.com/Nasm/


"  Clear old syntax settings
if exists("b:current_syntax")
    finish
endif
let b:current_syntax = "nasm"


syn case ignore
"
" Vim search and movement commands on identifers
"  Comments at start of a line inside which to skip search for indentifiers
setlocal comments=:;
"  Identifier Keyword characters (defines \k)
setlocal iskeyword=@,48-57,#,$,.,?,@-@,_,~

" Comments:
syn region  nasmComment		                start=";" keepend end="$" contains=@nasmGrpInComments
syn region  nasmSpecialComment	                start=";\*\*\*" keepend end="$"
syn keyword nasmInCommentTodo	                contained TODO FIXME BUG NOTE HACK NOTCOOL NOTSOCOOL XXX[XXXXX]
syn cluster nasmGrpInComments	                contains=nasmInCommentTodo
syn cluster nasmGrpComments	                contains=@nasmGrpInComments,nasmComment,nasmSpecialComment



" Label Identifiers:
"  in NASM: 'Everything is a Label'
"  Definition Label = label defined by %[i]define or %[i]assign
"  Identifier Label = label defined as first non-keyword on a line or %[i]macro
syn match   nasmLabelError	                "$\=\(\d\+\K\|[#\.@]\|\$\$\k\)\k*\>"
syn match   nasmLabel		                "\<\(\h\|[?@]\)\k*\>"
syn match   nasmLabel		                "[\$\~]\(\h\|[?@]\)\k*\>"lc=1
"  Labels starting with one or two '.' are special
syn match   nasmLocalLabel	                "\<\.\(\w\|[#$?@~]\)\k*\>"
syn match   nasmLocalLabel	                "\<\$\.\(\w\|[#$?@~]\)\k*\>"ms=s+1
if !exists("nasm_no_warn")
    syn match  nasmLabelWarn	                "\<\~\=\$\=[_\.][_\.\~]*\>"
endif
if exists("nasm_loose_syntax")
    syn match   nasmSpecialLabel	        "\<\.\.@\k\+\>"
    syn match   nasmSpecialLabel	        "\<\$\.\.@\k\+\>"ms=s+1
    if !exists("nasm_no_warn")
        syn match   nasmLabelWarn	        "\<\$\=\.\.@\(\d\|[#$\.~]\)\k*\>"
    endif
    " disallow use of nasm internal label format
    syn match   nasmLabelError	                "\<\$\=\.\.@\d\+\.\k*\>"
else
    syn match   nasmSpecialLabel	        "\<\.\.@\(\h\|[?@]\)\k*\>"
    syn match   nasmSpecialLabel	        "\<\$\.\.@\(\h\|[?@]\)\k*\>"ms=s+1
endif
"  Labels can be dereferenced with '$' to destinguish them from reserved words
syn match   nasmLabelError	                "\<\$\K\k*\s*:"
syn match   nasmLabelError	                "^\s*\$\K\k*\>"
syn match   nasmLabelError	                "\<\~\s*\(\k*\s*:\|\$\=\.\k*\)"



" Constants:
syn match   nasmStringError	                +["']+
syn match   nasmString		                +\("[^"]\{-}"\|'[^']\{-}'\)+
syn match   nasmBinNumber	                "\<[0-1]\+b\>"
syn match   nasmBinNumber	                "\<\~[0-1]\+b\>"lc=1
syn match   nasmOctNumber	                "\<\o\+q\>"
syn match   nasmOctNumber	                "\<\~\o\+q\>"lc=1
syn match   nasmDecNumber	                "\<\d\+\>"
syn match   nasmDecNumber	                "\<\~\d\+\>"lc=1
syn match   nasmHexNumber	                "\<\(\d\x*h\|0x\x\+\|\$\d\x*\)\>"
syn match   nasmHexNumber	                "\<\~\(\d\x*h\|0x\x\+\|\$\d\x*\)\>"lc=1
syn match   nasmFltNumber	                "\<\d\+\.\d*\(e[+-]\=\d\+\)\=\>"
syn keyword nasmFltNumber	                Inf Infinity Indefinite NaN SNaN QNaN
syn match   nasmNumberError	                "\<\~\s*\d\+\.\d*\(e[+-]\=\d\+\)\=\>"



" Netwide Assembler Storage Directives:
"  Storage types
syn keyword nasmTypeError	                df extrn fword resf tbyte
syn keyword nasmType		                far near short
syn keyword nasmType		                byte word dword qword dqword hword dhword tword
syn keyword nasmType		                cdecl fastcall none pascal stdcall
syn keyword nasmStorage		                db dw dd dq ddq dt
if exists("nasm_amd64_syntax")
    syn keyword nasmStorage		        do
endif
syn keyword nasmStorage		                resb resw resd resq resdq rest
if exists("nasm_amd64_syntax")
    syn keyword nasmStorage		        reso
endif
syn keyword nasmStorage		                extern global common
"  Structured storage types
syn match   nasmTypeError	                "\<\(AT\|I\=\(END\)\=\(STRUCT\=\|UNION\)\|I\=END\)\>"
syn match   nasmStructureLabel	                contained "\<\(AT\|I\=\(END\)\=\(STRUCT\=\|UNION\)\|I\=END\)\>"
"   structures cannot be nested (yet) -> use: 'keepend' and 're='
syn cluster nasmGrpCntnStruc	                contains=ALLBUT,@nasmGrpInComments,nasmMacroDef,@nasmGrpInMacros,@nasmGrpInPreCondits,nasmStructureDef,@nasmGrpInStrucs
syn region  nasmStructureDef	                transparent matchgroup=nasmStructure keepend start="^\s*STRUCT\>"hs=e-5 end="^\s*ENDSTRUCT\>"re=e-9 contains=@nasmGrpCntnStruc
syn region  nasmStructureDef	                transparent matchgroup=nasmStructure keepend start="^\s*STRUC\>"hs=e-4  end="^\s*ENDSTRUC\>"re=e-8  contains=@nasmGrpCntnStruc
syn region  nasmStructureDef	                transparent matchgroup=nasmStructure keepend start="\<ISTRUCT\=\>" end="\<IEND\(STRUCT\=\)\=\>" contains=@nasmGrpCntnStruc,nasmInStructure
"   union types are not part of nasm (yet)
"syn region  nasmStructureDef	transparent matchgroup=nasmStructure keepend start="^\s*UNION\>"hs=e-4 end="^\s*ENDUNION\>"re=e-8 contains=@nasmGrpCntnStruc
"syn region  nasmStructureDef	transparent matchgroup=nasmStructure keepend start="\<IUNION\>" end="\<IEND\(UNION\)\=\>" contains=@nasmGrpCntnStruc,nasmInStructure
syn match   nasmInStructure	                contained "^\s*AT\>"hs=e-1
syn cluster nasmGrpInStrucs	                contains=nasmStructure,nasmInStructure,nasmStructureLabel



" PreProcessor Instructions:
" NAsm PreProcs start with %, but % is not a character
syn match   nasmPreProcError	                "%{\=\(%\=\k\+\|%%\+\k*\|[+-]\=\d\+\)}\="
if exists("nasm_loose_syntax")
    syn cluster nasmGrpNxtCtx	                contains=nasmStructureLabel,nasmLabel,nasmLocalLabel,nasmSpecialLabel,nasmLabelError,nasmPreProcError
else
    syn cluster nasmGrpNxtCtx	                contains=nasmStructureLabel,nasmLabel,nasmLabelError,nasmPreProcError
endif

"  Multi-line macro
syn cluster nasmGrpCntnMacro	                contains=ALLBUT,@nasmGrpInComments,nasmStructureDef,@nasmGrpInStrucs,nasmMacroDef,@nasmGrpPreCondits,nasmMemReference,nasmInMacPreCondit,nasmInMacStrucDef
syn region  nasmMacroDef	                matchgroup=nasmMacro keepend start="^\s*%macro\>"hs=e-5 start="^\s*%imacro\>"hs=e-6 end="^\s*%endmacro\>"re=e-9 contains=@nasmGrpCntnMacro,nasmInMacStrucDef
if exists("nasm_loose_syntax")
    syn match  nasmInMacLabel	                contained "%\(%\k\+\>\|{%\k\+}\)"
    syn match  nasmInMacLabel	                contained "%\($\+\(\w\|[#\.?@~]\)\k*\>\|{$\+\(\w\|[#\.?@~]\)\k*}\)"
    syn match  nasmInMacPreProc	                contained "^\s*%\(push\|repl\)\>"hs=e-4 skipwhite nextgroup=nasmStructureLabel,nasmLabel,nasmInMacParam,nasmLocalLabel,nasmSpecialLabel,nasmLabelError,nasmPreProcError
    if !exists("nasm_no_warn")
        syn match nasmInMacLblWarn	        contained "%\(%[$\.]\k*\>\|{%[$\.]\k*}\)"
        syn match nasmInMacLblWarn	        contained "%\($\+\(\d\|[#\.@~]\)\k*\|{\$\+\(\d\|[#\.@~]\)\k*}\)"
        hi link nasmInMacCatLabel	        nasmInMacLblWarn
    else
        hi link nasmInMacCatLabel	        nasmInMacLabel
    endif
else
    syn match  nasmInMacLabel	                contained "%\(%\(\w\|[#?@~]\)\k*\>\|{%\(\w\|[#?@~]\)\k*}\)"
    syn match  nasmInMacLabel	                contained "%\($\+\(\h\|[?@]\)\k*\>\|{$\+\(\h\|[?@]\)\k*}\)"
    hi link nasmInMacCatLabel	                nasmLabelError
endif
syn match   nasmInMacCatLabel	                contained "\d\K\k*"lc=1
syn match   nasmInMacLabel	                contained "\d}\k\+"lc=2
if !exists("nasm_no_warn")
    syn match  nasmInMacLblWarn	                contained "%\(\($\+\|%\)[_~][._~]*\>\|{\($\+\|%\)[_~][._~]*}\)"
endif
syn match   nasmInMacPreProc	                contained "^\s*%pop\>"hs=e-3
syn match   nasmInMacPreProc	                contained "^\s*%\(push\|repl\)\>"hs=e-4 skipwhite nextgroup=@nasmGrpNxtCtx
"   structures cannot be nested (yet) -> use    : 'keepend' and 're='
syn region  nasmInMacStrucDef	                contained transparent matchgroup=nasmStructure keepend start="^\s*STRUCT\>"hs=e-5 end="^\s*ENDSTRUCT\>"re=e-9 contains=@nasmGrpCntnMacro
syn region  nasmInMacStrucDef	                contained transparent matchgroup=nasmStructure keepend start="^\s*STRUC\>"hs=e-4  end="^\s*ENDSTRUC\>"re=e-8  contains=@nasmGrpCntnMacro
syn region  nasmInMacStrucDef	                contained transparent matchgroup=nasmStructure keepend start="\<ISTRUCT\=\>" end="\<IEND\(STRUCT\=\)\=\>" contains=@nasmGrpCntnMacro,nasmInStructure
"   union types are not part of nasm (yet)
"syn region  nasmInMacStrucDef	contained transparent matchgroup=nasmStructure keepend start="^\s*UNION\>"hs=e-4 end="^\s*ENDUNION\>"re=e-8 contains=@nasmGrpCntnMacro
"syn region  nasmInMacStrucDef	contained transparent matchgroup=nasmStructure keepend start="\<IUNION\>" end="\<IEND\(UNION\)\=\>" contains=@nasmGrpCntnMacro,nasmInStructure
syn region  nasmInMacPreConDef	                contained transparent matchgroup=nasmInMacPreCondit start="^\s*%ifnidni\>"hs=e-7 start="^\s*%if\(idni\|n\(ctx\|def\|idn\|num\|str\)\)\>"hs=e-6 start="^\s*%if\(ctx\|def\|idn\|nid\|num\|str\)\>"hs=e-5 start="^\s*%ifid\>"hs=e-4 start="^\s*%if\>"hs=e-2 end="%endif\>" contains=@nasmGrpCntnMacro,nasmInMacPreCondit,nasmInPreCondit
syn match   nasmInMacPreCondit	                contained transparent "ctx\s"lc=3 skipwhite nextgroup=@nasmGrpNxtCtx
syn match   nasmInMacPreCondit	                contained "^\s*%elifctx\>"hs=e-7 skipwhite nextgroup=@nasmGrpNxtCtx
syn match   nasmInMacPreCondit	                contained "^\s*%elifnctx\>"hs=e-8 skipwhite nextgroup=@nasmGrpNxtCtx
syn match   nasmInMacParamNum	                contained "\<\d\+\.list\>"me=e-5
syn match   nasmInMacParamNum	                contained "\<\d\+\.nolist\>"me=e-7
syn match   nasmInMacDirective	                contained "\.\(no\)\=list\>"
syn match   nasmInMacMacro	                contained transparent "macro\s"lc=5 skipwhite nextgroup=nasmStructureLabel
syn match   nasmInMacMacro	                contained "^\s*%rotate\>"hs=e-6
syn match   nasmInMacParam	                contained "%\([+-]\=\d\+\|{[+-]\=\d\+}\)"
"   nasm conditional macro operands/arguments
"   Todo: check feasebility; add to nasmGrpInMacros, etc.
"syn match   nasmInMacCond	contained "\<\(N\=\([ABGL]E\=\|[CEOSZ]\)\|P[EO]\=\)\>"
syn cluster nasmGrpInMacros	                contains=nasmMacro,nasmInMacMacro,nasmInMacParam,nasmInMacParamNum,nasmInMacDirective,nasmInMacLabel,nasmInMacLblWarn,nasmInMacMemRef,nasmInMacPreConDef,nasmInMacPreCondit,nasmInMacPreProc,nasmInMacStrucDef

"   Context pre-procs that are better used inside a macro
if exists("nasm_ctx_outside_macro")
    syn region nasmPreConditDef	                transparent matchgroup=nasmCtxPreCondit start="^\s*%ifnctx\>"hs=e-6 start="^\s*%ifctx\>"hs=e-5 end="%endif\>" contains=@nasmGrpCntnPreCon
    syn match  nasmCtxPreProc	                "^\s*%pop\>"hs=e-3
    if exists("nasm_loose_syntax")
        syn match   nasmCtxLocLabel	        "%$\+\(\w\|[#\.?@~]\)\k*\>"
    else
        syn match   nasmCtxLocLabel	        "%$\+\(\h\|[?@]\)\k*\>"
    endif
    syn match nasmCtxPreProc	                "^\s*%\(push\|repl\)\>"hs=e-4 skipwhite nextgroup=@nasmGrpNxtCtx
    syn match nasmCtxPreCondit	                contained transparent "ctx\s"lc=3 skipwhite nextgroup=@nasmGrpNxtCtx
    syn match nasmCtxPreCondit	                contained "^\s*%elifctx\>"hs=e-7 skipwhite nextgroup=@nasmGrpNxtCtx
    syn match nasmCtxPreCondit	                contained "^\s*%elifnctx\>"hs=e-8 skipwhite nextgroup=@nasmGrpNxtCtx
    if exists("nasm_no_warn")
        hi link nasmCtxPreCondit	        nasmPreCondit
        hi link nasmCtxPreProc	                nasmPreProc
        hi link nasmCtxLocLabel	                nasmLocalLabel
    else
        hi link nasmCtxPreCondit	        nasmPreProcWarn
        hi link nasmCtxPreProc	                nasmPreProcWarn
        hi link nasmCtxLocLabel	                nasmLabelWarn
    endif
endif

"  Conditional assembly
syn cluster nasmGrpCntnPreCon	                contains=ALLBUT,@nasmGrpInComments,@nasmGrpInMacros,@nasmGrpInStrucs
syn region  nasmPreConditDef	                transparent matchgroup=nasmPreCondit start="^\s*%ifnidni\>"hs=e-7 start="^\s*%if\(idni\|n\(def\|idn\|num\|str\)\)\>"hs=e-6 start="^\s*%if\(def\|idn\|nid\|num\|str\)\>"hs=e-5 start="^\s*%ifid\>"hs=e-4 start="^\s*%if\>"hs=e-2 end="%endif\>" contains=@nasmGrpCntnPreCon
syn match   nasmInPreCondit	                contained "^\s*%el\(if\|se\)\>"hs=e-4
syn match   nasmInPreCondit	                contained "^\s*%elifid\>"hs=e-6
syn match   nasmInPreCondit	                contained "^\s*%elif\(def\|idn\|nid\|num\|str\)\>"hs=e-7
syn match   nasmInPreCondit	                contained "^\s*%elif\(n\(def\|idn\|num\|str\)\|idni\)\>"hs=e-8
syn match   nasmInPreCondit	                contained "^\s*%elifnidni\>"hs=e-9
syn cluster nasmGrpInPreCondits	                contains=nasmPreCondit,nasmInPreCondit,nasmCtxPreCondit
syn cluster nasmGrpPreCondits	                contains=nasmPreConditDef,@nasmGrpInPreCondits,nasmCtxPreProc,nasmCtxLocLabel

"  Other pre-processor statements
syn match   nasmPreProc		                "^\s*%rep\>"hs=e-3
syn match   nasmPreProc		                "^\s*%line\>"hs=e-4
syn match   nasmPreProc		                "^\s*%\(clear\|error\)\>"hs=e-5
syn match   nasmPreProc		                "^\s*%endrep\>"hs=e-6
syn match   nasmPreProc		                "^\s*%exitrep\>"hs=e-7
syn match   nasmDefine		                "^\s*%undef\>"hs=e-5
syn match   nasmDefine		                "^\s*%\(assign\|define\)\>"hs=e-6
syn match   nasmDefine		                "^\s*%i\(assign\|define\)\>"hs=e-7
syn match   nasmDefine		                "^\s*%xdefine\>"hs=e-7
syn match   nasmDefine		                "^\s*%ixdefine\>"hs=e-8
syn match   nasmInclude		                "^\s*%include\>"hs=e-7

"  Multiple pre-processor instructions on single line detection (obsolete)
"syn match   nasmPreProcError	+^\s*\([^\t "%';][^"%';]*\|[^\t "';][^"%';]\+\)%\a\+\>+
syn cluster nasmGrpPreProcs	                contains=nasmMacroDef,@nasmGrpInMacros,@nasmGrpPreCondits,nasmPreProc,nasmDefine,nasmInclude,nasmPreProcWarn,nasmPreProcError



" Register Identifiers:
"  Register operands:


if exists("nasm_amd64_syntax")
    syn keyword nasmGen08Register               al ah cl ch dl dh bl bh spl bpl sil dil r8b 
                                                \r9b r10b r11b r12b r13b r14b r15b 
    syn keyword nasmGen16Register	        ax cx dx bx bp sp wp si di r8w r9w r10w r11w 
                                                \r12w r13w r14w r15w 
    syn keyword nasmGen32Register	        eax ecx edx ebx esp ebp esi edi r8d r9d r10d 
                                                \r11d r12d r13d r14d r15d 
    syn keyword nasmGen64Register	        rax rcx rx rbx rsp rbp rsi ri r8 r9 r10 r11 
                                                \r12 r13 r14 r15 
else
    syn match   nasmGen08Register	        "\<[a-d][hl]\>"
    syn match   nasmGen16Register	        "\<\([a-d]x\|[ds]i\|[bs]p\)\>"
    syn match   nasmGen32Register	        "\<e\([a-d]x\|[ds]i\|[bs]p\)\>"
endif


syn match   nasmSegRegister	                "\<[c-gs]s\>"
syn match   nasmSpcRegister	                "\<e\=ip\>"
syn match   nasmFpuRegister	                "\<st\o\>"
syn match   nasmMmxRegister	                "\<mm\o\>"
syn match   nasmSseRegister	                "\<xmm\o\>"
syn match   nasmCtrlRegister	                "\<cr\o\>"
syn match   nasmDebugRegister	                "\<dr\o\>"
syn match   nasmTestRegister	                "\<tr\o\>"
syn match   nasmRegisterError	                "\<\(cr[15-9]\|dr[4-58-9]\|tr[0-28-9]\)\>"
if !exists("nasm_amd64_syntax")
    syn match   nasmRegisterError	        "\<x\=mm[8-9]\>"
endif
syn match   nasmRegisterError	                "\<st\((\d)\|[8-9]\>\)"
syn match   nasmRegisterError	                "\<e\([a-d][hl]\|[c-gs]s\)\>"
"  Memory reference operand (address):
syn match   nasmMemRefError	                "[\[\]]"
syn cluster nasmGrpCntnMemRef	                contains=ALLBUT,@nasmGrpComments,@nasmGrpPreProcs,@nasmGrpInStrucs,nasmMemReference,nasmMemRefError
syn match   nasmInMacMemRef	                contained "\[[^;\[\]]\{-}\]" contains=@nasmGrpCntnMemRef,nasmPreProcError,nasmInMacLabel,nasmInMacLblWarn,nasmInMacParam
syn match   nasmMemReference	                "\[[^;\[\]]\{-}\]" contains=@nasmGrpCntnMemRef,nasmPreProcError,nasmCtxLocLabel



" Netwide Assembler Directives:
"  Compilation constants
syn case match
syn keyword nasmConstant	                __BITS__ __DATE__ __FILE__ __FORMAT__ __LINE__
syn keyword nasmConstant	                __NASM_MAJOR__ __NASM_MINOR__ __NASM_VERSION__
syn keyword nasmConstant	                __TIME__
syn case ignore
"  Instruction modifiers
syn match   nasmInstructnError	                "\<TO\>"
syn match   nasmInstrModifier	                "\(^\|:\)\s*[c-gs]S\>"ms=e-1
syn keyword nasmInstrModifier	                a16 a32 o16 o32
syn keyword nasmInstrModifier	                rep repz repe repne
syn match   nasmInstrModifier	                "\<f\(add\|mul\|\(div\|sub\)r\=\)\s\+to\>"lc=5,ms=e-1
"   the 'to' keyword is not allowed for fpu-pop instructions (yet)
"syn match   nasmInstrModifier	"\<f\(add\|mul\|\(div\|sub\)r\=\)p\s\+to\>"lc=6,ms=e-1
"  NAsm directives
syn keyword nasmRepeat		                times
syn keyword nasmDirective	                align[b] incbin equ nosplit split
if exists("nasm_amd64_syntax")
    syn keyword nasmDirective	                rel abs
    syn keyword nasmDirective	                default
endif
syn keyword nasmDirective	                absolute bits cpu float
syn keyword nasmDirective	                section segment endsection endsegment
syn case match
syn keyword nasmDirective	                __SECT__
"  Macro created standard directives: (requires %include)
syn keyword nasmStdDirective	                ENDPROC EPILOGUE LOCALS PROC PROLOGUE USES
syn keyword nasmStdDirective	                ENDIF ELSE ELIF ELSIF IF
"syn keyword nasmStdDirective	                BREAK CASE DEFAULT ENDSWITCH SWITCH
"syn keyword nasmStdDirective	                CASE OF ENDCASE
syn keyword nasmStdDirective	                DO ENDFOR ENDWHILE FOR REPEAT UNTIL WHILE EXIT
syn case ignore
"  Format specific directives: (all formats)
"  (excluded: extension directives to section, global, common and extern)
syn keyword nasmFmtDirective	                org
syn keyword nasmFmtDirective	                export import group uppercase seg wrt
syn keyword nasmFmtDirective	                library
syn case match
syn keyword nasmFmtDirective	                _GLOBAL_OFFSET_TABLE_ __GLOBAL_OFFSET_TABLE_
syn keyword nasmFmtDirective	                ..start ..got ..gotoff ..gotpc ..plt ..sym
syn case ignore



" Standard Instructions:
syn match   nasmInstructnError	                "\<\(f\=cmov\|set\)n\=\a\{0,2}\>"
syn keyword nasmInstructnError	                cmps movs lcs lods stos xlat
syn match   nasmStdInstruction	                "\<mov\>"
syn match   nasmInstructnError	                "\<mov\s[^,;[]*\<cs\>\s*[^:]"he=e-1
syn match   nasmCondInstruction	                "\<\(cmov\|j\|set\)\(n\=\([abgl]e\=\|[ceosz]\)\|p[eo]\=\)\>"
syn match   nasmStdInstruction	                "\<pop\>"
syn keyword nasmStdInstruction	                aaa aad aam aas add and 
syn keyword nasmStdInstruction	                bound bsf bsr bswap bt[c] btr bts
syn keyword nasmCondInstruction                 jmp jcxz jecxz cmp cmpsb cmpsd cmpsw 
syn keyword nasmCondInstruction                 movsb movsd movsw lodsb lodsd lodsw loop[e] loopne loopnz loopz 
syn keyword nasmCondInstruction                 sbb scasb scasd scasw stosb stosd stosw adc call retf ret[n]
syn keyword nasmStdInstruction	                cbw cdq clc cld cmc
syn keyword nasmStdInstruction	                cwd[e]
syn keyword nasmStdInstruction	                daa das dec div enter
syn keyword nasmStdInstruction	                idiv imul inc
syn keyword nasmStdInstruction	                lahf lds lea leave les lfs lgs 
syn keyword nasmStdInstruction	                lss movsx movzx 
syn keyword nasmStdInstruction	                mul neg nop not
syn keyword nasmStdInstruction	                or popa[d] popaw popf[d] popfw
syn keyword nasmStdInstruction	                push[ad] pushaw pushf[d] pushfw
syn keyword nasmStdInstruction	                rcl rcr rol ror
syn keyword nasmStdInstruction	                sahf sal sar 
syn keyword nasmStdInstruction	                shl[d] shr[d] stc std sub
syn keyword nasmStdInstruction	                test xadd xchg xlatb xor


" System Instructions: (usually privileged)
" Not privileged, but used for system purposes
syn keyword nasmSysInstruction                  rdtsc cmpxchg cmpxchg8b cpuid int[o] iret[d] iretw
if exists("nasm_amd64_syntax")
    syn keyword nasmSysInstruction              cmpxchg16b
endif
"  Verification of pointer parameters
syn keyword nasmSysInstruction	                arpl lar lsl verr verw
"  Addressing descriptor tables
syn keyword nasmSysInstruction	                lldt sldt lgdt sgdt
"  Multitasking
syn keyword nasmSysInstruction	                ltr str
"  Coprocessing and Multiprocessing (requires fpu and multiple cpu's resp.)
syn keyword nasmSysInstruction	                clts lock wait
"  Input and Output
syn keyword nasmInstructnError	                ins outs
syn keyword nasmSysInstruction	                in insb insw insd out outsb outsb outsw outsd
"  Interrupt control
syn keyword nasmSysInstruction	                cli sti lidt sidt
"  System control
syn match   nasmSysInstruction	                "\<mov\s[^;]\{-}\<cr\o\>"me=s+3
syn keyword nasmSysInstruction	                hlt invd lmsw
syn keyword nasmSseInstruction	                prefetcht0 prefetcht1 prefetcht2 prefetchnta
syn keyword nasmSseInstruction	                rsm sfence smsw sysenter sysexit ud2 wbinvd
"  TLB (Translation Lookahead Buffer) testing
syn match   nasmSysInstruction	                "\<mov\s[^;]\{-}\<tr\o\>"me=s+3
syn keyword nasmSysInstruction	                invlpg

" Debugging Instructions: (privileged)
syn match   nasmDbgInstruction	                "\<mov\s[^;]\{-}\<dr\o\>"me=s+3
syn keyword nasmDbgInstruction	                int1 int3 rdmsr rdpmc wrmsr


" FPU Instructions: (requires FPU)
syn match   nasmFpuInstruction	                "\<fcmovn\=\([ab]e\=\|[cepuz]\)\>"
syn keyword nasmFpuInstruction	                f2xm1 fabs fadd[p] fbld fbstp
syn keyword nasmFpuInstruction	                fchs fclex fcom[ip] fcomp[p] fcos
syn keyword nasmFpuInstruction	                fdecstp fdisi fdiv[p] fdivr[p] feni ffree
syn keyword nasmFpuInstruction	                fiadd ficom[p] fidiv[r] fild
syn keyword nasmFpuInstruction	                fimul fincstp finit fist[p] fisub[r]
syn keyword nasmFpuInstruction	                fld[1] fldcw fldenv fldl2e fldl2t fldlg2
syn keyword nasmFpuInstruction	                fldln2 fldpi fldz fmul[p]
syn keyword nasmFpuInstruction	                fnclex fndisi fneni fninit fnop fnsave
syn keyword nasmFpuInstruction	                fnstcw fnstenv fnstsw fnstsw
syn keyword nasmFpuInstruction	                fpatan fprem[1] fptan frndint frstor
syn keyword nasmFpuInstruction	                fsave fscale fsetpm fsin fsincos fsqrt
syn keyword nasmFpuInstruction	                fstcw fstenv fst[p] fstsw fsub[p] fsubr[p]
syn keyword nasmFpuInstruction	                ftst fucom[ip] fucomp[p]
syn keyword nasmFpuInstruction	                fxam fxch fxtract fyl2x fyl2xp1


" MMX Packed Instructions:
"  Standard MMX instructions:
syn match   nasmInstructnError	                "\<P\(add\|sub\)u\=s\=[dq]\=\>"
syn match   nasmInstructnError	                "\<pcmp\a\{0,2}[bdwq]\=\>"
syn keyword nasmMmxInstruction	                emms movd movq
syn keyword nasmMmxInstruction	                packssdw packsswb packuswb paddb paddd paddw
syn keyword nasmMmxInstruction	                paddsb paddsw paddusb paddusw pand[n]
syn keyword nasmMmxInstruction	                pcmpeqb pcmpeqd pcmpeqw pcmpgtb pcmpgtd pcmpgtw
syn keyword nasmMmxInstruction	                pmachriw pmaddwd pmulhw pmullw por
syn keyword nasmMmxInstruction	                pslld psllq psllw psrad psraw psrld psrlq psrlw
syn keyword nasmMmxInstruction	                psubb psubd psubw psubsb psubsw psubusb psubusw
syn keyword nasmMmxInstruction	                punpckhbw punpckhdq punpckhwd
syn keyword nasmMmxInstruction	                punpcklbw punpckldq punpcklwd pxor
"  Extended MMX instructions:
syn keyword nasmMmxInstruction	                maskmovq movntq
syn keyword nasmMmxInstruction	                pavgb pavgw pextrw pinsrw pmaxsw pmaxub
syn keyword nasmMmxInstruction	                pminsw pminub pmovmskb pmulhuw psadbw pshufw


" SSE Packed Instructions:
syn match   nasmInstructnError	                "\<cmp\a\{1,5}[ps]s\>"
syn match   nasmSseInstruction	                "\<cmp\(n\=\(eq\|l[et]\)\|\(un\)\=ord\)\=[ps]s\>"
syn keyword nasmSseInstruction	                addps addss andnps andps
syn keyword nasmSseInstruction	                comiss cvtpi2ps cvtps2pi
syn keyword nasmSseInstruction	                cvtsi2ss cvtss2si cvttps2pi cvttss2si
syn keyword nasmSseInstruction	                divps divss fxrstor fxsave ldmxcsr
syn keyword nasmSseInstruction	                maxps maxss minps minss movaps movhlps movhps
syn keyword nasmSseInstruction	                movlhps movlps movmskps movntps movss movups
syn keyword nasmSseInstruction	                mulps mulss
syn keyword nasmSseInstruction	                orps rcpps rcpss rsqrtps rsqrtss
syn keyword nasmSseInstruction	                shufps sqrtps sqrtss stmxcsr subps subss
syn keyword nasmSseInstruction	                ucomiss unpckhps unpcklps xorps


" 3DNow Packed Instructions:
syn keyword nasmNowInstruction	                femms pavgusb pf2id pfacc pfadd pfcmpeq pfcmpge
syn keyword nasmNowInstruction	                pfcmpgt pfmax pfmin pfmul pfrcp pfrcpit1
syn keyword nasmNowInstruction	                pfrcpit2 pfrsqit1 pfrsqrt pfsub[r] pi2fd
syn keyword nasmNowInstruction	                pmulhrwa prefetch[w]


" Vendor Specific Instructions:
"  Cyrix instructions (requires Cyrix processor)
"syn keyword nasmCrxInstruction	paddsiw paveb pdistib pmagw pmulhrw[c] pmulhriw
"syn keyword nasmCrxInstruction	pmvgezb pmvlzb pmvnzb pmvzb psubsiw
"syn keyword nasmCrxInstruction	rdshr rsdc rsldt smint smintold svdc svldt svts
"syn keyword nasmCrxInstruction	wrshr
""  AMD instructions (requires AMd processor)
syn keyword nasmAmdInstruction	                syscall sysret sysenter sysexit


" Undocumented Instructions:
syn match   nasmUndInstruction	                "\<pop\s[^;]*\<cs\>"me=s+3
syn keyword nasmUndInstruction	                cmpxchg486 ibts icebp int01 int03 loadall
syn keyword nasmUndInstruction	                loadall286 loadall386 salc smi ud1 umov xbts



" Synchronize Syntax:
syn sync clear
syn sync minlines=100		"for multiple region nesting
syn sync match  nasmSync	                grouphere nasmMacroDef "^\s*%i\=macro\>"me=s-1
syn sync match	nasmSync	                grouphere NONE	       "^\s*%endmacro\>"


" Define the default highlighting only when an item doesn't have highlighting yet
if !exists("did_nasm_syntax_inits")
    command -nargs=+ HiLink hi def link <args>

    " Sub Links:
    HiLink nasmInMacDirective	                nasmDirective
    HiLink nasmInMacLabel	                nasmLocalLabel
    HiLink nasmInMacLblWarn	                nasmLabelWarn
    HiLink nasmInMacMacro	                nasmMacro
    HiLink nasmInMacParam	                nasmMacro
    HiLink nasmInMacParamNum	                nasmDecNumber
    HiLink nasmInMacPreCondit	                nasmPreCondit
    HiLink nasmInMacPreProc	                nasmPreProc
    HiLink nasmInPreCondit	                nasmPreCondit
    HiLink nasmInStructure	                nasmStructure
    HiLink nasmStructureLabel	                nasmStructure

    " Comment Group:
    HiLink nasmComment		                Comment
    HiLink nasmSpecialComment	                SpecialComment
    HiLink nasmInCommentTodo	                Todo

    " Constant Group:
    HiLink nasmString		                String
    HiLink nasmStringError	                Error
    HiLink nasmBinNumber	                Number
    HiLink nasmOctNumber	                Number
    HiLink nasmDecNumber	                Number
    HiLink nasmHexNumber	                Number
    HiLink nasmFltNumber	                Float
    HiLink nasmNumberError	                Error

    " Identifier Group:
    HiLink nasmLabel		                Identifier
    HiLink nasmLocalLabel	                Identifier
    HiLink nasmSpecialLabel	                Special
    HiLink nasmLabelError	                Error
    HiLink nasmLabelWarn	                Todo

    " PreProc Group:
    HiLink nasmPreProc		                PreProc
    HiLink nasmDefine		                Define
    HiLink nasmInclude		                Include
    HiLink nasmMacro		                Macro
    HiLink nasmPreCondit	                PreCondit
    HiLink nasmPreProcError	                Error
    HiLink nasmPreProcWarn	                Todo

    " Type Group:
    HiLink nasmType		                Type
    HiLink nasmStorage		                StorageClass
    HiLink nasmStructure	                Structure
    HiLink nasmTypeError	                Error

    " Directive Group:
    HiLink nasmConstant		                Constant
    HiLink nasmInstrModifier	                StorageClass
    HiLink nasmRepeat		                Repeat
    HiLink nasmDirective                        Keyword
    HiLink nasmStdDirective	                Operator
    HiLink nasmFmtDirective	                Keyword

    " Register Group:
    HiLink nasmGen08Register                    Keyword
    HiLink nasmGen16Register                    Keyword
    HiLink nasmGen32Register                    Keyword
    HiLink nasmGen64Register                    Keyword
    HiLink nasmSegRegister                      Keyword
    HiLink nasmFpuRegister	                Keyword
    HiLink nasmMmxRegister	                Keyword
    HiLink nasmSseRegister	                Keyword
    HiLink nasmCtrlRegister	                Special
    HiLink nasmSpcRegister	                Special
    HiLink nasmTestRegister	                Special
    HiLink nasmDebugRegister	                Debug
    HiLink nasmMemRefError	                Error
    HiLink nasmRegisterError	                Error
    
    " Instruction Group:
    HiLink nasmStdInstruction	                Statement
    HiLink nasmCondInstruction	                Statement
    HiLink nasmSysInstruction	                Debug
    HiLink nasmDbgInstruction	                Debug
    HiLink nasmFpuInstruction	                Special
    HiLink nasmMmxInstruction	                Special
    HiLink nasmSseInstruction	                Special
    HiLink nasmNowInstruction	                Special
    HiLink nasmAmdInstruction	                Todo
    "HiLink nasmCrxInstruction	                Special
    HiLink nasmUndInstruction	                Todo
    HiLink nasmInstructnError	                Error

    delcommand HiLink
endif


" vim: set ts=8 sw=4 sts=8 et:
