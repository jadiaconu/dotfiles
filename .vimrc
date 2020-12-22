filetype plugin indent on
set term=xterm-256color

" Visual aspect
colorscheme xoria256

" Spelling
set spelllang=en_us
set spell

" After setting the xoria256 colorscheme, the background is incorrectly reset
" to 'light', this is a workaround to set it to 'dark'.
syntax off
set background=dark
syntax enable
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete

" Insert spaces instead of tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Global settings
set incsearch
set modelines=0
set hidden
set autoread                       " Update buffer when file changes elsewhere
set novisualbell
set ttyfast
set relativenumber                         " Display line number
set history=1000

" Suffixes : these are the files we are unlikely to edit
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.out,.toc

set ruler                          " Show cursor position at all times
set textwidth=0                    " Don't wrap words by default
set backspace=indent,eol,start
set showmatch
set showmode
set showcmd

" Highlight column 80
if exists('+colorcolumn')
  highlight ColorColumn ctermbg=233 guibg=#121212
  set colorcolumn=80
endif

" GUI Settings
if has("gui_running")
  set guioptions-=m " Remove menu bar
  set guioptions-=T " Remove toolbar
  set guioptions-=r " Remove right-hand scroll bar
  set guioptions-=L " Remove left-hand scroll bar when vertical split
endif

" Search settings
set incsearch
set smartcase
set infercase
set hlsearch
set showfulltag

" Scrolling
set scrolloff=3
set sidescrolloff=2

" Tab complete menu
set wildmode=longest:full
set wildmenu
set wildignore=*.o,*.a,*.so,*.ko,*~,*.swp,*.pyc,*.dll,tags,*.o.*
set wildignore+=.git/,.hg/,.svn/

" Indentation
set list
set listchars=
set listchars+=tab:>-
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:⣿

" Plugins
call plug#begin('~/.vim/plugged')

" Language
Plug 'fatih/vim-go'
Plug 'keith/swift.vim'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'elzr/vim-json'
Plug 'chr4/nginx.vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vim-scripts/c.vim'
Plug 'kchmck/vim-coffee-script'

" Completion -> conflict with ctags
" Plug 'rip-rip/clang_complete'

" Code
" Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
" Plug 'vim-scripts/AutoClose'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'liuchengxu/vim-which-key'
Plug 'rhysd/vim-clang-format'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'

" Tools
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'Valloric/ListToggle'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-haml'
Plug 'rhysd/vim-grammarous'
Plug 'mxw/vim-jsx'
Plug 'ngmy/vim-rubocop'
Plug 'gabrielelana/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/tagbar'
Plug 'mbbill/undotree'
Plug 'AndrewRadev/sideways.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', { 'tag': 'tags/v0.0.78' }

call plug#end()

" File open
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:netrw_localrmdir='rm -r'

" Insert header in new src file
autocmd bufnewfile *.js,*.c,*.ts so ~/.dotfiles/.headers/src_header.txt
autocmd bufnewfile *.js,*.c,*.ts exe "1," . 8 . "g/* File Name :.*/s//* File Name : " .expand("%")
autocmd bufnewfile *.js,*.c,*.ts  exe "1," . 8 . "g/* Creation Date :.*/s//* Creation Date : " .strftime("%d-%m-%Y")

" Move lines around
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" Nerd Tree
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Git Status
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ 'Modified'  :'✹',
            \ 'Staged'    :'✚',
            \ 'Untracked' :'✭',
            \ 'Renamed'   :'➜',
            \ 'Unmerged'  :'═',
            \ 'Deleted'   :'✖',
            \ 'Dirty'     :'✗',
            \ 'Ignored'   :'☒',
            \ 'Clean'     :'✔︎',
            \ 'Unknown'   :'?',
            \ }

" JS, TS, ES
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" C autocomplete
let g:clang_library_path='/usr/lib/x86_64-linux-gnu/libclang-6.0.so'
let g:clang_user_options='|| exit 0'
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1

" CTags
set tags=tags
nnoremap <C-f> :CtrlPTag<cr>
nnoremap <silent> tg :TagbarToggle<CR>

" DevIcons
set encoding=utf8

" Buffers
nnoremap <C-w><Tab> :bnext<CR>:redraw<CR>:ls<CR>

" Tabs
nnoremap <Tab> :tabn<CR>:redraw<CR>

" Nerdtree
nnoremap <S-Tab> :NERDTreeToggle<CR>:wincmd p<CR>

" Sideways
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

" Enable rainbow
let g:rainbow_active = 1
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" Vim Editor
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Vim ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'go': ['gofmt'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" Vim Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Go Auto Complete
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Auto close
function! ConditionalPairMap(open, close)
  let line = getline('.')
  let col = col('.')
  if col < col('$') || stridx(line, a:close, col + 1) != -1
    return a:open
  else
    return a:open . a:close . repeat("\<left>", len(a:close))
  endif
endfunction
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> [ ConditionalPairMap('[', ']')

function! s:CloseBracket()
    let line = getline('.')
    if line =~# '^\s*\(struct\|class\|enum\) '
        return "{\<Enter>}\<Esc>O"
    elseif searchpair('(', '', ')', 'bmn', '', line('.'))
        " Probably inside a function call. Close it off.
        return "{\<Enter>})\<Esc>O"
    else
        return "{\<Enter>}\<Esc>O"
    endif
endfunction
inoremap <expr> {<Enter> <SID>CloseBracket()

"" Remaps
nnoremap <C-e> <C-u>
nnoremap gr :grep! -R --exclude-dir=build --exclude-dir=node_modules --exclude-dir=.git --exclude=tags <cword> .<CR> :copen<CR>
nnoremap gf :ALEFindReferences.<CR>
nnoremap gd :ALEGoToDefinition.<CR>
