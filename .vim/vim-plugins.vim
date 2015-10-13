" Install vim-plug if we don't arlready have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" a ton of color schemes
" https://github.com/flazz/vim-colorshcemes#current-colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'

" Fuzzy finder -- must have
Plug 'ctrlpvim/ctrlp.vim'

" Nerdtree
Plug 'scrooloose/nerdtree'

" numbertoggle
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" status bar plugin
Plug 'bling/vim-airline'

" Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module /
" CLI script 'ack'
Plug 'rking/ag.vim'             " http://github.com/rking/ag.vim

" rails.vim: Ruby on Rails power tools
Plug 'tpope/vim-rails'

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Vim plugin for intensely orgasmic commenting
"Plug 'scrooloose/nerdcommenter'

" dispatch.vim: asynchronous build and test dispatcher
" http://www.vim.org/scripts/script.php?script_id=4504
Plug 'tpope/vim-dispatch'

" Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Run Rspec specs from Vim https://robots.thoughtbot.com
Plug 'thoughtbot/vim-rspec'

" Coffeescript support
Plug 'kchmck/vim-coffee-script'

" A Vim plugin which shows a git diff in the gutter (sign column) and
" stages/reverts hunks.
Plug 'airblade/vim-gitgutter'


" Include user's local vim-plugin file
if filereadable(expand("~/vim-plugins.local"))
    source ~/vim-plugins.local
endif

call plug#end()

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


