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

" mouse on
set mouse=a

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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
"let g:go_fmt_command = "goimports"

"" There are many helpful snippets: https://github.com/fatih/vim-go/blob/master/gosnippets/UltiSnips/go.snippets 

"" shortcut to build and run
"autocmd FileType go nmap <leader>b  <Plug>(go-build)
"autocmd FileType go nmap <leader>r  <Plug>(go-run)

"let g:go_fmt_command = 'goimports' " autoupdate import
"let g:go_fmt_autosave = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"COC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
