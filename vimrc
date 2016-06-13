"========================================================================
"								Vundle Configuration
"========================================================================


set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Use Vundle to manage Plugins
Plugin 'VundleVim/Vundle.vim'
" Plugins to install
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'a.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'nvie/vim-flake8'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/CSApprox'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'derekwyatt/vim-scala'


" All plugins to install must be above this line
call vundle#end()


"========================================================================
"								General Settings
"========================================================================


filetype plugin indent on
syntax on
set nomodeline
set number
set relativenumber
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

" Visual cleanup for pasting
function! ToggleNicePaste()
    set foldcolumn=0
    set number!
    set relativenumber!
    set paste!
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

" Map ToggleNicePaste to <Leader>p
nnoremap <Leader>p :call ToggleNicePaste()<CR>

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



