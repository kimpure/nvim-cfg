set shadafile=NONE
set clipboard=unnamedplus
set termguicolors
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set nowrap
set incsearch
set ignorecase
set smartcase
set noequalalways
set number
set relativenumber
set encoding=UTF-8
set cmdheight=1
set scrolloff=10
set mouse+=a
set laststatus=2
set fileformat=unix
set fileformats=unix
set updatetime=500
set noshowmatch
set noswapfile
set cursorline
set cmdheight=0
set background=dark

if has("win32") || has("win64")
    set shell=C:\\windows\\system32\\windowspowershell\\v1.0\\powershell.exe
    set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
    set shellquote=
    set shellxquote=
endif
