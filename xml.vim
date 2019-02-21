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

set complete+=k~/mydict/maven
set complete+=k~/mydict/mybatisxml

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
inoremap <man <manifest xmlns:android="http://schemas.android.com/apk/res/android"<CR>package=""><CR></manifest><Esc>O
inoremap <in <intent-filter><CR><action android:name="android.intent.action.SEND"/><CR><category android:name="android.intent.category.DEFAULT"/><CR></intent-filter>
inoremap <di <dimen name="activity_">16dp</dimen><Esc>F"i

"  / ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \
" |  /~~\                         /~~\  |
" |\ \   |  " spring completion  |   / /|
" | \   /|                       |\   / |
" |  ~~  |                       |  ~~  |
" |      |                       |      |
"  \     |~~~~~~~~~~~~~~~~~~~~~~~|     /
"   \   /                         \   /
"    ~~~                           ~~~
"
inoremap <beans 
            \ <beans xmlns="http://www.springframework.org/schema/beans"
            \ <CR>xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            \ <CR>xsi:schemaLocation="http://www.springframework.org/schema/beans
            \ <CR>http://www.springframework.org/schema/beans/spring-beans.xsd">
            \ <CR></beans><Esc>O
inoremap <bean 
            \ <bean name="" class="">
            \ <CR></bean><Esc>O
inoremap <cons
            \ <constructor-arg name="" value=""/>
" inoremap <prop
"             \ <property name="" name=""/>
inoreabbrev  <p
            \ <property name="" value=""/>


"  / ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \
" |  /~~\                        /~~\  |
" |\ \   |  " maven completion  |   / /|
" | \   /|                      |\   / |
" |  ~~  |                      |  ~~  |
" |      |                      |      |
"  \     |~~~~~~~~~~~~~~~~~~~~~~|     /
"   \   /                        \   /
"    ~~~                          ~~~
"

inoremap <proj 
            \ <project xmlns="http://maven.apache.org/POM/4.0.0"
            \ <CR>xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            \ <CR>xmlns:schemaLocation="http://maven.apache.org/POM/4.0.0
            \ <CR>http://maven.apache.org/xsd/maven-4.0.0.xsd">
            \ <CR><modelVersion>4.0.0</modelVersion>
            \ <CR><groupId>foo</groupId>
            \ <CR><artifactId>bar</artifactId>
            \ <CR><version>baz</version>
            \ <CR><CR></project><Esc>O

inoremap <mo <modelVersion>4.0.0</modelVersion>

inoremap <dep <dependenc
inoremap <expr> y Dependency()
function! Dependency()
    let line = getline('.')
    if line =~ '^\s*<dependenc'
        return "y>\n" .
                    \ "<groupId>org.foo</groupId>\n" .
                    \ "<artifactId>bar</artifactId>\n" .
                    \ "<version>baz</version>\n" .
                    \ "</dependency>"
    else
        return 'y'
    endif
endfunction

inoremap <expr> ies Dependencies()
function! Dependencies()
    let line = getline('.')
    if line =~ '^\s*<dependenc'
        return "ies>\n" .
                    \ "<dependency>\n" .
                    \ "<groupId>org.foo</groupId>\n" .
                    \ "<artifactId>bar</artifactId>\n" .
                    \ "<version>baz</version>\n" .
                    \ "</dependency>\n" .
                    \ "</dependencies>"
    else
        return 'ies'
    endif
endfunction

inoremap <bu 
            \ <build>
            \ <CR><plugins>
            \ <CR><plugin>
            \ <CR><artifactId>maven-compiler-plugin</artifactId>
            \ <CR><configuration>
            \ <CR><source>1.6</source>
            \ <CR><target>1.6</target>
            \ <CR></configuration>
            \ <CR></plugin>
            \ <CR></plugins>
            \ <CR></build>

inoremap <expr> > Properties()
function! Properties()
    let line = getline('.')
    if line =~ '<properties'
        echo 'matched'
        " refactored
        " added two newlines for better completion
        return ">\n" .
                    \ "<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>\n" .
                    \ "</properties>\n\n"
    else
        return ">"
    endif
endfunction

"  / ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \
" |  /~~\                          /~~\  |
" |\ \   |  " mybatis completion  |   / /|
" | \   /|                        |\   / |
" |  ~~  |                        |  ~~  |
" |      |                        |      |
"  \     |~~~~~~~~~~~~~~~~~~~~~~~~|     /
"   \   /                          \   /
"    ~~~                            ~~~

inoremap <LocalLeader>#     #{}<Left>

inoremap <sel <settings><CR><setting name="logImpl" value="LOG4J"/><CR></settings><CR><CR>
inoremap <ty <typeAliases><CR><package name=""/><CR></typeAliases>
inoremap <en 
            \ <environments default="development">
            \ <CR><environment id="development">
            \ <CR><transactionManager type="JDBC">
            \ <CR><property name="" value=""/>
            \ <CR></transactionManager>
            \ <CR><dataSource type="UNPOOLED">
            \ <CR><property name="driver" value="com.mysql.jdbc.Driver"/>
            \ <CR><property name="url" value="jdbc:mysql://localhost:3306/mybatis"/>
            \ <CR><property name="username" value="root"/>
            \ <CR><property name="password" value=""/>
            \ <CR></dataSource>
            \ <CR></environment>
            \ <CR></environments>
            \ <CR>
inoreabbrev <m  
            \ <mappers>
            \ <CR><mapper resource="foo.xml"/>
            \ <CR></mappers>
inoremap <expr> co Configuration()
function! Configuration()
    let line = getline('.')
    if line =~ 'DOCTYPE'
        return "configuration\n" .
                    \ "\tPUBLIC \"-//mybatis.org//DTD Config 3.0//EN\"\n" .
                    \ "\"http://mybatis.org/dtd/mybatis-3-config.dtd\">\n" .
                    \ "\b<configuration>\n</configuration>"
    else
        return 'co'
    endif
endfunction

inoremap <expr> map Mapper()
function! Mapper()
    let line = getline('.')
    if line =~ 'DOCTYPE'
        return 'mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"' . "\n" .
                    \ "\t" . '"http://mybatis.org/dtd/mybatis-3-mapper.dtd">' . "\n" .
                    \ "\b" . '<mapper namespace="somepackage.mapper.FooMapper">' . "\n" .
                    \ '</mapper>'
    else
        return 'map'
    endif
endfunction

inoremap <sel  
            \ <select id="foo" resultType="tk.mybatis.simple.model.SysUser">
            \ <CR>select somecolumns from sometable
            \ <CR></select>


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
