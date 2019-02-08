" au BufRead,BufNewFile pom.xml function! ReadDependency() | read ~/mavenprojects/dependencyblock.txt | 0delete | endfunction
" function! ReadDependency()|read ~/mavenprojects/dependencyblock.txt|0delete|endfunction

let maplocalleader = ','
function! ReadDependency()
    read ~/mavenprojects/dependencyblock.txt
    " 0delete
    .delete
endfunction

command! ReadDependency call ReadDependency()

set dict=~/mydict/maven

packadd completepomxml

inoremap <expr> xml AutoCompleteXmlTag()

"  / ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \
" |  /~~\                          /~~\  |
" |\ \   |  " android completion  |   / /|
" | \   /|                        |\   / |
" |  ~~  |                        |  ~~  |
" |      |                        |      |
"  \     |~~~~~~~~~~~~~~~~~~~~~~~~|     /
"   \   /                          \   /
"    ~~~                            ~~~

inoremap <re <resources><CR></resources><Esc>O
inoremap <st <string name=""></string><Esc>F>a
inoremap <it <item></item><Esc>F>a
inoremap <ap <application<CR>android:allowBackup="true"<CR>android:icon="@mipmap/ic_launcher"<CR>android:label="@string/app_name"<CR>android:theme="@style/AppTheme"><CR></application><Esc>O
inoremap <ac <activity><CR>android:name=".SomeActivity"<CR>android:label="@string/"<CR></activity><Esc>
inoremap <ma <manifest xmlns:android="http://schemas.android.com/apk/res/android"<CR>package=""><CR></manifest><Esc>O
inoremap <in <intent-filter><CR><action android:name="android.intent.action.SEND"/><CR><category android:name="android.intent.category.DEFAULT"/><CR></intent-filter>
inoremap <di <dimen name="activity_">16dp</dimen><Esc>F"i


func! AutoCompleteXmlTag()
    let l:curr_line = getline('.')
    try
        " if l:curr_line =~ '.*<?xml.*'
        " bug found:
        " the mapping char is not in getline('.') yet!
        if l:curr_line =~ '.*<?.*'
            return 'xml version="1.0" encoding="utf-8"?>'
        else
            " if return were here, throw statement 
            " would never be executed
            " endif
            " return 'x'
            " return 'something went wrong'
            throw 'something went wrong during mapping'
            " need to return something to avoid 
            " automatic returning 0
            " bug found:
            " return after throw never executed!
            " return 'x'
        endif
    catch /.*mapping$/
        echo v:exception
    finally
        if l:curr_line !~ '.*<?.*' | return 'xml' | endif
    endtry
endfunc

inoremap <expr> <Rela AutoCompleteRelativeLayout()

" function AutoCompleteRelativeLayout()
" prevents error of redefining function when another xml
" file is loaded
" endfunction
function! AutoCompleteRelativeLayout()
    " set nosmartindent
    return "<RelativeLayout xmlns:android=\"http://schemas.android.com/apk/res/android\"\n    xmlns:app=\"http://schemas.android.com/apk/res-auto\"\n    xmlns:tools=\"http://schemas.android.com/tools\"\n    android:layout_width=\"match_parent\"\n    android:layout_height=\"match_parent\"\n    android:paddingBottom=\"16dp\"\n    android:paddingTop=\"16dp\"\n    android:paddingRight=\"16dp\"\n    android:paddingLeft=\"16dp\"\n    tools:context=\".MainActivity\">\n</RelativeLayout>\n"
    " set smartindent
endfunction
