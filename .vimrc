set nocompatible
filetype off

" Automatic formatting
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.html :%/\s\+$//e
autocmd BufWritePre *.html :%/\s\+$//e
au BufRead,BufNewFile Rakefile setf ruby
au BufRead,BufNewFile Guardfile setf ruby
au BufRead,BufNewFile Gemfile setf ruby
au BufRead,BufNewFile Procfile setf yaml
au BufNewFile,BufRead *.rabl setf ruby
au BufNewFile,BufRead *.rhtml set syn=eruby
au BufNewFile,BufRead *.erb set syn=eruby
au BufNewFile,BufRead *.json setf javascript
au BufNewFile,BufRead *.coffee setf coffee

" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on		" Filetype auto-detection
syntax on 				" Syntax highlighting

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab				" Uses spaces instead of tabs
set smarttab				" let's tab key insert 'tab stops', and bksp deletes tabs
set shiftround				" tab / shifting moves to closest tabstop.
set autoindent				" Match indents on new lines.
set smartindent				" Intelligently dedent / indent new lines based on rules.

set wildmenu                "make tab completion behave like bash
set wildmode=list:longest,full

set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.sw?
set wildignore+=*.DS_Store?
set wildignore+=vendor/bundle
set wildignore+=vendor/gems

" Start scrolling three lines before the horizontal window border 
set scrolloff=3

" We have VCS -- we don't need this
set nobackup				" we have vcs
set nowritebackup			" we have vcs
set noswapfile

" don't nag me when hiding buffers
set hidden				    " allow me to have buffers with unsaved changes
set autoread				" when a file has changed on disk, just load it. Don't ask

" Make search more sane
set ignorecase				" case insensitive search
set smartcase				" If there are uppercase letters, become case-sensitive
set incsearch				" live incremental searching
set showmatch				" live match highlighting
set showcmd                 " show incomplete command
set hlsearch				" hightlight matches
set gdefault				" use the `g` flag by default
set nu                      " show line number
set ruler                   " show row and column number

" allow the cursor to go anywhere in visual block mode
set virtualedit+=block

" leader is a key that allows you to have your own 'namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" So we don't have to reach for escape to leave insert move.
inoremap jf <esc>

" create new vsplit, and switch to it
noremap <leader>v <C-w>v
noremap <leader>s <C-w>s

" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" use sane regex's when searching
nnoremap / /\v
vnoremap / /\v

" clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tabbing
nnoremap <leader><leader> <c-^>

" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that
noremap j gj
noremap k gk

" Plugin settings:
" Below are some sane defaults for a couple of the above plugins

" Remap ctrlp to ctrl-t - map however you like, but this is common to Atom
" sublime, and textmate for fuzzy search
let g:ctrlp_map = '<c-t>'
map <leader>t <c-t>

" let ctrlp have up to 30 results
let g:ctrlp_max_height = 30

" configure ag.vim to always search from your project root instead of
" current working directory
let g:ag_working_path_mode="r"

" RSpec
let g:rspec_command = "Dispatch bundle exec rspec --format=progress {spec}"
map <leader>rf :call RunCurrentSpecFile()<CR>
map <leader>rs :call RunNearestSpec()<CR>
map <leader>rl :call RunLastSpec()<CR>
map <leader>ra :call RunAllSpecs()<CR>

" set the runtime path to include Vundle and intialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" a ton of color schemes
" https://github.com/flazz/vim-colorshcemes#current-colorschemes
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'

" Fuzzy finder -- must have
Plugin 'kien/ctrlp.vim'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" numbertoggle
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

" status bar plugin
Plugin 'bling/vim-airline'

" Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module /
" CLI script 'ack'
Plugin 'ag.vim'             " http://github.com/rking/ag.vim

" rails.vim: Ruby on Rails power tools
Plugin 'tpope/vim-rails'

" surround.vim: quoting/parenthesizing made simple
Plugin 'tpope/vim-surround'

" Vim plugin for intensely orgasmic commenting
"Plugin 'scrooloose/nerdcommenter'

" dispatch.vim: asynchronous build and test dispatcher
" http://www.vim.org/scripts/script.php?script_id=4504
Plugin 'tpope/vim-dispatch'

" Run Rspec specs from Vim https://robots.thoughtbot.com
Plugin 'thoughtbot/vim-rspec'

" Coffeescript support
Plugin 'kchmck/vim-coffee-script'

" A Vim plugin which shows a git diff in the gutter (sign column) and
" stages/reverts hunks.
Plugin 'airblade/vim-gitgutter'

call vundle#end()

" Finally the color scheme
set bg=dark
colorscheme gruvbox

