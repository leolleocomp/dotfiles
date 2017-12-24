"   A simple vim config file
"
" it will be updated as soon as I want to :)
"
"   @author leolle

" enable 256-color
set t_Co=256

call pathogen#helptags()
exec pathogen#infect('bundle/{}', '~/Projects/vim_config/plugins/{}')
set nocompatible

" vim controlp setup related
set runtimepath^=~/.vim/bundle/ctrlp.vim

" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

" fancy colorscheme
colorscheme Benokai

" syntax hilight
syntax on

" line numbering
set number

" different indentation according to filetype 
filetype plugin indent on

" --TAB config
" 1) space instead of characters
" 2) 4 spaces for a tab
" 3) haven't understood it very well
" 4) all tab characteres to match the settings
set tabstop=4 shiftwidth=4
retab

" map jk to <Esc>
" ps.: it's faster
map! jk <Esc>

" gui font/color settings
if has("gui_running")
    set guifont=Monospace\ 10
endif

" incremental search
set incsearch

" highlight search terms
set hlsearch

" set auto indentation
set cindent

" all the time status bar
set laststatus=2

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_server_python_interpreter = "/usr/bin/python"

" syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 
let g:syntastic_javascript_closurecompiler_path = "/usr/local/bin/google-closure-compiler-js"
let g:sytnastic_javascript_checkers = ['jshint']
let g:sytnastic_typescript_checkers = ['tsuquyomi']

let g:syntastic_html_tidy_ignore_errors=["<ion-", "discarding unexpected </ion-", " proprietary attribute \"ng-"]
"let g:tsuquyomi_disable_quickfix = 1

" vim CtrlP settings
" - default option an command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" - CtrlP working directory definition
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=*/www/*
set wildignore+=*/vendor/*
set wildignore+=*/public/*

" - CtrlP directories ignored by CtrlP
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }

" - removing trailing whitespace
"   as exposed in the following answer in stackoverflow
"   https://vi.stackexchange.com/a/456/1111

fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

noremap <F5> :call TrimWhitespace()<CR>

" set foldmethod
:set foldmethod=indent

" no wrap
:set nowrap

" no swapfile
:set noswapfile
