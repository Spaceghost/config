set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'

Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'
Plugin 'vimwiki'
Plugin 'git://git.wincent.com/command-t.git'

"
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
set number
set list
set lazyredraw
set tags=./tags;/ " exuberant CTags support
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set relativenumber " Show line numbers relative to current line
set nopaste

" Enable syntax folding for blocks and comments.
set foldmethod=syntax
set foldminlines=3
set foldlevel=100

" Convert tabs to spaces, use 2 spaces in place of tabs.
set expandtab
set tabstop=2
set shiftwidth=2

" indentation configuration
set cindent
set smartindent
set autoindent

" text search options
set hlsearch
set incsearch
set ignorecase
set smartcase
"

" place a line at column 80
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" hide buffers instead of closing them when you :q, keeping their undo history
set hidden

" Open new windows on the bottom and right instead of the top and left.
set splitbelow
set splitright

" increase the default command line history
set history=1000

" File name tab completion functions like bash, it gives you a list of
" options instead of automatically filling in the first possible match.
set wildmenu
" It will however, with this option, complete up to the first character of ambiguity.
set wildmode=list:longest

" highlight Pmenu ctermbg=238 gui=bold " improve autocomplete menu color

" scrolls the buffer before you reach the last line of the window
set scrolloff=5

" Always show status line
set laststatus=2

" default encoding
set encoding=utf-8

" sets backspace key functions, allows it to backspace over end of line
" characters, start of line, and indentation
set backspace=indent,eol,start

" enable mouse in console
set mousemodel=extend
set mouse=a
set mousehide

" set the spellcheck language
setlocal spell spelllang=en_us
" disable spellcheck by default
set nospell

" tab navigation like firefox
nmap <C-S-tab> :tabprevious<CR>
nmap <C-tab> :tabnext<CR>
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
imap <C-S-tab> <ESC>:tabprevious<CR>i
imap <C-tab> <ESC>:tabnext<CR>i
nmap <C-t> :tabnew<CR>
imap <C-t> <ESC>:tabnew<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" make mouse scrolling work in vim!!!
map <M-Esc>[62~ <ScrollWheelUp>
map <M-Esc>[63~ <ScrollWheelDown>
map <M-Esc>[64~ <S-ScrollWheelUp>
map <M-Esc>[65~ <S-ScrollWheelDown>
map! <M-Esc>[62~ <ScrollWheelUp>
map! <M-Esc>[63~ <ScrollWheelDown>
map! <M-Esc>[64~ <S-ScrollWheelUp>
map! <M-Esc>[65~ <S-ScrollWheelDown>

" airblade/vim-gitgutter
let g:gitgutter_realtime = 1 " Set to 0 to trade speed for accuracy
let g:gitgutter_eager = 1 " Set to 0 to trade speed for accuracy
map <leader>G :GitGutterToggle<CR> " Pnemonic: Gutter (Toggle)
map <leader>GS :GitGutterSignsToggle<CR> " Pnemonic: Gutter Signs (Toggle)
map <leader>GL :GitGutterLineHighlightsToggle<CR> " Pnemonic: Gutter Lines (Toggle)
nmap <Leader>sh <Plug>GitGutterStageHunk " Pnemonic: Stage Hunk
nmap <Leader>uh <Plug>GitGutterRevertHunk " Pnemonic: Unstage Hunk
nmap <Leader>ph <Plug>GitGutterPreviewHunk " Pnemonic: Preview Hunk

let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_user_mouse = 1
let g:vimwiki_folding = 1
let g:vimwiki_fold_lists = 1
let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_list_ignore_newline = 0
let wiki_1 = {}
let wiki_1.nested_syntaxes = {'python': 'python', 'ruby': 'ruby', 'rails': 'rails', 'yaml': 'yml'}

" Disable balloon popup since there's a plugin that makes it really annoying
if has("balloon_eval")
  set noballooneval
  set balloondelay=100000
end

" Ruby
autocmd BufRead *.rb,*.rake,*.rhtml,<ruby> set isk=?,@,48-57,_,192-255 " Treat question marks as part of a word in ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1


