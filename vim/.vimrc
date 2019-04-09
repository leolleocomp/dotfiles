"   A simple vim config file
"
" it will be updated as soon as I want to :)
"
"   @author leolleo
"
set nocompatible

" PLUGIN SETUP
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" snippets!
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'posva/vim-vue'
Plugin 'mxw/vim-jsx'
Plugin 'TroyFletcher/vim-colors-synthwave'
Plugin 'dracula/vim'
Plugin 'larssmit/vim-getafe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'stanangeloff/php.vim'
Plugin 'jwalton512/vim-blade'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mileszs/ack.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

call vundle#end() " required
filetype plugin indent on

" END PLUGIN SETUP

" stup vim autocomplete
set omnifunc=syntaxcomplete#Complete

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

" set foldmethod
set foldmethod=indent

" tab config
set tabstop=4
set shiftwidth=4
set noexpandtab

set incsearch    " incremental search
set hlsearch     " highlight search terms
set laststatus=2 " all the time status bar

" disables annoying swap files
set noswapfile

" syntax highlight
syntax on

" fancy colorscheme
colorscheme synthwave

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

" Ultisnips config
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<leader>j"
let g:UltiSnipsJumpBackwardTrigger="<leader>k"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ALEFix
let g:ale_fixers = {
\   'javascript': [
\       'eslint',
\   ],
\}

nmap <F8> <Plug>(ale_fix)

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
let g:ctrlp_custom_ignore={
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|swp)$',
  \ 'link': '',
  \ }

" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Tags related mappings

nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <leader>b :TagbarToggle<CR>

" - removing trailing whitespace
"   as exposed in the following answer in stackoverflow
"   https://vi.stackexchange.com/a/456/1111

fun! TrimWhitespace() abort
    let l:save=winsaveview()

	" .md files are space sensitive
	if match(expand('%'), '.*\.md$') == -1
		%s/\s\+$//e
	endif

    call winrestview(l:save)
endfun

augroup OnFileSave
	autocmd! " Clear all events for the OnFileSave namespace
	autocmd BufWritePost * call TrimWhitespace()
augroup END

