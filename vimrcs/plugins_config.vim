

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim插件管理及配置
"
" vim须安装一款插件管理器，我采用vim-plug
"
" 配置列表:
"    -> vim-plug安装
"    -> vim-plug管理插件
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug安装
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mkdir ~/.vim/autoload
" curl -fLo https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug管理插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')               " Specify a directory for plugins

Plug 'altercation/vim-colors-solarized'         " vim solarized配色方案


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim文件浏览器插件及配置
Plug 'scrooloose/nerdtree'

autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle <CR>                  " Ctrl + n 开启和关闭树
" let NERDTreeShowHidden=1
" let g:NERDTreeShowIgnoredStatus = 1
" let g:nerdtree_tabs_open_on_console_startup=1
" let NERDTreeChDirMode=1
" let NERDTreeShowBookmarks=1                     " 显示书签
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']  " 设置忽略文件类型
" let NERDTreeWinSize=25                          " 窗口大小
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


Plug 'tpope/vim-fugitive'                       " git插件


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => markdown插件及配置
Plug 'suan/vim-instant-markdown'

let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


Plug 'vim-airline/vim-airline'                   " vim状态栏显示

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 缩进标线插件及配置
Plug 'Yggdroot/indentLine'

let g:indentLine_char = '┆'
let g:indentLine_enabled = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()                                 "Initialize plugin system
