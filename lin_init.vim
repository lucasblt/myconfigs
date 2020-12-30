call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'machakann/vim-highlightedyank'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'pacha/vem-tabline'

call plug#end()

set encoding=UTF-8
set number

" let g:python3_host_prog = 'C:/Users/LCSB/AppData/Local/Programs/Python/Python38/python'

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
    resize 10
    endfunction
    nnoremap <c-n> :call OpenTerminal()<CR>"

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>"

colorscheme gruvbox
set background=dark

let g:airline_theme='luna'

let g:deoplete#enable_at_startup = 1

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

set splitbelow

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
nnoremap <SPACE> <Nop>

let mapleader=" "

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

let g:neomake_python_enabled_makers = ['pylint']

" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

autocmd VimEnter * NERDTree

nmap <A-1> <Plug>vem_prev_buffer-
nmap <A-2> <Plug>vem_next_buffer-
nmap <A-w> <Plug>vem_delete_buffer-
