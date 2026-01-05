local opt = vim.opt

-- Tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- Splits
opt.splitright = true

-- Global
opt.incsearch = true
opt.hidden = true
opt.autoread = true
opt.visualbell = false
opt.ttyfast = true
opt.relativenumber = true

opt.suffixes = ".bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.out,.toc,.swn,.swo"

-- Display
opt.ruler = true
opt.textwidth = 0
opt.backspace = "indent,eol,start"
opt.showmatch = true
opt.showmode = true
opt.showcmd = true
opt.colorcolumn = "100"

-- Search
opt.smartcase = true
opt.infercase = true
opt.hlsearch = true
opt.showfulltag = true

-- Wildmenu
opt.wildmode = "longest:full"
opt.wildmenu = true
opt.wildignore = "*.o,*.a,*.so,*.ko,*~,*.swp,*.pyc,*.dll,tags,*.o.*,*.swo,*.swn,*.log,.git/,.hg/,.svn/,build/"

-- Indentation markers
opt.list = true
opt.listchars = {
  tab = ">-",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "⣿",
}

opt.encoding = "utf-8"
opt.tags = "tags"

-- Clipboard
opt.clipboard = "unnamedplus"
