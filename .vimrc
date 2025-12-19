filetype plugin indent on
set term=xterm-256color
set background=dark
set termguicolors
syntax enable

" Leader
let g:mapleader = "l"
let g:maplocalleader = "l"

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
set hidden
set autoread                       " Update buffer when file changes elsewhere
set novisualbell
set ttyfast
set relativenumber                 " Display line number
set history=1000
set ttimeoutlen=100
set timeoutlen=1000

" Suffixes : these are the files we are unlikely to edit
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.out,.toc,.swn,.swo

set ruler                          " Show cursor position at all times
set textwidth=0                    " Don't wrap words by default
set backspace=indent,eol,start
set showmatch
set showmode
set showcmd

" Highlight column 100
if exists('+colorcolumn')
  highlight ColorColumn ctermbg=233 guibg=#121212
  set colorcolumn=100
endif

" GUI Settings
if has("gui_running")
  set guioptions-=m                 " Remove menu bar
  set guioptions-=T                 " Remove toolbar
  set guioptions-=r                 " Remove right-hand scroll bar
  set guioptions-=L                 " Remove left-hand scroll bar when vertical split
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
set wildignore=*.o,*.a,*.so,*.ko,*~,*.swp,*.pyc,*.dll,tags,*.o.*,*.swo,*.swn,*.log
set wildignore+=.git/,.hg/,.svn/,build/

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
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'

" Tools
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
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
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'shime/vim-livedown'
Plug 'tpope/vim-abolish'
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'azabiong/vim-board'
Plug 'jlanzarotta/bufexplorer'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'tsandall/vim-rego'

" Theme
Plug 'lunacookies/vim-colors-xcode'

" Rainbow
let g:rainbow_active = 1

" Copilot
Plug 'github/copilot.vim'
Plug 'DanBradbury/copilot-chat.vim'

call plug#end()

" Theme
colorscheme xcode

" Buf Explor
nnoremap ls :BufExplorer<CR>

" Vim Board
let BoardPath = '~/.vim/after/vim-board'
nmap ln <Plug>(BoardMenu)

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
autocmd bufnewfile *.js,*.c,*.ts,*.go,*.h,*.cpp,*.cc,*.java,*.tsx so ~/.dotfiles/.headers/src_header.txt
autocmd bufnewfile *.js,*.c,*.ts,*.go,*.h,*.cpp,*.cc,*.java,*.tsx exe "1," . 8 . "g/* File Name :.*/s//* File Name : " .expand("%")
autocmd bufnewfile *.js,*.c,*.ts,*.go,*.h,*.cpp,*.cc,*.java,*.tsx exe "1," . 8 . "g/* Creation Date :.*/s//* Creation Date : " .strftime("%d-%m-%Y")

" Move lines around
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" Nerd Tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <Tab> :NERDTreeFind<CR>:tabn<CR>:redraw<CR>
nnoremap <S-Tab> :NERDTreeToggle<CR>:wincmd p<CR>
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,*.swo,*.git,*.gitignore,*.gitmodules,*.gitattributes,*.gitkeep,*.yarn,*node_modules*,*.gem,*.bundle
let NERDTreeRespectWildIgnore=1
let NERDTreeShowHidden=1
let g:NERDTreeMinimalMenu=1

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
nnoremap <silent> <C-x> :CtrlPBuffer<CR>
command Bd :up | %bd | e#

" Sideways
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

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
\   'python': ['yapf', 'ruff_format', 'autoimport', 'pycln', 'pyflyby', 'isort'],
\   'go': ['gofmt', 'goimports', 'golines', 'golangci_lint', 'gopls'],
\   'css':['prettier'],
\   'less':['prettier'],
\   'scss':['prettier'],
\   'json':['prettier'],
\   'graphql':['prettier'],
\   'markdown':['prettier'],
\   'vue':['prettier'],
\   'html':['prettier'],
\   'xml':['xmllint'],
\   'kotlin':['ktlint'],
\   'rust':['rustfmt'],
\   'proto':['protolint']
\}
let g:ale_linters = {
\   'java':['eclipselsp', 'google_java_format'],
\   'cpp':['ccls'],
\   'kotlin':['languageserver'],
\   'python': ['jedils', 'ruff', 'pylint'],
\   'xml': ['xmllint'],
\   'go': ['gofmt', 'golint', 'gopls', 'govet', 'golangci-lint'],
\   'rust': ['cargo', 'rls', 'rustfmt'],
\   'proto': ['protolint', 'protoc-gen-lint']
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" Set the max-len for different languages
let g:ale_go_golines_options = '--max-len=100'

" ALE XML Settings
let g:ale_xml_xmllint_indentsize = 4

" ALE Java settings
let g:ale_java_eclipselsp_path = '$HOME/.config/coc/extensions/coc-java-data/server'
let g:ale_java_eclipse_config_path = '$HOME/.config/coc/extensions/coc-java-data/server/config_mac'
let g:ale_java_eclipselsp_javaagent = '/Users/jdiaconu/.java/lombok.jar'

" ALE C++ Settings
let g:ale_cpp_ccls_init_options = {}

" ALE Toggle Fix on save
command! Toggle call s:ale_toggle('buffer')

" Copilot
nnoremap <Leader>c :CopilotChatOpen<CR>
vmap <Leader>a <Plug>CopilotChatAddSelection

function! s:ale_toggle(...)
    let s:fckALEStatus = {}
    let s:fckALEStatus['global'] = get(g:, 'ale_fix_on_save', 0)
    let s:fckALEStatus['buffer'] = get(b:, 'ale_fix_on_save', s:fckALEStatus['global'])
    let s:fckCurrentScope = get(a:, 1, 'global')
    if (s:fckALEStatus[s:fckCurrentScope] == 1)
        let s:fckALEStatus[s:fckCurrentScope]=0
    else
        let s:fckALEStatus[s:fckCurrentScope]=1
    endif
    let g:ale_fix_on_save=s:fckALEStatus['global']
    let b:ale_fix_on_save=s:fckALEStatus['buffer']
endfunction

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
\   'coc-jedi',
\   'coc-clangd',
\   'coc-java',
\   'coc-xml',
\   'coc-kotlin',
\   'coc-markdownlint',
\   'coc-rls'
\]

" Vim Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Fugitive
command! Diff call s:view_git_history()

" Send to jira
xnoremap jr <esc>:!rm /tmp/jira <esc>:'<,'>w /tmp/jira <esc>:!create_jira /tmp/jira<CR>

function! s:view_git_history() abort
  " Disable auto insertion of headers
  autocmd! BufNewfile

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

" Livedown MD Preview
nmap nm :LivedownToggle<CR>

" COC Autocomplete
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Remaps
nnoremap <C-e> <C-u>
nnoremap gr :grep! -RI --exclude-dir=.ccls-cache --exclude-dir=.cache --exclude-dir=.ccls --exclude-dir=build --exclude-dir=node_modules --exclude-dir=.yarn --exclude-dir=vendor --exclude-dir=build --exclude-dir=public --exclude-dir=.git --exclude=tags --exclude-dir=.metadata <cword> .<CR> :botright copen<CR>
nnoremap gf :ALEFindReferences.<CR>
nnoremap gd :ALEGoToDefinition.<CR>
nnoremap gh :0Gclog<CR>
nnoremap gj :Gdiffsplit<CR>
nnoremap gv :ALEGoToDefinition -vsplit<CR>
" Reselect pasted text
nnoremap gp `[v`]

" Tmux Navigation
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
