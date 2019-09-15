if exists('b:did_my_ftplugin')
    finish "finish sourcing the script
endif
let b:did_my_ftplugin = 1

let b:REGEX_REFERENCE_TYPE = '\([A-Z][a-zA-Z_0-9]\)'
let b:REGEX_PRIMITIVE_TYPE = '\(byte\|char\|short\|int\|float\|long\|double\)\s\+'
let b:REGEX_MODIFIER = '\(public\|private\|protected\|static\|final\|abstract\|\)\s\+'
let b:IDENTIFIER = '\([a-z][a-zA-Z_0-9]*\)'

let maplocalleader = ','

inoreabbrev pu          public
inoreabbrev pr          private
inoreabbrev st          static
inoreabbrev cl          class
inoreabbrev ab          abstract
inoreabbrev re          return
inoreabbrev wh          while
inoreabbrev vo          void
inoreabbrev im          implements
inoreabbrev su          super
inoreabbrev th          this
inoreabbrev pa          package
inoreabbrev ext         extends
inoreabbrev flo         float
inoreabbrev dou         double

inoreabbrev ob          Object
inoreabbrev ch          Character
inoreabbrev do          Double
inoreabbrev in          Integer
inoreabbrev lo          Long
inoreabbrev str         String
inoreabbrev strb        StringBuilder
inoreabbrev strf        StringBuffer
inoreabbrev com         Comparator
inoreabbrev comi        Comparator<Integer>
inoreabbrev coms        Comparator<String>
inoreabbrev al          ArrayList
inoreabbrev ll          LinkedList
inoreabbrev ve          Vector
inoreabbrev ali         ArrayList<Integer>
inoreabbrev als         ArrayList<String>
inoreabbrev lli         LinkedList<Integer>
inoreabbrev lls         LinkedList<String>
inoreabbrev hs          HashSet
inoreabbrev hsi         HashSet<Integer>
inoreabbrev hss         HashSet<String>
inoreabbrev si          Set<Integer>
inoreabbrev ss          Set<String>
inoreabbrev hm          HashMap
inoreabbrev hmii        HashMap<Integer, Integer>
inoreabbrev hmsi        HashMap<String, Integer>
inoreabbrev hmss        HashMap<String, String>
inoreabbrev mii         Map<Integer, Integer>
inoreabbrev msi         Map<String, Integer>
inoreabbrev mss         Map<String, String>
inoreabbrev ex          Exception
inoreabbrev ioex        IOException
inoreabbrev npex        NullPointerException
inoreabbrev iobex       IndexOutOfBoundsException
inoreabbrev aiobex      ArrayIndexOutOfBoundsException
inoreabbrev siobex      StringIndexOutOfBoundsException
inoreabbrev is          InputStream
inoreabbrev os          OutputStream
inoreabbrev fis         FileInputStream
inoreabbrev fos         FileOutputStream
inoreabbrev fr          FileReader
inoreabbrev fw          FileWriter
inoreabbrev sc          Scanner
inoreabbrev stm         Statement
inoreabbrev pst         PreparedStatement
inoreabbrev con         Connection
inoreabbrev drm         DriverManager

inoreabbrev ts          toString
inoreabbrev eq          equals
inoreabbrev eqi         equalsIgnoreCase
inoreabbrev io          indexOf
inoreabbrev lio         lastIndexOf
inoreabbrev sub         substring
inoreabbrev stw         startsWith
inoreabbrev ew          endsWith
inoreabbrev ca          charAt
inoreabbrev ct          contains
inoreabbrev ctk         containsKey
inoreabbrev ctv         containsValue
inoreabbrev ap          append
inoreabbrev rep         replace
inoreabbrev del         delete
inoreabbrev dca         deleteCharAt
inoreabbrev hc          hashCode

inoreabbrev @a          @author
inoreabbrev @p          @param
inoreabbrev @r          @return
inoreabbrev @e          @exception
inoreabbrev @v          @version
inoreabbrev @c          {@code }
inoreabbrev @l          {@link }

inoreabbrev @t          @Test
inoreabbrev @o          @Override

