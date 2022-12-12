" Installing Dependencies/Plugins
call plug#begin()

Plug 'https://github.com/preservim/nerdtree'		" NerdTree
Plug 'https://github.com/ryanoasis/vim-devicons'	" Dev Icons for nerdtree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'							" File tabs up top
Plug 'vim-airline/vim-airline'						" Bar down there (updated recently)
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'akinsho/toggleterm.nvim'						" Terminal In nvim
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}			" Completion Engine
Plug 'junegunn/fzf.vim'								" Search Engine
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " File searcher
Plug 'nvim-lua/plenary.nvim'						" Deps for telescope
Plug 'nvim-lua/popup.nvim'							" Popup windows, like telescope
Plug 'tpope/vim-commentary'							" use 'gcc' to comment lines
Plug 'ray-x/lsp_signature.nvim'						" Helpful for docs
Plug 'NvChad/nvim-colorizer.lua'						" Make colors visible for RGB/Tailwind
Plug 'glepnir/dashboard-nvim'						" Hoping dashboard works again
" Plug 'ntpeters/vim-better-whitespace'				" Whitespace visualizer
" Plug 'AckslD/nvim-neoclip.lua'
Plug 'nvim-telescope/telescope-file-browser.nvim'	" File browser 
Plug 'adoyle-h/lsp-toggle.nvim'						" Toggle LSP servers 

" Autocomplete
	Plug 'neovim/nvim-lspconfig'
	"	Plug 'kabouzeid/nvim-lspinstall'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'williamboman/mason.nvim'						" Replacing LspInstall, pkg mgr for lang servers
	Plug 'williamboman/mason-lspconfig.nvim'			" Addon because mason isn't complete


" Colors
" Plug 'mangeshrex/uwu.vim'							" Comments were too dark so I manually recolored
Plug 'srcery-colors/srcery-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
" Langs
Plug 'rust-lang/rust.vim'
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
Plug 'darfink/vim-plist'							" adds support for plist files
" maybe check this out https://github.com/folke/which-key.nvim

call plug#end()


" Settings

autocmd FileType apache setlocal commentstring=#\ %s
autocmd FileType scss setl iskeyword+=@-@
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

" Folding
set foldmethod=syntax
set foldenable
autocmd FILETYPE vim setlocal foldmethod=marker

" Theme
 set background=dark
 " colorscheme evening
 " colorscheme gruvbox
 "
 " let g_airline_theme='wombat'
 " colorscheme PaperColor
set termguicolors " this variable must be enabled for colors to be applied properly
colorscheme srcery " Doesn't wanna look like https://vimcolorschemes.com/srcery-colors/srcery-vim
set fillchars+=vert:█
hi! VertSplit ctermfg=15 ctermbg=0 guifg=#808080 guibg=#3d3d3d
  " colorscheme uwu
let g:airline_theme='tomorrow'

lua <<EOF
cfg = {	}  -- add you config here
	require("toggleterm").setup{}
	require("mason").setup()
	require('lspconfig').pyright.setup{}
	require('lsp_signature').setup(cfg)
--	require('lspinstall').setup()
	require('colorizer').setup()
	require('lsp-toggle').setup()
--	require('neoclip').setup()
	require('telescope').setup{
		\extensions = {
			file_browser = {
		--		theme = "ivy",
				hidden = true,
		--		cwd_to_path = true, -- Open from working file directory
				layout_strategy = 'horizontal',
				layout_config = {
					height=0.95,
			 -- prompt_position = 'top',
						},
			 		}
				}
	  \ } -- End Telescope Setup
	require("telescope").load_extension "file_browser"

require("colorizer").setup {
      filetypes = { "*" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        names = true, -- "Name" codes like Blue or blue
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "virtualtext", -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = true, -- Enable tailwind colors
        -- parsers can contain values used in |user_default_options|
        sass = { enable = false, parsers = { css }, }, -- Enable sass colors
        virtualtext = "██"
      },
      -- all the sub-options of filetypes apply to buftypes
      buftypes = {},
  }

require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}


-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require'lspconfig'.clangd.setup {
  capabilities = capabilities,
}

EOF


" NerdTree
nnoremap † :NERDTreeToggle<CR>	" Mac Shortcut
nnoremap <C-t> :NERDTreeToggle<CR>

let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h12
let g:airline_powerline_fonts=1
let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:WebDevIconsNerdTreeAfterGlyphPadding=' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign=0


"COC Langs
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-tailwindcss',
  \ 'coc-html',
  \ 'coc-rust-analyzer',
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

" Dashboard

" let g:dashboard_custom_footer = ['LuaJIT loaded '..packages..' packages']


lua <<EOF
local dashboard = require("dashboard")
local version = vim.version()

--local function repeat_str (str, times)
--return times > 0 and str..repeat_str(str, times-1) or ""
--end

dashboard.custom_header = {
\ '                                                       ',
\ '                                                       ',
\ '                                                       ',
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\ '                                                       ',
\ '                                                       ',
\ '                                                       ',
\}

dashboard.custom_center = {
	{ desc = "   New file            ", 			action = "DashboardNewFile", },
	{ desc = "   Browse files        ", 			action = "Telescope file_browser", },
    { desc = "   Recent              ", 			action = "Telescope oldfiles", },
	{ desc = "   Update plugins      ", 			action = "PlugUpdate",},
	{ desc = "   Open Terminal       ", 			action = "ToggleTerm", },
    { desc = "   Settings            ", 			action = "edit $MYVIMRC" },
    { desc = "   Close neovim        ", 			action = "qa!" },
	--  action = "Telescope find_files cwd=~/.config/nvim/ search_dirs=Ultisnips,lua,viml,init.vim",
}

local footer = function()
  local version = " " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
--  local total_plugins = "   " .. packages .. " Plugins"
--  return version .. total_plugins
end

dashboard.custom_footer = footer()



EOF



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

" ---- Terminal
tnoremap <Esc> <C-\><C-n>
nnoremap <F4> :ToggleTerm<CR>
vnoremap <F4> :ToggleTerm<CR>
inoremap <F4> <Esc>:ToggleTerm<CR>
tnoremap <F4> <C-\><C-n>:ToggleTerm<CR>

" ---- Tab Management
nnoremap <M-TAB> gt
inoremap <M-TAB> gt
vnoremap <M-Tab> gt

" }}}

" MAC MAPPINGS ----------------------------------------------------------- {{{

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

" ---- Undo/Redo
nnoremap Ω u
inoremap Ω <Esc>u<CR><up>i
vnoremap Ω u

nnoremap ® <C-r>
inoremap ® <Esc><C-r><CR><up>i
vnoremap ® <C-r>

" ---- Open File
nnoremap ø :Telescope file_browser<CR>
inoremap ø :Telescope file_browser<CR>
vnoremap ø :Telescope file_browser<CR>

" ---- Open File from current directory
nnoremap Ø :Telescope file_browser path=%:p:h<CR>
inoremap Ø :Telescope file_browser path=%:p:h<CR>
vnoremap Ø :Telescope file_browser path=%:p:h<CR>

" ---- Refresh File
nnoremap <F5> :so %<CR>
inoremap <F5> :so %<CR>
vnoremap <F5> :so %<CR>

" }}}
