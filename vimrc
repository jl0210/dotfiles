"========================================================================
"								Vundle Configuration
"========================================================================


set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Use Vundle to manage Bundles
Bundle 'gmarik/vundle'
" Bundles to install
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-fugitive'
Bundle 'majutsushi/tagbar'
Bundle 'a.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'nvie/vim-flake8'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'flazz/vim-colorschemes'
Bundle 'vim-scripts/CSApprox'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'edkolev/tmuxline.vim'
Bundle 'derekwyatt/vim-scala'


"========================================================================
"								General Settings
"========================================================================


filetype plugin indent on
syntax on
set nomodeline
set number
set nofoldenable
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set textwidth=80
set completeopt-=preview
set laststatus=2
autocmd BufWritePost *.py call Flake8()

set t_Co=256

" dark colorschemes
"colorscheme abra
"colorscheme billw
"colorscheme brown
"colorscheme busierbee
"colorscheme camo
"colorscheme chocolate
"colorscheme dark-ruby

" default dark
colorscheme darkspectrum

" bright colorschemes
"colorscheme campfire
"colorscheme ashen

" default bright
"colorscheme cascadia

"django


"========================================================================
"								Functions
"========================================================================



" Remove trailing whitespace
function! RemoveWhiteSpace()
    %s/\s\+$//e
endfunction

" Switch to a dark colorscheme
function! Dark()
    colorscheme darkspectrum
endfunction

"Switch to a light colorscheme
function! Light()
    colorscheme campfire
endfunction


"========================================================================
"								Custom Mappings
"========================================================================


" Remap <Esc> to jj
inoremap jj <Esc>
vnoremap jj <Esc>

" Remap leader key to '
let mapleader = "'"
" Remap <C-n>, <C-p> to <C-j>, <C-k>, respectively
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Map RemoveWhiteSpace to <Leader>rw
nnoremap <Leader>rw :call RemoveWhiteSpace()<CR>

" Toggle number on/off (number toggle)
nnoremap <Leader>nt :set number!<CR>

" Toggle RainbowParentheses on/off
nnoremap <Leader>parentheses :RainbowParenthesesToggle<CR>

" Map Dark to <Leader>dark
nnoremap <Leader>dark :call Dark()<CR>

" Map Light to <Leader>light
nnoremap <Leader>light :call Light()<CR>


"========================================================================
"								Plugins
"========================================================================


"------------------------------------------------------------------------
"								NERDTree
"------------------------------------------------------------------------


" <C-o> toggles NERDTree on/off
map <C-o> :NERDTreeToggle<CR>


"------------------------------------------------------------------------
"								CtrlP
"------------------------------------------------------------------------


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


"------------------------------------------------------------------------
"								DelimitMate
"------------------------------------------------------------------------


let delimitMate_expand_cr = 1
"<C-Space> jumps over current delimiter
imap <C-Space> <Plug>delimitMateS-Tab


"------------------------------------------------------------------------
"								RainbowParentheses
"------------------------------------------------------------------------


let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \]

"au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"au Syntax * RainbowParenthesesLoadChevrons


"------------------------------------------------------------------------
"								Tagbar
"------------------------------------------------------------------------


" <C-m> toggles Tagbar on/off
map <C-m> :TagbarToggle<CR>


"------------------------------------------------------------------------
"								YouCompleteMe
"------------------------------------------------------------------------


" Disable <Tab> for 'YouCompleteMe' package
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_enable_diagnostic_signs = 1

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window__after_completion = '1'
let g:ycm_complete_in_comments = '1'
let g:ycm_seed_identifiers_with_syntax = '1'


"------------------------------------------------------------------------
"								Airline
"------------------------------------------------------------------------


let g:airline_powerline_fonts=0
"let g:airline_theme='lucius'
"let g:airline_theme='molokai'
"let g:airline_theme='raven'
let g:airline_theme='silver'
"let g:airline_theme='term'
"let g:airline_theme='understated'


"------------------------------------------------------------------------
"								Tmuxline
"------------------------------------------------------------------------


let g:tmuxline_powerline_separators=0


"------------------------------------------------------------------------
"								Eclim
"------------------------------------------------------------------------


" To activate Eclim functionality, be sure to execute :ProjectCreate /path/to/project -n {java,scala}
" To activate Eclim functionality in a Maven Project, see the following link
"http://eclim.org/gettingstarted.html#gettingstarted-maven
let g:EclimCompletionMethod='omnifunc'
" Terminate Eclim with :ShutdownEclim
let java_highlight_functions='style'
let java_highlight_all=1



