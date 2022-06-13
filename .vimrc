filetype indent plugin on

set scrolloff=4

"number of visual spaces per tab
set tabstop=2

set shiftwidth=2
set autoindent
set smartindent
"turn tabs into spaces
set expandtab

"show command in bottom bar
set showcmd

"number of spaces in tab when editing
set softtabstop=2

"disable word wrap
set nowrap

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" Show fold markers
set foldcolumn=1

colorscheme onedark


"vim-plug plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cakebaker/scss-syntax.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'ap/vim-css-color'
call plug#end()

" HTML Tag Auto Complete settings
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" end HTML Auto Complete Settings

"rainbow brackets settings
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd VimEnter * RainbowParentheses

"set up :Prettier command
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

"let g:prettier#exec_cmd_path = '/Users/workbook0/.vim/plugged/vim-prettier/node_modules/prettier'
"~/.vim/plugged/vim-prettier/plugin/prettier.vim:"

"prettier autoformat when .pretterrc  present
"let g:prettier#autoformat_config_present = 1

"prettier turn off require @format or @prettier tag to format '
"let g:prettier#autoformat_require_pragma = 0

"A list containing all config file names to search for when using the g:prettier#autoformat_config_present option."
"let g:prettier#autoformat_config_files = ['.prettierrc.json']

"prettier auto format on save
let g:prettier#autoformat = 1

"prettier only run prettier if config file present
"let g:prettier#autoformat_config_present = 1

" Use <Ctrl-F> to format documents with prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
noremap <C-F> :Prettier<CR>

map <C><left> :tabp<cr>
map <C><right> :tabn<cr>
" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).

" Save folds on editor exit
au BufWinLeave * mkview
au BufWinEnter * silent loadview

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" my remaps
let mapleader = " "
nnoremap <leader>b :Vex<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>

" to make coc.nvim format your code on <cr>:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"auto colse brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O



" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
