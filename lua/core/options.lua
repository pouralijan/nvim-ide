local opt = vim.opt

-- Tap / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.hlsearch = true

-- Appearance
opt.relativenumber = true
opt.termguicolors = true

opt.colorcolumn = '80,100,120'
opt.signcolumn = 'yes'
opt.cmdheight = 2
opt.scrolloff = 10
opt.completeopt = { "menuone", "noinsert", "noselect" }


-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse = ""
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"

-- Other
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.pumheight = 10
opt.showmode = true
opt.showtabline = 2
opt.smartcase = true
opt.timeoutlen = 1000
opt.updatetime = 300
opt.writebackup = false
opt.cursorline = true
opt.number = true
opt.numberwidth = 4
opt.sidescrolloff = 8
