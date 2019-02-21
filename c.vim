"NOTE that b:did_ftplugin is defined in ftplugin/c.vim too
"this script is sourced before ftplugin/c.vim
"
"THIS IS Why 'set omnifunc?' results in omnifunc=
"ftplugin/c.vim stops sourcing once it finds b:did_ftplugin
"already defined!
"
"It's possible to source this script AFTER ftplugin/c.vim,
"if it's put into ~/.vim/after/ftplugin
"but then this script would not be sourced since it finds
"did_ftplugin defined
"
"hence it's better to use another variable, like 
"b:did_my_ftplugin
"
":argdo %s/did_ftplugin/did_my_ftplugin/gc | write
"
if exists('b:did_my_ftplugin')
    finish "stop sourcing the script
endif
let b:did_my_ftplugin = 1

setlocal path=~/c

inoremap  #in #include<stdio.h><CR>int main(){<CR><CR>}<Esc>ki<Tab>

function! Boxes()
    :.!boxes -f $BOXES_SYS_CONF -d c
endfunction

setlocal dict=~/mydict/c
setlocal complete+=k~/mydict/c
setlocal softtabstop=4
let maplocalleader = ','
noremap <buffer> <LocalLeader>c o/******************<CR><CR>******************/<Esc>k

" important imappings
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
