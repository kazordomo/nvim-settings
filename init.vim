call plug#begin("~/.vim/plugged")
Plug 'arcticicestudio/nord-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim' " fuzy and files
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'Yggdroot/indentLine'
call plug#end()

set number

map ä <C-}>
map Ä <C-{>

" colorscheme
if (has("termguicolors"))
	set termguicolors
endif

if (has("nvim"))
 " for Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

colorscheme nord

" nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
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
  \ 'coc-pairs',
  \ 'coc-flutter',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
