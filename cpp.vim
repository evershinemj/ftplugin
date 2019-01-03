if exists('b:did_my_ftplugin')
    finish
endif
let b:did_my_ftplugin = 1

function! Boxes(design)
    execute ".!boxes -f $BOXES_SYS_CONF -d " . a:design
endfunction

noremap <buffer> <LocalLeader>i	i#include<iostream><Esc>
noremap <buffer> <LocalLeader>n	ousing namespace std;<Esc>
