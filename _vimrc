"Changes Leader key into a comma instead of a backslash
let mapleader=","           

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4 "tab = 4 space
set shiftwidth=2 "indent to 4 space
set softtabstop=4
set expandtab
set noshiftround

set autoindent "Autoindent

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" copy & paste
" inoremap <C-v> <ESC>"+pa
" vnoremap <C-c> "+y
" vnoremap <C-d> "+d

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:?\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized 

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"------------------------------------------------------------
"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vimfiles/plugged')

" php-vim
Plug 'StanAngeloff/php.vim'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"git wrapper
Plug 'tpope/vim-fugitive'

" synatx check
Plug 'scrooloose/syntastic'

" Surround.vim is all about 'surroundings': parentheses, brackets, quotes, XML tags, and more.
Plug 'tpope/vim-surround'

" Lean & mean status/tabline for vim that's light as air.
Plug 'bling/vim-airline'

" ctrlp
Plug 'ctrlpvim/ctrlp.vim'

"tagbar
Plug 'majutsushi/tagbar'

"Themes gotham
Plug 'whatyouhide/vim-gotham'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'

"xdebug
" Plug 'vim-vdebug/vdebug'

" Initialize plugin system
call plug#end()

" ------------Plugin Setup-----------------
"
" ---------------ctrlp--------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"Ignore these files when completing names
set wildignore +=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,node_modules/*,*.min.js,*.map

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" ---------php.vim-------------
" Put at the very end of your .vimrc file.

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

"------ override vim setting -------
"------  Behavior  ------
set tabstop=4               "tab = 4 spaces
set shiftwidth=4            "Indent to four spaces
set hidden                  "Switch between unsaved buffers w/o needing to save, preserves history
filetype indent on          "Syntax Highlight
filetype plugin on          "Needed for snipMate
set autoindent              "Autoindent
"set expandtab               "Use spaces instead of tabs
"Ignore these files when completing names
set wildignore +=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,node_modules/*,*.min.js,*.map

"------  Searching  ------
set incsearch               "Search while typing
set ignorecase              "Case Insensitive Searching
set smartcase               "Lowercase = case insensitive, any uppercase = case sensitive
set hlsearch                "Highlight all search results
"Following line clears the search highlights when pressing Lb
nnoremap <leader>b :nohlsearch<CR>
" http://www.vim.org/scripts/script.php?script_id=2572
noremap <leader>a :Ack 
noremap <leader>A <C-w>j<C-w>c<C-w>l
let g:ackprg="ack -H --nocolor --nogroup --column --type-add php=.tpl"

"------  NERDTree Options  ------
let NERDTreeIgnore=['CVS','\.dSYM$']
let NERDTreeChDirMode=2     "setting root dir in NT also sets VIM's cd
"throw a % sign on the end to sync nerdtree to current opened buff
noremap <silent> <Leader>n :NERDTreeToggle %<CR>
" These prevent accidentally loading files while in the NERDTree panel
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>
autocmd vimenter * NERDTree % " Open NERDTree if we're simply launching vim
autocmd vimenter * wincmd p "move cursor into the main window

"------  Buffers  ------
" Ctrl Left & Right move between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>
" Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>

"------  Fugitive  ------ 
"https://github.com/tpope/vim-fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gm :Gmove 
nnoremap <Leader>gp :Ggrep 
nnoremap <Leader>gR :Gread<CR>
nnoremap <Leader>gg :Git 
nnoremap <Leader>gd :Gdiff<CR>

"------  Moving Between Windows  ------
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>wo <C-w>o
nnoremap <Leader>wv <C-w>v<C-w>l
nnoremap <Leader>ws <C-w>s
nnoremap <Leader>ww <C-w><C-w>

" Vim 7.3.1058
" Exuberant Ctags 5.5 or Universal Ctags (recommended), a maintained fork of Exuberant Ctags.
nmap <F8> :TagbarToggle<CR>

"search for visually selected text. http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap // y/<C-R>"<CR>


" Opens an edit command with the path of the currently edited file filled in Normal mode: <Leader>ee
map <Leader>ee :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" ,p = Runs PHP lint checker on current file
map <Leader>p :! php -l %<CR>
" ,P = Runs PHP and executes the current file
map <Leader>P :! php -q %<CR>
" ,L = Toggle line numbers
map <Leader>L :set invnumber<CR>
" ,v = Paste
map <Leader>v "+gP
" ,c = Copy
map <Leader>c "+y

if has("gui_running")
    set cursorline                  "Highlight background of current line
    "autocmd VimEnter * TagbarOpen

    "----color theme-----
	"colorscheme desert
	"colorscheme github
	"colorscheme Mustang             "This theme works great in 256 colors
	"set background=light
    "colorscheme gotham
    colorscheme gruvbox

    " Show tabs and newline characters with ,s
    nmap <Leader>s :set list!<CR>
	set listchars=tab:¿\ ,trail:·,extends:¿,precedes:¿,nbsp:×,eol:¬
    "Invisible character colors
    highlight NonText guifg=#4a4a59
    highlight SpecialKey guifg=#4a4a59

	" Ctrl + Shift + C and Ctrl + Shift + V for copying and pasting OS Buffer
	" Vim can't do Ctrl + Shift :'(
	" which means C-V overwrites visual select (C-v)
	"map <C-C> "+y
	"map <C-V> "+gp
else
    "colorscheme Mustang             "This theme works great in 256 colors
    "colorscheme desert             "This theme works great in 256 colors
    "colorscheme gotham
    colorscheme gruvbox
	set mouse=a						"This allows mouse scrolling in terminal, and selection of text
    " Color scheme (terminal)
    set t_Co=256
    set background=dark
    "let g:solarized_termcolors=256
    "let g:solarized_termtrans=1
endif
