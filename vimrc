""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line Numbering
set nu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

imap jk <Esc>
" These redifine existing commands, careful.
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Formatting Options

set shiftwidth=4 "set default  
set softtabstop=4
set autoindent
set smartindent
set smarttab
set expandtab
set ruler " iTerm needed for showing column,line number
set backspace=2 " Needed for backspace to work properly on OSX/iTerm2
syntax on
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom formatting
" Bash/SH
autocmd FileType sh set softtabstop=2 | set shiftwidth=2 | set expandtab
autocmd FileType yaml set softtabstop=2 | set shiftwidth=2 | set expandtab
autocmd FileType pug set softtabstop=2 | set shiftwidth=2 | set expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Options
"
set magic " search using extended regex
" set incsearch " instant search
set ignorecase " Make search case insensitive
set smartcase " if the search pattern contains upper case letters, then make the search
set hlsearch " Highlight search matches
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Restore cursor to last postion in file """""""""""""""""""""""""""""""""""""""
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tell vim to remember certain things when we exit
"
" "  '10  :  marks will be remembered for up to 10 previously edited files
" "  "100 :  will save up to 100 lines for each register
" "  :20  :  up to 20 lines of command-line history will be remembered
" "  %    :  saves and restores the buffer list
" "  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.vim/viminfo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse Options
" set mouse=a "Enable mouse use in term

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Auto completion
"
"
" Omni Completion
set omnifunc=syntaxcomplete#Complete
" Close doc string buffer after selection, vim 7.4+ only
autocmd CompleteDone * pclose
" Autocomplete with wildchar in command mode
set wildmenu
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Filetypes
" MarkDown
au BufRead,BufNewFile *.mkdhtml set filetype=markdown
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Filetype based settings """""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" XML
function Custom_xml()
    let g:xml_syntax_folding = 1
    set foldmethod=syntax
endfunction
au BufRead,BufNewFile *.xml :call Custom_xml()
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable inbuilt plugins

runtime macros/matchit.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PATHOGEN AND RELATED PLUGIN SETTINGS
"
" Adding Plugin Pathogen
execute pathogen#infect()
execute pathogen#helptags()



""" Powerline settings

""" Unicode glyphs
set encoding=utf-8 " Necessary to show Unicode glyphs

""" Disable vi-compatibilty
set nocompatible

"" Steps stolen from
"" http://blog.codefront.net/2013/10/27/installing-powerline-on-os-x-homebrew/
"" for OSX
"source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim

set laststatus=2   " Always show the statusline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORSCHEME SETTINGS
"
" Set ColorSchemes
" NOTE: Setting this after all the plugins and shii have loaded, because Monokai
" exists in one of added colorscheme plugins

" Disabling colorschemes temporarily because they're annoying me.
" Switching to Solarized for a bit
" Default
" set background=dark
" colorscheme default
colorscheme gotham256

" Disable background highlighting by colorschemes in transparent/custom
" background term-emulator
highlight Normal ctermbg=NONE

" This is a lot faster than checking filetype for some reason
"" autocmd BufNewFile,BufRead *.py colorscheme Monokai

"" " Python
"" " See -- http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"" autocmd FileType python colorscheme default

"" " Markdown
"" autocmd BufNewFile,BufRead *.mkd colorscheme 256-jungle
"" " Plain Text
"" autocmd BufNewFile,BufRead *.txt colorscheme  256-jungle
"" " LaTeX
"" autocmd BufNewFile,BufRead *.tex colorscheme blacklight
"" " C++
"" autocmd BufNewFile,BufRead *.cpp colorscheme zephyr
"" " C
"" autocmd BufNewFile,BufRead *.c colorscheme zephyr
"" " Headers
"" autocmd BufNewFile,BufRead *.h colorscheme zephyr
""
"" autocmd BufNewFile,BufRead * highlight WS ctermbg=yellow guibg=yellow | match WS /\s\+$/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" CUSTOM HIGHLIGHT RULES """""""""""""""""""""""""""""""""""""""""""""""""""""
" We use matchadd instead of using match, because match is only matches onej
" group at a time.

" Highlight trailing whitespaces
highlight whitespace ctermbg=red guibg=red
call matchadd('whitespace','\s\+$')

" Highlight log messages
highlight log ctermfg=215 guifg=SandyBrown
call matchadd('log','logg\(er\|ing\)\.\(debug\|info\|warning\|error\)')

" Highlight Python Error messages
highlight pyerr ctermfg=205 guifg=HotPink
call matchadd('pyerr','\w\+Error')


" CUSTOM FUNCTIONS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Add better word processing
function WordProcessing()
    " Turn on UK English spell checker
    set spell spelllang=en_gb
    " Do not exceed 100 chars in a line
    set textwidth=100
endfunction
"
" ack
function CodeProcessing()
    set spell spelllang=en_us
    set textwidth=80
endfunction

function FlipColors()
    set background=light
    colorscheme solarized
endfunction

function FixBG()
    highlight Normal ctermbg=NONE 
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Custom Mappings """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Toggle pastemode
nnoremap <F3> :set paste!<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" airline configuration """"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" syntastic configuration """"""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_py_checkers = ['pyflakes']
let g:syntastic_check_on_open = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_highlighting = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['go'] }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au VimEnter *  NERDTree | wincmd l
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pretty Lambdas """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au VimEnter * syntax keyword Statement lambda conceal cchar=λ
au VimEnter * syntax keyword racketSyntax lambda conceal cchar=λ
au VimEnter * hi! link Conceal racketSyntax
au VimEnter * set conceallevel=2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Racket Config """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim-slime
let g:slime_target = "tmux"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Niji (Rainbow Parenthesis) Config """"""""""""""""""""""""""""""""""""""""""""
"
let g:niji_matching_filetypes = ['lisp', 'racket', 'clojure']
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
