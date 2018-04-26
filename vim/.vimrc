"   A simple vim config file
"
" it will be updated as soon as I want to :)
"
"   @author leolle

" PLUGIN SETUP
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'henrynewcomer/vim-theme-papaya'
Plugin 'bling/vim-airline'
Plugin 'stanangeloff/php.vim'
Plugin 'jwalton512/vim-blade'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mileszs/ack.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'


call vundle#end() " required
filetype plugin indent on

" END PLUGIN SETUP

" setup file specific indentation
set autoindent

 " easier switch between files
set hidden

 " better commandline completion
set wildmenu

" show partial commands in the last line of the screen
set showcmd

" use case insensitive search
set ignorecase
set smartcase " except when using capital letters

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Display cursor position
set ruler

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Enable use of the mouse for all modes
set mouse=a

" line numbering
set number

" set foldmethod
set foldmethod=indent

" tab config
set tabstop=4
set shiftwidth=4
set noexpandtab

set incsearch    " incremental search
set hlsearch     " highlight search terms
set laststatus=2 " all the time status bar

" syntax highlight
syntax on

" fancy colorscheme
colorscheme papaya

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" map jk to <Esc>
" ps.: it's faster
map! jk <Esc>

" gui font settings
if has("gui_running")
    set guifont=Monospace\ 10
endif

" NERDTree shortcut
nmap <C-n> :NERDTreeToggle<CR>

" syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_javascript_closurecompiler_path="/usr/local/bin/google-closure-compiler-js"
let g:sytnastic_javascript_checkers=['jshint']
let g:sytnastic_typescript_checkers=['tsuquyomi']

let g:syntastic_html_tidy_ignore_errors=["<ion-", "discarding unexpected </ion-", " proprietary attribute \"ng-"]

" vim CtrlP settings
" - default option an command to invoke CtrlP
" vim controlp setup related
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

" - CtrlP working directory definition
let g:ctrlp_working_path_mode='ra'

set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=*/www/*
set wildignore+=*/vendor/*
set wildignore+=*/public/*

" - CtrlP directories ignored by CtrlP
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore={
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }

" - removing trailing whitespace
"   as exposed in the following answer in stackoverflow
"   https://vi.stackexchange.com/a/456/1111

fun! TrimWhitespace() abort
    let l:save=winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup OnFileSave
	autocmd! " Clear all events for the OnFileSave namespace
	autocmd BufWritePost * call TrimWhitespace()
augroup END

