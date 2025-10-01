" Vim-plug {{{
" Install vim-plug if we don't arlready have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Fuzzy finder -- must have
Plug 'ctrlpvim/ctrlp.vim'

" numbertoggle
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module /
" CLI script 'ack'
Plug 'rking/ag.vim'             " http://github.com/rking/ag.vim

" rails.vim: Ruby on Rails power tools
Plug 'tpope/vim-rails'

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'

" Vim plugin for running ruby test
" https://github.com/skalnik/vim-vroom.git
Plug 'https://github.com/skalnik/vim-vroom.git'

" Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" A Vim plugin which shows a git diff in the gutter (sign column) and
" stages/reverts hunks.
Plug 'airblade/vim-gitgutter'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" Adds closing block keywords
Plug 'tpope/vim-endwise'

" Vim commit plugin
Plug 'rhysd/committia.vim'

" A solid language pack for Vim
Plug 'sheerun/vim-polyglot'

" Lean & mean status/tabline for vim that's light as ai
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorschemes {{{

" a ton of color schemes
" https://github.com/flazz/vim-colorshcemes#current-colorschemes
" Plug 'flazz/vim-colorschemes'
" Plug 'morhetz/gruvbox'
Plug 'https://github.com/duythinht/inori.git'

" }}}

" Include user's local vim-plugin file
if filereadable(expand("~/vim-plugins.local"))
    source ~/vim-plugins.local
endif

call plug#end()
" }}}

" If you installed powerline via the Pip utility then this line is sufficient
" see https://powerline.readthedocs.org/en/latest/installation/osx.html for
" details
" source /usr/local/lib/python3.8/site-packages/powerline/bindings/vim/plugin/powerline.vim

" Plugin settings:
" Below are some sane defaults for a couple of the above plugins

" Airline {{{
" ===
let g:airline_powerline_fonts = 1
let g:airlinetheme = "solarized"
" }}}

" NERDCommenter {{{
let g:NERDCreateDefaultMappings = 0
let g:NERDCustomDelimiters = {
 \ 'ruby': { 'left': '# ' },
 \ 'vim': { 'left': '" ' },
 \ 'scss': { 'left': '// ', 'right': '' },
 \ 'javascript': { 'left': '// ', 'right': '' }
 \ }
xmap <Leader>cc <plug>NERDCommenterToggle
nmap <Leader>cc <plug>NERDCommenterToggle
" }}}

" Ctrl-P {{{
" Remap ctrlp to ctrl-t - map however you like, but this is common to Atom
" sublime, and textmate for fuzzy search
let g:ctrlp_map = '<c-t>'
map <leader>t <c-t>
map <leader>bu :CtrlPBuffer<cr>

" let ctrlp have up to 30 results
let g:ctrlp_max_height = 30
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"}}}

" Fugitive {{{
" Map commands to keyboard
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gc :Gcommit<CR>
" }}}

" AG {{{
" configure ag.vim to always search from your project root instead of
" current working directory
let g:ag_working_path_mode="r"

nnoremap <leader>a :Ag<space>
" }}}

" Include user's local vim-plugin-mappings file
if filereadable(expand("~/vim-plugin-mappings.local"))
    source ~/vim-plugin-mappings.local
endif

" vim:foldmethod=marker:foldlevel=0