inoreabbrev cs          Collections.sort
inoreabbrev cw          Collections.swap
inoreabbrev cr          Collections.reverse
inoreabbrev cro         Collections.reverseOrder
inoreabbrev as          Arrays.sort
inoreabbrev ats         Arrays.toString
inoreabbrev sv          String.valueOf
inoreabbrev ip          Integer.parseInt
inoreabbrev lp          Long.parseLong

inoreabbrev jua         java.util.Arrays
inoreabbrev juc         java.util.Collections
inoreabbrev jul         java.util.List
inoreabbrev jual        java.util.ArrayList
inoreabbrev jull        java.util.LinkedList
inoreabbrev jum         java.util.Map
inoreabbrev jus         java.util.Set
inoreabbrev juhm        java.util.HashMap
inoreabbrev juhs        java.util.HashSet
inoreabbrev just        java.util.Stack
inoreabbrev juq         java.util.Queue
inoreabbrev jupq        java.util.PriorityQueue
inoreabbrev jud         java.util.Deque
inoreabbrev juad        java.util.ArrayDeque
inoreabbrev jioi        java.io.InputStream
inoreabbrev jioo        java.io.OutputStream
inoreabbrev jiofi       java.io.FileInputStream
inoreabbrev jiofo       java.io.FileOutputStream
inoreabbrev jior        java.io.Reader
inoreabbrev jiow        java.io.Writer
inoreabbrev jiofr       java.io.FileReader
inoreabbrev jiofw       java.io.FileWriter
inoreabbrev jioex       java.io.IOException

inoreabbrev ijua        import java.util.Arrays;
inoreabbrev ijuc        import java.util.Collections;
inoreabbrev ijul        import java.util.List;
inoreabbrev ijual       import java.util.ArrayList;
inoreabbrev ijull       import java.util.LinkedList;
inoreabbrev ijum        import java.util.Map;
inoreabbrev ijus        import java.util.Set;
inoreabbrev ijuhm       import java.util.HashMap;
inoreabbrev ijuhs       import java.util.HashSet;
inoreabbrev ijust       import java.util.Stack;
inoreabbrev ijuq        import java.util.Queue;
inoreabbrev ijupq       import java.util.PriorityQueue;
inoreabbrev ijud        import java.util.Deque;
inoreabbrev ijuad       import java.util.ArrayDeque;
inoreabbrev ijioi       import java.io.InputStream;
inoreabbrev ijioo       import java.io.OutputStream;
inoreabbrev ijiofi      import java.io.FileInputStream;
inoreabbrev ijiofo      import java.io.FileOutputStream;
inoreabbrev ijior       import java.io.Reader;
inoreabbrev ijiow       import java.io.Writer;
inoreabbrev ijiofr      import java.io.FileReader;
inoreabbrev ijiofw      import java.io.FileWriter;
inoreabbrev ijioex      import java.io.IOException;

inoreabbrev psvm        public static void main(String[] args)
inoreabbrev sop         System.out.println
inoreabbrev pc          public class
inoreabbrev pi          public interface
inoreabbrev pe          public enum
inoreabbrev pac         public abstract class
inoreabbrev pv          public void
inoreabbrev pvs         public void swap(int[] arr, int index1, int index2)
inoreabbrev trycatch    try {<Enter><Enter>} catch (Exception e) {<Enter>e.printStackTrace();<Enter>}<Up><Up><Up><Tab>
inoreabbrev forchar     for (char c : s.toCharArray())
inoreabbrev newrandom   Random random = new Random();
inoreabbrev newsb       StringBuilder sb = new StringBuilder();
inoreabbrev newilist    List<Integer> list = new ArrayList<>();
inoreabbrev newslist    List<String> list = new ArrayList<>();
inoreabbrev newclist    List<Character> list = new ArrayList<>();
inoreabbrev newiset     Set<Integer> set = new HashSet<>();
inoreabbrev newsset     Set<String> set = new HashSet<>();
inoreabbrev newcset     Set<Character> set = new HashSet<>();
inoreabbrev newiimap    Map<Integer, Integer> map = new HashMap<>();
inoreabbrev newsimap    Map<String, Integer> map = new HashMap<>();
inoreabbrev newssmap    Map<String, String> map = new HashMap<>();
inoreabbrev newcimap    Map<Character, Integer> map = new HashMap<>();
inoreabbrev newcstack   Stack<Character> stack = new Stack<>();
inoreabbrev newistack   Stack<Integer> stack = new Stack<>();
inoreabbrev newsstack   Stack<String> stack = new Stack<>();
inoreabbrev newtqueue   Queue<TreeNode> queue = new LinkedList<>();
inoreabbrev newiqueue   Queue<Integer> queue = new LinkedList<>();
inoreabbrev newsqueue   Queue<String> queue = new LinkedList<>();
inoreabbrev newcqueue   Queue<Character> queue = new LinkedList<>();
inoreabbrev newtdeque   Queue<TreeNode> deque = new ArrayDeque<>();
inoreabbrev newideque   Queue<Integer> deque = new ArrayDeque<>();
inoreabbrev newsdeque   Queue<String> deque = new ArrayDeque<>();
inoreabbrev newcdeque   Queue<Character> deque = new ArrayDeque<>();
inoreabbrev newipq      PriorityQueue<Integer> pq = new PriorityQueue<>();
inoreabbrev newspq      PriorityQueue<String> pq = new PriorityQueue<>();
inoreabbrev newcpq      PriorityQueue<Character> pq = new PriorityQueue<>();
inoreabbrev newst       StringTokenizer st = new StringTokenizer(s);
inoreabbrev newiarrdp   int[] dp = new int[len];
inoreabbrev newimndp    int[][] dp = new int[m][n];
inoreabbrev newsc       Scanner scanner = new Scanner(System.in);
" inoreabbrev sop     System.out.println(
" inoreabbrev sop     System.out.println();<Left><Left>
" inoreabbrev sop     System.out.println<Backspace>

