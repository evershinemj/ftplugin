function! Boxes() 
    ":.!boxes -f $BOXES_SYS_CONF -d 'html-cmt'
    :.!boxes -f $BOXES_SYS_CONF -d 'html-cmt'
endfunction

inoremap </ht </html>
" inoremap <ht <html></html><Esc>F>a
" inoremap <he <head></head><Esc>F>a
inoremap </he </head>
" noremap itself defines a mapping
" noremap <F9> Gonoremap!<Esc>
" inoremap <ti <title></title><Esc>F>a
inoremap </ti </title>
" inoremap <bo <body></body><Esc>F>a
inoremap </bo </body>

inoremap <ht <html><CR></html><Esc>O
inoremap <he <head><CR></head><Esc>O
inoremap <ti <title><CR></title><Esc>O
inoremap <bo <body><CR></body><Esc>O

inoremap <sc <script><CR></script><Esc>O
inoremap <p <p><CR></p><Esc>O
inoremap <di <div><CR></div><Esc>O
inoremap <sp <span><CR></span><Esc>O
inoremap <em <em><CR></em><Esc>O
inoremap <str <strong><CR></strong><Esc>O
inoremap <pre <pre><CR></pre><Esc>O     " preformatted
inoremap <co <code><CR></code>
inoremap <ol <ol><CR></ol><Esc>O
inoremap <ul <ul><CR></ul><Esc>O
inoremap <h1 <h1></h1><Esc>F>a
inoremap <h2 <h2></h2><Esc>F>a
inoremap <h3 <h3></h3><Esc>F>a
inoremap <h4 <h4></h4><Esc>F>a
inoremap <h5 <h5></h5><Esc>F>a
inoremap <h6 <h6></h6><Esc>F>a
inoremap <ta <table><CR></table><Esc>O
inoremap <tr <tr><CR></tr><Esc>O
inoremap <th <th><CR></th><Esc>O
inoremap <td <td><CR></td><Esc>O
inoremap <fo <form><CR></form><Esc>O
inoremap <in <input type="" name=""><CR></input><Esc>O
inoremap <sty <style><CR></style><CR>O
inoremap <me <meta charset="UTF-8">
inoremap <vi <video width="" height="" controls><CR></video><Esc>O
inoremap <so <source src="" type=""><CR></source><Esc>O
inoremap <au <audio controls><CR></audio><Esc>O
