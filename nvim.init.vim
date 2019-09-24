
" don't bother with vi compatibility
set nocompatible
" enable syntax highlighting
syntax enable

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'austintaylor/vim-indentobject'
Plug 'christoomey/vim-tmux-navigator'
Plug 'majutsushi/tagbar'
Plug 'rking/ag.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-pastie'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vividchalk'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/Align'

Plug 'jdkanani/vim-material-theme'
Plug 'w0ng/vim-hybrid'
Plug 'alvan/vim-closetag'
Plug 'joshdick/onedark.vim'
Plug 'janko-m/vim-test'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/space-vim-dark'
Plug 'junegunn/seoul256.vim'
Plug 'mhartington/oceanic-next'
Plug 'albertorestifo/github.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'lifepillar/vim-solarized8'
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'sebdah/vim-delve'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'kaicataldo/material.vim'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/vim-easy-align'
Plug 'b4b4r07/vim-hcl'
Plug 'fatih/vim-hclfmt'
call plug#end()

" configure Vundle
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
" set rtp+=~/.vim/bundle/Vundle.vim

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  " set ttymouse=xterm2
endif

function TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction
command! TrimWhitespace call TrimWhitespace()

" keyboard shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l :Align
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :FZF<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call TrimWhitespace()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
noremap <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" idk why this is a setting but show quotes in .json
let g:indentLine_conceallevel = 0

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
" extra rails.vim help
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" Go crazy!
if filereadable(expand("~/.vimrc.local"))
  " In your .vimrc.local, you might like:
  "
  " set autowrite
  " set nocursorline
  " set nowritebackup
  " set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
  "
  " autocmd! bufwritepost .vimrc source ~/.vimrc
  " noremap! jj <ESC>
  source ~/.vimrc.local
  " colorscheme OceanicNext
endif

" fzf thing
set rtp+=~/.fzf

filetype off

tnoremap <Esc> <C-\><C-n>

set nocursorline

function! ThemeLight()
  syntax on
  set termguicolors
  " set background=dark
  " colorscheme onedark
  set background=light
  colorscheme solarized8_high
  let g:airline_theme='solarized'
  let g:airline_solarized_bg='light'
endfunction

function! ThemeDark()
  syntax on
  set termguicolors
  set background=dark
  colorscheme onedark
  let g:airline_theme='onedark'
endfunction

function! ThemeDarkOne()
  syntax on
  set termguicolors
  colorscheme one
  set background=dark
  let g:airline_theme='one'
endfunction

function! ThemeLightOne()
  syntax on
  set termguicolors
  colorscheme one
  set background=light
  let g:airline_theme='one'
endfunction

function! ThemeNord()
  syntax on
  set termguicolors
  set background=dark
  let g:airline_theme='nord'
  colorscheme nord
endfunction

function! ThemeMaterial()
  set background=dark
  set termguicolors
  colorscheme quantum
  let g:airline_theme='quantum'
endfunction

function! ThemePaleNight()
  set background=dark
  set termguicolors
  colorscheme palenight
  let g:airline_theme='quantum'
  let g:palenight_terminal_italics=1
endfunction

function! ThemeTender()
  set background=dark
  set termguicolors
  colorscheme tender
  let g:airline_theme='tender'
endfunction

function! ThemeGruvDark()
  set background=dark
  set termguicolors
  colorscheme gruvbox
  let g:airline_theme='gruvbox'
endfunction

function! ThemeOceanic()
    " For Neovim 0.1.3 and 0.1.4
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " Or if you have Neovim >= 0.1.5
  if (has("termguicolors"))
   set termguicolors
  endif

  " Theme
  syntax enable
  colorscheme OceanicNext
  let g:airline_theme='oceanicnext'
endfunction

function! ThemeMaterial()
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set background=dark
  colorscheme material 
  if (has("termguicolors"))
    set termguicolors
  endif
  let g:material_theme_style = 'default'
  let g:airline_theme = 'material'
endfunction


" CURRENT THEME
"
call ThemeNord()


set nocursorcolumn
syntax sync minlines=256
set re=1
let g:go_dispatch_enabled=1


" Airline Settings
let g:airline_highlighting_cache = 1

" let g:airline#extensions#tabline#enabled       = 1
" let g:airline#extensions#tabline#show_buffers  = 1
" let g:airline#extensions#tabline#show_tab_type = 1
" let g:airline#extensions#tabline#close_symbol  = '×'
" let g:airline#extensions#tabline#formatter     = 'unique_tail_improved'
" let g:airline#extensions#tabline#tab_nr_type   = 1


" better undo
set undofile
set undodir=~/.vim/undodir

"enable deoplete
let g:deoplete#enable_at_startup = 1

" neocomplete like
" set completeopt+=noinsert
" deoplete.nvim recommend
" set completeopt+=noselect

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
autocmd filetype qf wincmd J

