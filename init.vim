call plug#begin("~/.vim/plugged")
Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

" UNUSED PLUGS
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'arcticicestudio/nord-vim'

call plug#end()

set number
set relativenumber

set encoding=UTF-8

" add copy/paste from comp register to vim
set clipboard=unnamed
set clipboard=unnamedplus

" maps
map ö <C-}>
map Ö <C-{>
map <c-q> :NERDTreeFind<CR>
map <esc> :noh<CR>

inoremap kj <esc>
inoremap jk <esc>

" colorscheme
if (has("termguicolors"))
	set termguicolors
endif

if (has("nvim"))
 " for Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

syntax enable
colorscheme dracula

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
" set expandtab

" go
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports" " autoimports
let g:go_auto_type_info = 1 " display type in info-bar
let g:go_addtags_transform = "snakecase" " :GoAddTags - add jsons in struct

" terminal
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+ö
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
" nnoremap <c-ö> :call OpenTerminal()<CR>
nnoremap <C-ö> :call OpenTerminal()<CR>

" nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = ''
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeGitStatusWithFlags = 1
" automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" coc (intellisense/highlighing)
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-flutter',
	\ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" fzf
nnoremap <silent> <C-p> :Files<CR>

" airline
let g:airline_powerline_fonts = 1
set t_Co=256

" autoclose tags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx'
