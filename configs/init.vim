" Installing Dependencies
call plug#begin()

Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/ryanoasis/vim-devicons' " Dev Icons for nerdtree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'akinsho/toggleterm.nvim' "I Don't think I did this right, check toggleterm/lua/config.lua  
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'junegunn/fzf.vim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'nvim-lua/popup.nvim'
" Plug 'mangeshrex/uwu.vim' " Comments were too dark so I manually recolored
Plug 'srcery-colors/srcery-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'

call plug#end()

" Settings

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
filetype plugin indent on
set wildmode=longest,list " I think this is for autocorrect stuff
" set cc=80
set nostartofline
" set list " You can see empty spaces at the end of a line
set cursorline
" set nocompatible " disable compat with old vi? idk what it means tho
" set guifont=DroidSansMono\ Nerd\ Font\ 11
set mouse+=a


" Theme
 set background=dark
 " colorscheme evening
 " colorscheme gruvbox
 "
 " let g_airline_theme='wombat'
 " colorscheme PaperColor
 " colorscheme srcery " Doesn't wanna look like https://vimcolorschemes.com/srcery-colors/srcery-vim 
  colorscheme uwu
let g:airline_theme='tomorrow'

" Dashboard
let g:dashboard_default_executive = 'fzf' 
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]
let g:dashboard_custom_section = {
\  'buffer_list': {
\        'description': ['text'], 'command': 'e',
\    }
\}
set termguicolors " this variable must be enabled for colors to be applied properly
lua <<EOF
vim.g.dashboard_custom_section = {
    a = {description = {'  New file                  '}, command = 'DashboardNewFile'},
    b = {description = {'  Browse files              '}, command = 'Telescope file_browser'},
	c = {description = {'  Recently Opened           '}, command = 'History'},
	d = {description = {'  Change Colorscheme        '}, command = 'Colors'},
	e = {description = {'  Settings                  '}, command = 'edit /home/danwolfstone/.config/nvim/init.vim'},
    f = {description = {'  Exit                      '}, command = 'exit'},
}

require('telescope').setup{
	defaults = {
		layout_strategy = 'horizontal',
		layout_config = { 
			height=0.95, 
			-- prompt_position = 'top', 
			},
		},
	}

-- This is where toggleterm's setup would go

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
set nofoldenable



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
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <Esc>:w<CR><right>i
vnoremap <silent> :w<CR>
" ---- Quit
nnoremap <C-q> :q<CR>
inoremap <C-q> <Esc>:q<CR>i
vnoremap <C-q> :q<CR>
" Force Quit // Don't use, quits the whole program
nnoremap <C-S-q> :qa!<CR>
inoremap <C-S-q> <Esc>:qa!<CR>
vnoremap <C-S-q> :qa!<CR>
" ---- Undo
nnoremap <C-z> u
inoremap <C-z> <Esc>u<CR><up>i
vnoremap <C-z> u
" ---- Terminal
tnoremap <Esc> <C-\><C-n>
nnoremap <F4> :ToggleTerm<CR>
vnoremap <F4> :ToggleTerm<CR>
inoremap <F4> :ToggleTerm<CR>
tnoremap <F4> <C-\><C-n>:ToggleTerm<CR>
" }}}

