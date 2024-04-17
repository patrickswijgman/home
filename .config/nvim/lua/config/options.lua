-- disable the mouse
vim.opt.mouse = ""

-- spot the cursor more easily by highlighting the current line
vim.opt.cursorline = true

-- show a "max line length" column
vim.opt.colorcolumn = "120"

-- show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- make sure the cursor stays in the center of the screen when scrolling
vim.opt.scrolloff = 9999

-- enable the sign column on the left to show things like warning and errors symbols
vim.opt.signcolumn = "yes"

-- search settings
vim.opt.showmatch = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- default indentation settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- use system clipboard
-- vim.opt.clipboard = "unnamedplus"

-- keep undos between sessions, in case I accidentally close the editor for example
vim.opt.undofile = true

-- disable swap file, it's annoying
vim.opt.swapfile = false
vim.opt.backup = false

-- change default splitting behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- update time for CursorHold autocommand event
vim.opt.updatetime = 50

-- enable 24-bit RGB colors, requires compatible terminal
vim.opt.termguicolors = true

-- spell checking
-- ]s will go to the next misspelled word.
-- [s will go to the previous misspelled word.
-- zg add word to dictionary
-- z= will open the list of suggestions for the misspelled word
-- :spellr will apply previous applied suggestion in the whole file
vim.opt.spell = true
vim.opt.spelllang = "en_us"
