""""""""""""""""""""""""""""""""""""""""""""""""
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

" Artur Badenes Puig
" ARCH LINUX
" :so % => reload file
""""""""""""""""""""""""""""""""""""""""""""""""

" various settings

" Allow improved things
set nocompatible

" Syntax
syntax on
filetype plugin indent on

" mod key space
let mapleader=' '

" Proper backspace behavior.
set backspace=indent,eol,start    

" Incremental search, hit `<CR>` to stop.
set incsearch                    

" Removes highlight of previous search.
set nohlsearch

" Shows the current line number at the bottom-right
set ruler    

" set lateral number relative to cursor
set relativenumber

" wraps long lines 
set linebreak

" Great command-line completion, use `<Tab>` to move
set wildmenu                      

set hidden

" number of spaces when shift indenting
set shiftwidth=4             

" number of visual spaces per tab
set tabstop=4              

" number of spaces in tab when editing
set softtabstop=4             

" indents and tab stuff 
set expandtab                
set autoindent               
set smartindent
set smarttab

" No backups
set nobackup
set nowritebackup
set noswapfile

" Undo between sessions
set undodir=~/.config/nvim/undodir
set undofile

" Keep cursor in the middle of the screen
set scrolloff=7             

" Increase buffer size for large chunks of text
set viminfo='20,<1000,s1000

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Special functionality
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" start at last place you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" disable arrow keys (vi muscle memory)
noremap <up> :echoerr "Umm, use k instead"<CR>
noremap <down> :echoerr "Umm, use j instead"<CR>
noremap <left> :echoerr "Umm, use h instead"<CR>
noremap <right> :echoerr "Umm, use l instead"<CR>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits and tabbed files 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" :sp => split horizontal
" :vs => split vertical

" Change default order when splitting
set splitbelow splitright

" Remap splits navigation to just CTRL +hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Change 2 split windows  from vert to horiz or horiz to vert
map <leader>ht <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" Remove pipes | that act as separators on splits
"set fillchars+=vert:\

""""""""""""""""""""""""""""""""""""""""""""""""
" Pluggins
""""""""""""""""""""""""""""""""""""""""""""""""

" auto install plug vim

if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
"Plug 'preservim/nerdtree'
"Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'vimwiki/vimwiki'
"Plug 'scrooloose/syntastic'
"Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'morhetz/gruvbox'
"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
"Plug 'jiangmiao/auto-pairs'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'rust-lang/rust.vim'
"Plug 'SirVer/ultisnips'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark

colorscheme gruvbox
"colorscheme dracula
"colorscheme nord

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" multicursor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" start: <C-n> start multicursor and add a virtual cursor + selection on the match
	" next: <C-n> add a new virtual cursor + selection on the next match
        " skip: <C-x> skip the next match
        " prev: <C-p> remove current virtual cursor + selection and go back on previous match
        " select all: <A-n> start multicursor and directly select all matches
" You can now change selection with c, s, I, A. 
" You could also go to normal mode by pressing v and use normal commands there.
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{getcwd()}' " in section B of the status line display the CWD

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimWiki
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:vimwiki_list = [{'path': 'doc/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"map <leader>g :Goyo<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"map <leader>t :NERDTreeToggle<CR>
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"
" let g:syntastic_error_symbol = "✗"
" let g:syntastic_warning_symbol = "⚠"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat all .md files as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Hide and format markdown elements like **bold** without vim plugin
" autocmd FileType markdown set conceallevel=2

" Set spell check to British English
" autocmd FileType markdown setlocal spell spelllang=en_gb

" Configuration for vim-markdown
" let g:vim_markdown_conceal = 2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Emoji shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

ab :white_check_mark: ✅
ab :warning: ⚠
ab :bulb: 💡
ab :pushpin: 📌
ab :bomb: 💣
ab :pill: 💊
ab :construction: 🚧
ab :pencil: 📝
ab :point_right: 👉
ab :book: 📖
ab :link: 🔗
ab :wrench: 🔧
ab :info: 🛈
ab :telephone: 📞
ab :email: 📧
ab :computer: 💻

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" https://github.com/fatih/vim-go/wiki/Tutorial#quick-setup

"" auto imports on save
let g:go_fmt_command = "goimports"

"" There are many helpful snippets: https://github.com/fatih/vim-go/blob/master/gosnippets/UltiSnips/go.snippets 

"" shortcut to build and run
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

let g:go_fmt_command = 'goimports' " autoupdate import
let g:go_fmt_autosave = 1

