local g = vim.g
local api = vim.api
local o = vim.o
local wo = vim.wo
local cmd = vim.cmd

o.inccommand = "nosplit"
o.shell = "zsh"
o.number = true
o.cursorline = true
o.wrap = true
o.syntax = "on"
o.relativenumber = true
o.hlsearch = true
o.hidden = true
o.mouse = "a"
o.autoindent = true
o.clipboard = "unnamedplus"
o.history = 1000
o.background = "dark"
o.ruler = true
o.smarttab = true
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.termguicolors = true
o.updatetime = 250
o.ffs = "unix,dos"
o.cmdheight = 1
o.showmatch = true
o.shortmess = o.shortmess .. "c"
o.signcolumn = "yes"
o.ignorecase = true
o.smartcase = true
o.termguicolors = true
o.completeopt = "menuone,noinsert,noselect"
o.undodir = "/home/ges/.cache/nvim/undo/"
o.backupdir = "/home/ges/.cache/nvim/backup/"
o.directory = "/home/ges/.cache/nvim/swap/"
o.undofile = true
o.backup = true
o.swapfile = false

g.completion_enable_snippet = 'vim-vsnip'
g.markdown_syntax_conceal = 0
g.splitbelow = true
g.indent_blankline_char = "┊"
g.indent_blankline_filetype_exclude = {'help', 'packer'}
g.indent_blankline_buftype_exclude = {'terminal', 'nofile'}
g.indent_blankline_char_highlight = 'LineNr'

local bufferline = {
    icons = true,
    animation = true,
    semantic_letters = true,
    clickable = false,
    letters = 'asdfjkl;ghnmxcbziowerutyqpASDFJKLGHNMXCBZIOWERUTYQP',
    maximum_padding = 4
}

g.bufferline = bufferline
