" au BufRead,BufNewFile pom.xml function! ReadDependency() | read ~/mavenprojects/dependencyblock.txt | 0delete | endfunction
" function! ReadDependency()|read ~/mavenprojects/dependencyblock.txt|0delete|endfunction

function! ReadDependency()
    read ~/mavenprojects/dependencyblock.txt
    " 0delete
    .delete
endfunction

command! ReadDependency call ReadDependency()
