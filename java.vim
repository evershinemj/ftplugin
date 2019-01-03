if exists('b:did_my_ftplugin')
    finish "finish sourcing the script
endif
let b:did_my_ftplugin = 1

setlocal iskeyword+=@

setlocal path=~/java

function! ReadJavadoc()
    :0read ~/java/javadocheader.java
endfunction "autoindented 

let maplocalleader = ','

"set tags+=~/Documents/javasrc/tags
setlocal tags+=~/Documents/javasrc/tags

"setlocal dict+=~/mydict/javadoc
setlocal dict=~/mydict/javadoc
setlocal dict+=~/mydict/java
setlocal dict+=~/mydict/junit
setlocal dict+=~/mydict/jar

"use setlocal complete+=k{dictfile} to add a customized file for completion
"with ,  and 
" setlocal complete+=k~/mydict/java-import-lines

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
