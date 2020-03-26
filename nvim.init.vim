
" don't bother with vi compatibility
set nocompatible
" enable syntax highlighting
syntax enable

set splitright

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
" Plug 'tpope/vim-endwise'
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
set clipboard=unnamedplus                                    " yank and paste with the system clipboard
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

"Enable basic mouse behavior such as resizing buffers.
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
nnoremap <leader>b :NERDTreeFind<CR>
nnoremap <leader>f :NERDTreeToggle<CR>
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
  colorscheme solarized8
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
" let g:go_dispatch_enabled=1


" Airline Settings
let g:airline_highlighting_cache = 1
let g:airline_section_y = ''
" let g:airline_extensions = []
" let g:airline#extensions#tabline#enabled       = 1
" let g:airline#extensions#tabline#show_buffers  = 1
" let g:airline#extensions#tabline#show_tab_type = 1
" let g:airline#extensions#tabline#close_symbol  = '×'
let g:airline#extensions#tabline#formatter     = 'unique_tail_improved'
" let g:airline#extensions#tabline#tab_nr_type   = 1


" better undo
set undofile
set undodir=~/.vim/undodir

" vim-go settings

" disable vim-go keybindings in favor of coc
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_textobj_enabled = 0
let g:go_gopls_enabled = 0

"type info
let g:go_auto_type_info = 0

" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
" let g:go_def_mode='guru'
" let g:go_info_mode='guru'

" DISABLE gopls since coc starts it 
let g:go_term_enabled = 1
" let g:go_term_enabled = 0
let g:go_term_mode='vsplit'
let g:go_term_close_on_exit = 0
let g:go_list_autoclose = 1
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_list_type_commands={"GoTestFunc!": "", "GoTestFunc": ""}
let g:go_test_show_name=1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 0
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
" let g:go_gopls_complete_unimported = 1
" let g:go_gopls_use_placeholders = 1
 
" coc completion
" use <cr> to confirm complete
"
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

augroup mygroup
  autocmd!
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" END coc completion
"
" md settings
au BufRead,BufNewFile *.md setlocal textwidth=80

" This trigger takes advantage of the fact that the quickfix window can be
" easily distinguished by its file-type, qf. The wincmd J command is
" equivalent to the Ctrl+W, Shift+J shortcut telling Vim to move a window to
" the very bottom (see :help :wincmd and :help ^WJ).
autocmd FileType qf wincmd J

