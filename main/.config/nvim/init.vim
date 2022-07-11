call plug#begin()
" Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-surround'
Plug 'preservim/tagbar'
Plug 'universal-ctags/ctags'
Plug 'luochen1990/rainbow'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Plug 'Shougo/deoplete.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" needs special command
Plug 'lervag/vimtex'
Plug 'preservim/vim-markdown'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'deoplete-plugins/deoplete-jedi'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-airline/vim-airline'
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
" Plug 'davidhalter/jedi-vim'
call plug#end()

" Theme
colorscheme palenight

" Syntax highlighting
syntax on

" Rainbow
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:deoplete#enable_at_startup = 1

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Latex
let g:tex_flavor = 'tex'

let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_method = 'zathura'
let g:vimtex_indent_enabled = 0
filetype plugin indent on
call vimtex#imaps#add_map({
      \ 'lhs' : '<é>',
      \ 'rhs' : '\item ',
      \ 'leader'  : '',
      \ 'wrapper' : 'vimtex#imaps#wrap_trivial'
      \})
nmap <F2> :VimtexClean<CR>

" Markdown Preview Config
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

" Transparancy
highlight Normal ctermbg=None
highlight NonText ctermbg=None