" inoreabbrev <dl>        <DL><DT><DD></DD></DT></DL>
" inoremap <maplocalleader>dl     <DL><CR><DT><CR></DT><CR><DD><CR></DD><CR></DL><Esc>3kO
inoremap <LocalLeader>dl     <DL><CR><DT><CR></DT><CR><DD><CR></DD><CR></DL><Esc>3kO

setlocal iskeyword+=@

setlocal makeprg=javac

setlocal formatprg=fmt

setlocal foldmethod=marker

setlocal foldlevel=0

" setlocal fileencoding=utf-8
" setlocal fileencoding=gbk

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

inoremap <LocalLeader>t     @Test<CR>

inoremap <expr> [   StringArray()
function! StringArray()
    let line = getline('.')
    if line =~# '.*new String$'
        return '[] {""}'
    else
        return '['
    endif
endfunction

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

"  __^__                                                       __^__
" ( ___ )-----------------------------------------------------( ___ )
"  | / | inoremap <expr> <buffer> <LocalLeader>t   NewThread() | \ |
"  | / | function! NewThread()                                 | \ |
"  | / |     let line = getline('.')                           | \ |
"  | / |     if line =~# '\s*new Thread'                       | \ |
"  | / |         return                                        | \ |
"  | / |                     \ "() {\npublic void run() {" .   | \ |
"  | / |                     \ "\n}\n}.start();"               | \ |
"  | / |     else                                              | \ |
"  | / |         return ''                                     | \ |
"  | / |     endif                                             | \ |
"  | / | endfunction                                           | \ |
"  |___|                                                       |___|
" (_____)-----------------------------------------------------(_____)
"
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
    " BUG FOUND:
    " doesn't work when there are chars after the cursor
    " if getline('.') =~ '\(\s*\|(\)' . '\([A-Z]\)[a-zA-Z_0-9]' . '\s\+' . last_char
    if getline('.') =~ '\(\s*\|(\)' . '\([A-Z]\)[a-zA-Z_0-9]' . '\s\+' . last_char . '.*'
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
        "
        " let rest = matchstr(line, '\(\s*\|(\)' . '\([A-Z]\)\zs[a-zA-Z_0-9]*\ze\s\+' . last_char . ')\?$')
        let rest = matchstr(line, '\(\s*\|(\)' . '\([A-Z]\)\zs[a-zA-Z_0-9]*\ze\s\+' . last_char . '.*')
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
    elseif line =~? 'reader\|writer\|close' || other_line =~? 'reader\|writer\|close'
        return "catch (IOException e) {\n"
    else
        return "catch (Exception e) {\n"
    endif
endfunction


" inoremap Strign String

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
setlocal complete+=k~/mydict/myjava

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
