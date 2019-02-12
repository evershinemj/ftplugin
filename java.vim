if exists('b:did_my_ftplugin')
    finish "finish sourcing the script
endif
let b:did_my_ftplugin = 1

let b:REGEX_REFERENCE_TYPE = '\([A-Z][a-zA-Z_0-9]\)'
let b:REGEX_PRIMITIVE_TYPE = '\(byte\|char\|short\|int\|float\|long\|double\)\s\+'
let b:REGEX_MODIFIER = '\(public\|private\|protected\|static\|final\|abstract\|\)\s\+'
let b:IDENTIFIER = '\([a-z][a-zA-Z_0-9]*\)'

let maplocalleader = ','

setlocal iskeyword+=@

setlocal makeprg=javac

setlocal formatprg=fmt

" only loaded buffers are scanned for line completion
badd ~/mydict/coding-common

setlocal path=~/java
setlocal path+=~/mydict
setlocal path+=~/linecomplete

"  __^__            __^__
" ( ___ )----------( ___ )
"  | / | map <expr> | \ |
"  |___|            |___|
" (_____)----------(_____)
"

inoremap <buffer> {  {<Esc>o}<Esc>O

" inoreabbrev <expr> <buffer> <Space>{   NewThread()
" function! NewThread()
"     let line = getline('.')
"     if line =~# '\s*new Thread()'
"         return  
"                     \ " {\npublic void run() {" .
"                     \ "\n}\n}.start();"
"     else
"         return ' {'
"     endif
" endfunction

" mapping {<Space> slows down the parsing of {
" inoremap <expr> <buffer> {<Space>   NewThread()
inoremap <expr> <buffer> <LocalLeader>t   NewThread()
function! NewThread()
    let line = getline('.')
    if line =~# '\s*new Thread'
        return  
                    \ "() {\npublic void run() {" .
                    \ "\n}\n}.start();"
    else
        return ''
    endif
endfunction

inoremap <expr> <buffer> e.pr   Trace()
function! Trace()
    let lnum = line('.')
    let lastline = getline(lnum - 1)
    if lastline =~# 'catch'
        return "e.printStackTrace();\n} "
    else
        return 'e.pr'
    endif
endfunction

inoremap <expr> .s   Sleep()
function! Sleep()
    if getline('.') =~ 'Thread' 
        return '.sleep('
    else
        "  can be used to avoid mapping
        return '.s'
    endif
endfunction

inoremap <expr> .y   Yield()
function! Yield()
    if getline('.') =~ 'Thread' 
        return '.yield('
    else
        "  can be used to avoid mapping
        return '.y'
    endif
endfunction

" inoremap <expr> =   EqualsAfterThis()
inoremap <buffer> <expr> =   EqualsAfterThis()
function! EqualsAfterThis()
    " if getline('.') =~ '\s*this.' + b:IDENTIFIER 
    " bug found:
    " should use . to concatenate strings
    if getline('.') =~ '\s*this.' . b:IDENTIFIER 
        echo 'matched'
        echo 'start to call matchstr()'
        return '= ' . matchstr(getline('.'), 
                    \'this\.\zs' . b:IDENTIFIER . '\ze') . ';'
    else
        echo 'not matched'
        return '='
    endif
endfunction
    
inoremap <expr> <buffer> <LocalLeader>r CompleteReference()   
function! CompleteReference()
    let line = getline('.')
    let col = col('.')
    let last_char = line[col - 2]

    " if getline('.') =~? '\s*' . '\([A-Z]\)[a-zA-Z_0-9]' . '\s*' . '\1'
    " if getline('.') =~ '\s*' . '\([A-Z]\)[a-zA-Z_0-9]' . '\s*' . last_char
    " if getline('.') =~ '\(\s*\|(\)' . '\([A-Z]\)[a-zA-Z_0-9]' . '\s*' . last_char
    if getline('.') =~ '\(\s*\|(\)' . '\([A-Z]\)[a-zA-Z_0-9]' . '\s\+' . last_char
        echo 'matched'
        " let rest = match(line, '\s*' . '\([A-Z]\)\zs[a-zA-Z_0-9]\ze\s*')
        " ignorecase is set! 
        setlocal noic
        " let rest = matchstr(line, '\s*' . '\([A-Z]\)\zs[a-zA-Z_0-9]*\ze\s*')
        " should match the last word with Capitalized first letter
        " let rest = matchstr(line, '\s*' . '\([A-Z]\)\zs[a-zA-Z_0-9]*\ze\s*' . last_char)
        " still not correct, as last_char might be contained in another word
        " let rest = matchstr(line, '\s*' . '\([A-Z]\)\zs[a-zA-Z_0-9]*\ze\s*' . last_char . '$')
        " BUG FOUND:
        " SUBTLE BUG:
        " \s*\|( should be parenthesized as a whole
        " otherwise the pattern would be parsed as
        " '\s*' . '\|' . '\([A-Z]\)\zs[a-zA-Z_0-9]*\ze\s*'
        " let rest = matchstr(line, '\s*\|(' . '\([A-Z]\)\zs[a-zA-Z_0-9]*\ze\s*' . last_char . '$')
        " let rest = matchstr(line, '\(\s*\|(\)' . '\([A-Z]\)\zs[a-zA-Z_0-9]*\ze\s*' . last_char . '$')
        " let rest = matchstr(line, '\(\s*\)' . '\([A-Z]\)\zs[a-zA-Z_0-9]*\ze\s*' . last_char . '$')
        " let rest = matchstr(line, '\(\s*\)' . '\([A-Z]\)\zs[a-zA-Z_0-9]*\ze\s\+' . last_char . '$')
        "
        " BUG FOUND:
        " getline(lnum) might contain a ) at the end, which is imapped by ( 
        " let rest = matchstr(line, '\(\s*\|(\)' . '\([A-Z]\)\zs[a-zA-Z_0-9]*\ze\s\+' . last_char . '$')
        " add )\? befor $
        let rest = matchstr(line, '\(\s*\|(\)' . '\([A-Z]\)\zs[a-zA-Z_0-9]*\ze\s\+' . last_char . ')\?$')
        setlocal ic
        return rest
    else
        " return last_char
        echo 'not matched'
        return ''
    endif
endfunction

inoremap <expr> <buffer> ex     Extends()
function! Extends()
    let line = getline('.')
    " if getline('.') =~ 'Thread'
    " bug found:
    " \s+ should be \s\+
    " if line =~ 'Thread\s+'
    if line =~ 'Thread\s\+'
        return 'extends Thread {'
    elseif line =~ 'Runtime'
        return 'extends RuntimeException {'
    elseif line =~ 'Exception\s\+'
        return 'extends Exception {'
    elseif line =~ 'Frame\s\+'
        return 'extends JFrame {'
    else
        return 'ex'
    endif
endfunction

inoremap <expr> <buffer> im     Implements()
function! Implements()
    let line = getline('.')
    if line =~# 'Stack'
        return 'implements Stack'
    elseif line =~# 'Queue'
        return 'implements Queue'
    elseif line =~# 'BlockingQueue'
        return 'implements BlockingQueue'
    elseif line =~# 'Iterator'
        return 'implements Iterator'
    elseif line =~# 'Enumeration'
        return 'implements Enumeration'
    elseif line =~# 'Runnable'
        return 'implements Runnable'
    elseif line =~# 'List'
        return 'implements List'
    elseif line =~# 'Set'
        return 'implements Set'
    elseif line =~# 'Map'
        return 'implements Map'
    elseif line =~# 'Collection'
        return 'implements Collection'
    else
        return 'im'
    endif
endfunction


        

"        \\\///
"       / _  _ \
"     (| (.)(.) |)
" .-.OOOo--()--oOOO.-.
" |                  |
" | " bug found:     |
" |                  |
" '-.oooO------------'
"    (   )   Oooo.
"     \ (    (   )
"      \_)    ) /
"            (_/
" " completefunc=CompleteImport is set in pack/start!

packadd completeimport

packadd completejava

setlocal omnifunc=javacomplete#Complete

setlocal completefunc=javacomplete#CompleteParamsInfo


" inoremap <buffer> try    try<Space>{<CR>
"
" bug found:
" inoremap <buffer> catch  catch(Exception e)<Space>{<Esc>2li
" inoremap <buffer> catch  catch( e)<Space>{<Esc>4hi
"
" inoremap <buffer> catch  catch<Space>(Exception e)<Space>{<CR>
inoremap <expr> <buffer> catch  Catch()
    " catch<Space>(Exception e)<Space>{<CR>
function! Catch()
    let lnum = line('.')
    let line = getline(lnum - 1)
    " refactored
    let other_line = getline(lnum - 2)
    " if line =~# 'wait\|sleep\|join' 
    if line =~# 'wait\|sleep\|join' || other_line =~# 'wait\|sleep\|join'
        return "catch (InterruptedException e) {\n"
    else
        return "catch (Exception e) {\n"
    endif
endfunction

inoremap Strign String

" no need for <CR> in inoremap
" <CR> is needed in nmap

"  __^__                      __^__
" ( ___ )--------------------( ___ )
"  | / | inoremap for android | \ |
"  |___|                      |___|
" (_____)--------------------(_____)

"  ___________________________________________________
" /\                                                  \
" \_| " note autoindent takes effect after every <CR> |
"   |                                                 |
"   |   ______________________________________________|_
"    \_/________________________________________________/
"
"    { takes care of indenting four spaces

inoremap Adapt AdapterView.OnItemClickListener itemClickListener =
            \<CR>        new AdapterView.OnItemClickListener() {
            \<CR>@Override
            \<CR>public void onItemClick(AdapterView<?> adapterView,
            \<CR>                View itemView,
            \<CR>int position,
            \<CR>long id) {
            \<CR>}
            \<CR>};

" inoremap Thread.cu  Thread.currentThread().getName()
" inoremap Thread.sl  Thread.sleep(

"       ,
"   /\^/`\   ftplugin commands:
"  | \/   |
"  | |    |                               jgs
"  \ \    /                             _ _
"   '\\//'                            _{ ' }_
"     ||                             { `.!.` }
"     ||                             ',_/Y\_,'
"     ||  ,                            {_,_}
" |\  ||  |\                             |
" | | ||  | |                          (\|  /)
" | | || / /                            \| //
"  \ \||/ /                              |//
"   `\\//`   \   \./    \\   \./    \ \\ |/ /
"  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"
"  define following commands in ftplugin to speed up startup

command! PackaddJava    :packadd completejava

command! PackaddImport  :packadd completeimport

command! PackaddAll     :packadd completeall

command! PackaddJUnit   :packadd completejunit

command! PackaddSpring  :packadd completespring

command! PackaddSpringXML   :packadd completespringxml

command! PackaddPomXML  :packadd completepomxml

command! PackaddJavaxImport :packadd completejavaximport


" :PackaddAll
:PackaddJava

" setlocal include=\s*import\s.*
" setlocal includeexpr=substitue(v:fname, '\.', '/', 'g')

function! ReadJavadoc()
    :0read ~/java/javadocheader.java
endfunction "autoindented 


"set tags+=~/Documents/javasrc/tags
setlocal tags+=~/Documents/javasrc/tags

"setlocal dict+=~/mydict/javadoc
setlocal dict=~/mydict/javadoc
" setlocal dict+=~/mydict/java
setlocal dict+=~/mydict/junit
setlocal dict+=~/mydict/jar
setlocal dict+=~/mydict/javax
setlocal dict+=~/mydict/java-variables
setlocal dict+=~/mydict/android
setlocal dict+=~/mydict/mybatis

" using set complete+=k{filename}, you can specify any file
" to be used with  and  for completion
setlocal complete+=k~/mydict/spring,k~/mydict/springxml
setlocal complete+=k~/mydict/java
setlocal complete+=k~/mydict/javax

"use setlocal complete+=k{dictfile} to add a customized file for completion
"with ,  and 
" setlocal complete+=k~/mydict/java-import-lines

" note that smartcase is set in .vimrc
" hence whenever there is a capitalized letter in a word
" ic is temporarily reset to noignorecase 
setlocal ignorecase

"noremap <buffer> <LocalLeader>c o/**<CR>*<CR>*/<Esc>k

"define a function that handles a range
"use the range keyword and 
"a:firstline, a:lastline in function body
function! Boxes(design) range
    "shell command boxes doesn't recognize a:design
    ":!boxes -f $BOXES_SYS_CONF -d a:design
    ":execute "!boxes -f $BOXES_SYS_CONF -d " . a:design . " " . expand("%")
    :execute a:firstline . "," . a:lastline . "!boxes -f $BOXES_SYS_CONF -d " . a:design . " "
endfunction
