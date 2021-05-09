
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim基础配置
"
" 配置列表:
"    -> 通用设置
"    -> 显示设置
"    -> 编码设置
"    -> 编辑设置
"    -> 搜索设置
"    -> 快捷键设置
"    -> 帮助函数
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent on                  " 设置开启文件类型侦测
filetype plugin on                  " 设置加载相应文件类型的插件

set history=1000                    " 设置history文件记录行数
set autoread                        " 设置自动读取文件更改状态

let mapleader = ","                 " 定义<leader>键
set nocompatible                    " 设置不兼容原始vi模式

set backspace=eol,start,indent      " 设置backspace正常处理eol,start,indent
set whichwrap+=<,>,h,l              " 设置backspace和光标跨越行边界


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 显示设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256                        " 开启256色支持

set background=dark                 " 设置背景
" let g:onedark_termcolors=256
" colorscheme onedark                 " 设置主题

syntax enable                       " 开启语法高亮
set number                          " 开启行号显示
set ruler                           " 显示光标位置

set showmatch                       " 高亮显示匹配的括号

set cmdheight=2                     " 设置命令行高度

set laststatus=2                    " 显示状态栏
                                    " 格式化状态栏
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $LANG='en'                      " 设置语言
set langmenu=en

set encoding=utf8                   " 设置编码格式

set ffs=unix,dos,mac                " 设置Unix为标准文件类型


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 编辑设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set confirm                         " 处理未保存或只读文件时弹出确认

set expandtab                       " 设置制表符扩展为空格
set smarttab                        " 行、段开始处使用制表符
set shiftwidth=4                    " 格式化时制表符占用空格数
set tabstop=4                       " 设置4个空格为制表符

set lbr                             " 设置断行
set tw=500                          " 设置断行字符个数
set wrap                            " 设置折行
set iskeyword+=_,$,@,%,#,-          " 带有特殊符号的单词不被换行分割

set foldcolumn                      " 设置可以折叠
set foldmethod=manual

set autoindent                      " 设置自动缩进
set cindent                         " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0         " 设置C/C++语言的具体缩进方式
set smartindent                     " 智能的选择对其方式
filetype indent on                  " 自适应不同语言的智能缩进


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                        " 高亮显示搜索结果
set incsearch                       " 开启实时搜索功能
set ignorecase                      " 搜索时大小写不敏感
set smartcase                       "


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 快捷键设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap ( ()<Esc>i                 " 设置自动匹配
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 帮助函数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
