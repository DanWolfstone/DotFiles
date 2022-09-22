
call plug#begin()

Plug 'https://github.com/preservim/nerdtree'		" NerdTree
Plug 'https://github.com/ryanoasis/vim-devicons'	" Dev Icons for nerdtree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'							" File tabs up top
Plug 'vim-airline/vim-airline'						" Bar down there (updated recently)
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'akinsho/toggleterm.nvim'						" I Don't think I did this right, check toggleterm/lua/config.lua  
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'nvim-lua/plenary.nvim'
Plug 'junegunn/fzf.vim'								" Search Engine
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'darfink/vim-plist'
Plug 'tpope/vim-commentary'							" use 'gcc' to comment lines
Plug 'ray-x/lsp_signature.nvim'						" Helpful for docs
" Autocomplete
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Colors
" Plug 'mangeshrex/uwu.vim'							" Comments were too dark so I manually recolored
Plug 'srcery-colors/srcery-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
" Langs
Plug 'rust-lang/rust.vim'
" maybe check this out https://github.com/folke/which-key.nvim

call plug#end() 


" Settings

autocmd FileType apache setlocal commentstring=#\ %s
filetype plugin indent on
set encoding=UTF-8
set number " Numbered lines
syntax on " turn on syntax, duh
set autoindent " Auto indent based on lang
" set nocompatible " disable compat with old vi? idk what it means tho
set showmatch " show matching brackets
set smartcase " capital letters are important
set ignorecase " ignore case in search
" set gdefault " g flag by default (what does g do again?)
set hlsearch " highlight search result
set tabstop=4
set shiftwidth=4
set softtabstop=4
set wildmode=longest,list " I think this is for autocorrect stuff
" set cc=80
set nostartofline
" set list " You can see empty spaces at the end of a line
set cursorline
" set nocompatible " disable compat with old vi? idk what it means tho
" set guifont=DroidSansMono\ Nerd\ Font\ 11
set mouse+=a
set clipboard+=unnamedplus

" Theme
 set background=dark
 " colorscheme evening
 " colorscheme gruvbox
 "
 " let g_airline_theme='wombat'
 " colorscheme PaperColor
set termguicolors " this variable must be enabled for colors to be applied properly
colorscheme srcery " Doesn't wanna look like https://vimcolorschemes.com/srcery-colors/srcery-vim 
  " colorscheme uwu
let g:airline_theme='tomorrow'

lua <<EOF
cfg = {	}  -- add you config here
  	require("toggleterm").setup{}
	require('lspconfig').pyright.setup{}
	require('lsp_signature').setup(cfg) 
	
require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require'lspconfig'.clangd.setup {
  capabilities = capabilities,
}

EOF


" NerdTree
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h12
let g:airline_powerline_fonts=1
let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:WebDevIconsNerdTreeAfterGlyphPadding=' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign=0

" Folding
set foldmethod=syntax

"COC Langs
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ ]
" Complete via pressing tab
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else 
    call feedkeys('K', 'in')
  endif
endfunction

" MAPPINGS --------------------------------------------------------------- {{{

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <C-down> <C-w>j
nnoremap <C-up> <C-w>k
nnoremap <C-left> <C-w>h
nnoremap <C-right> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-k> <c-w>+
noremap <c-j> <c-w>-
noremap <c-h> <c-w>>
noremap <c-l> <c-w><

" ctrl+shift+up = move line up
nnoremap <C-S-up> :m .-2<CR>==
inoremap <C-S-up> <Esc>:m .-2<CR>==gi
vnoremap <C-S-up> :m '<-2<CR>gv=gv

" ctrl+shift+down = move line down
nnoremap <C-S-down> :m .+1<CR>==
inoremap <C-S-down> <Esc>:m .+1<CR>==gi
vnoremap <C-S-down> :m '>+1<CR>gv=gv

" ---- Save
nnoremap ß :w<CR>
inoremap ß <Esc>:w<CR><right>i
vnoremap ß :w<CR>
" ---- Quit
nnoremap œ :q<CR>
inoremap œ <Esc>:q<CR>i
vnoremap œ :q<CR>
" Force Quit // Don't use, quits the whole program
nnoremap <C-S-q> :qa!<CR>
inoremap <C-S-q> <Esc>:qa!<CR>
vnoremap <C-S-q> :qa!<CR>
" ---- Undo
nnoremap Ω u
inoremap Ω <Esc>u<CR><up>i
vnoremap Ω u
" ---- Terminal
tnoremap <Esc> <C-\><C-n>
nnoremap <F4> :ToggleTerm<CR>
vnoremap <F4> :ToggleTerm<CR>
inoremap <F4> :ToggleTerm<CR>
tnoremap <F4> <C-\><C-n>:ToggleTerm<CR>
" }}}


