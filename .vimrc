filetype plugin indent on
set term=xterm-256color
set background=dark
syntax enable

" Spelling
set spelllang=en_us
set spell

" Insert spaces instead of tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Split on the right
set splitright

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

" Code
" Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
" Plug 'vim-scripts/AutoClose'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'

" Tools
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-haml'
Plug 'rhysd/vim-grammarous'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/tagbar'
Plug 'mbbill/undotree'
Plug 'AndrewRadev/sideways.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'shime/vim-livedown'

call plug#end()

" Visual aspect
colorscheme xoria256

" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" File open
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:netrw_localrmdir='rm -r'

" Insert header in new src file
autocmd bufnewfile *.js,*.c,*.ts,*.go,*.h,*.cpp,*.cc so ~/.dotfiles/.headers/src_header.txt
autocmd bufnewfile *.js,*.c,*.ts,*.go,*.h,*.cpp,*.cc exe "1," . 8 . "g/* File Name :.*/s//* File Name : " .expand("%")
autocmd bufnewfile *.js,*.c,*.ts,*.go,*.h,*.cpp,*.cc  exe "1," . 8 . "g/* Creation Date :.*/s//* Creation Date : " .strftime("%d-%m-%Y")

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

" CTags
set tags=tags
nnoremap <C-f> :CtrlPTag<cr>
nnoremap <silent> tg :TagbarToggle<CR>

" DevIcons
set encoding=utf8

" Buffers
nnoremap <C-w><Tab> :bnext<CR>:redraw<CR>:ls<CR>

" Nerdtree
nnoremap <Tab> :NERDTreeFind<CR>:tabn<CR>:redraw<CR>
nnoremap <S-Tab> :NERDTreeToggle<CR>:wincmd p<CR>
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,*.swo
let NERDTreeRespectWildIgnore=1
let NERDTreeShowHidden=1

" Sideways
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

" Enable rainbow
let g:rainbow_active = 1
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" Vim Editor
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Vim ALE - for linting
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier'],
\   'typescriptreact': ['eslint', 'prettier'],
\   'cpp': ['clang-format'],
\   'java':['google_java_format'],
\   'python': ['yapf'],
\   'go': ['gofmt'],
\   'css':['prettier'],
\   'less':['prettier'],
\   'scss':['prettier'],
\   'json':['prettier'],
\   'graphql':['prettier'],
\   'markdown':['prettier'],
\   'vue':['prettier'],
\   'html':['prettier']
\}
let g:ale_linters = {
\   'java':['eclipselsp'],
\   'cpp':['ccls'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" ALE Java settings
let g:ale_java_eclipselsp_path = '$HOME/.config/coc/extensions/coc-java-data/server'
let g:ale_java_eclipse_config_path = '$HOME/.config/coc/extensions/coc-java-data/server/config_mac'
let g:ale_java_eclipselsp_javaagent = '/Users/jdiaconu/.java/lombok.jar'

" ALE C++ Settings
let g:ale_cpp_ccls_init_options = {}

" Vim COC - for completion
let g:coc_global_extensions = [
\   'coc-snippets',
\   'coc-pairs',
\   'coc-css',
\   'coc-html',
\   'coc-go',
\   'coc-tabnine',
\   'coc-yaml',
\   'coc-tsserver',
\   'coc-json',
\   'coc-python',
\   'coc-clangd',
\   'coc-java'
\]

" Vim Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Fugitive
command! Diff call s:view_git_history()

function! s:view_git_history() abort
  Git difftool --name-only ! !^@
  call s:diff_current_quickfix_entry()
  " Bind <CR> for current quickfix window to properly set up diff split layout after selecting an item
  " There's probably a better way to map this without changing the window
  copen
  nnoremap <buffer> <CR> <CR><BAR>:call <sid>diff_current_quickfix_entry()<CR>
  wincmd p
endfunction

function s:diff_current_quickfix_entry() abort
  " Cleanup windows
  for window in getwininfo()
    if window.winnr !=? winnr() && bufname(window.bufnr) =~? '^fugitive:'
      exe 'bdelete' window.bufnr
    endif
  endfor
  cc
  call s:add_mappings()
  let qf = getqflist({'context': 0, 'idx': 0})
  if get(qf, 'idx') && type(get(qf, 'context')) == type({}) && type(get(qf.context, 'items')) == type([])
    let diff = get(qf.context.items[qf.idx - 1], 'diff', [])
    echom string(reverse(range(len(diff))))
    for i in reverse(range(len(diff)))
      exe (i ? 'leftabove' : 'rightbelow') 'vert diffsplit' fnameescape(diff[i].filename)
      call s:add_mappings()
    endfor
  endif
endfunction

function! s:add_mappings() abort
  nnoremap <buffer>]q :cnext <BAR> :call <sid>diff_current_quickfix_entry()<CR>
  nnoremap <buffer>[q :cprevious <BAR> :call <sid>diff_current_quickfix_entry()<CR>
  " Reset quickfix height. Sometimes it messes up after selecting another item
  11copen
  wincmd p
endfunction

" " Auto close
" function! ConditionalPairMap(open, close)
"   let line = getline('.')
"   let col = col('.')
"   if col < col('$') || stridx(line, a:close, col + 1) != -1
"     return a:open
"   else
"     return a:open . a:close . repeat("\<left>", len(a:close))
"   endif
" endfunction
" inoremap <expr> ( ConditionalPairMap('(', ')')
" inoremap <expr> [ ConditionalPairMap('[', ']')
"
" function! s:CloseBracket()
"     let line = getline('.')
"     if line =~# '^\s*\(struct\|class\|enum\) '
"         return "{\<Enter>}\<Esc>O"
"     elseif searchpair('(', '', ')', 'bmn', '', line('.'))
"         " Probably inside a function call. Close it off.
"         return "{\<Enter>})\<Esc>O"
"     else
"         return "{\<Enter>}\<Esc>O"
"     endif
" endfunction
" inoremap <expr> {<Enter> <SID>CloseBracket()
"

" Livedown MD Preview
nmap nm :LivedownToggle<CR>

" Remaps
nnoremap <C-e> <C-u>
nnoremap gr :grep! -RI --exclude-dir=.ccls-cache --exclude-dir=.cache --exclude-dir=.ccls --exclude-dir=build --exclude-dir=node_modules --exclude-dir=vendor --exclude-dir=build --exclude-dir=public --exclude-dir=.git --exclude=tags  <cword> .<CR> :botright copen<CR>
nnoremap gf :ALEFindReferences.<CR>
nnoremap gd :ALEGoToDefinition.<CR>
nnoremap gh :0Gclog<CR>
nnoremap gj :Gdiffsplit<CR>
" Reselect pasted text
nnoremap gp `[v`]

" Tmux Navigation
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
