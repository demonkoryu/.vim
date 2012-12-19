if !has('python')
    fini
en

python << endpython
import vim

simplePairs_pairs = {'(': ')', '[': ']', '{': '}', '"': '"', "'": "'"}

def simplePairs_getNextChar():
    'returns next char or None, for end of line'
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1]
    if len(line) == col:
        return None
    else:
        return line[col]

def simplePairs_isEmptyPair():
    'returns wether the cursor is inside an empty pair'
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1]
    if (col == 0) or (len(line) == col):
        return False
    else:
        return simplePairs_pairs.get(line[col - 1], None) == line[col]

def simplePairs_InsertPair(c):
    matchingPair = simplePairs_pairs[c]
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1]
    insertPair = (len(line) == col) or (line[col] == matchingPair)
    # to nest pairs or nextChar in " ,:."

    if matchingPair == '"':
	matchingPair = c = '\\"'
    cmd = 'let l:rv = "' + c
    if insertPair:
        cmd += matchingPair + '\\<Left>'
    cmd += '"'
    vim.command(cmd)

def simplePairs_ClosePair(c):
    ret = 'let l:rv = '
    if simplePairs_getNextChar() == c:
        vim.command(ret + '"\\<Right>"')
    else:
        vim.command(ret + 'a:c')

def simplePairs_Backspace():
    cmd = 'let l:rv = "\\<BS>'
    if simplePairs_isEmptyPair():
        cmd += '\\<Del>'
    cmd += '"'
    vim.command(cmd)
endpython

exe "fu! s:InsertPair(c, it)"
    let col  = col('.')
    let line = getline(line('.'))

    if (a:c == line[col-2]) || (a:c == line[col-1]) ||
		\ (a:it == 0 && synIDattr(synID(line("."), col("."), 1), "name") =~? 
		\ "string\|singlequote\|special\|constant")

	retu a:c
    en
python << endpython
simplePairs_InsertPair(vim.eval('a:c'))
endpython
    retu l:rv
endf

exe "fu! s:ClosePair(c)"
python << endpython
simplePairs_ClosePair(vim.eval('a:c'))
endpython
    retu l:rv
endf

exe "fu! s:Backspace()"
python << endpython
simplePairs_Backspace()
endpython
    retu l:rv
endf

python << endpython
for open, close in simplePairs_pairs.items():
    if open == "'":
	vim.command("ino <silent> ' <C-R>=<SID>InsertPair(\"'\", 0)<Cr>")
    elif open == '"':
	vim.command("ino <silent> \" <C-R>=<SID>InsertPair('\"', 0)<Cr>")
    else:
	vim.command("ino <silent> %s %s%s<Left>" % (open, open, close))
	vim.command("ino <silent> %s <C-R>=<SID>ClosePair(%r)<Cr>" % (close, close))
    #vim.command("ino <silent> %s <C-R>=<SID>InsertPair(%r)<Cr>" % (open, open))
endpython
ino <silent> <BS> <C-R>=<SID>Backspace()<CR>


