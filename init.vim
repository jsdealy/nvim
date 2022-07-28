set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'tpope/vim-repeat'
Plugin 'wellle/targets.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-commentary'
Plugin 'gruvbox-community/gruvbox'
Plugin 'junegunn/fzf' 
Plugin 'junegunn/fzf.vim'
Plugin 'SirVer/ultisnips'  
Plugin 'lervag/vimtex'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
  
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" let g:deoplete#enable_at_startup = 1
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set hlsearch
let g:vimtex_quickfix_enabled = 0
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
"
" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'



set incsearch
set nohlsearch
nnoremap <c-h> :set hlsearch!<cr>
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" let g:tex_flavor='latex' " Default tex file format
"
"
" Vimtex setup
let g:vimtex_view_method = 'skim' " Choose which program to use to view PDF file 
let g:vimtex_view_skim_sync = 1 " Value 1 allows forward search after every successful compilation
let g:vimtex_view_skim_activate = 1 " Value 1 allows change focus to skim after command `:VimtexView`
let g:vimtex_toc_todo_labels = {'TODO' : 'TODO: '}
set conceallevel=2
let g:tex_conceal='abdmg'
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
" let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'skim'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
" let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = "¬" 


" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" " Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" " Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" " Plug '~/my-prototype-plugin'
set nu
inoremap jj <Esc>
autocmd FileType tex let b:surround_45 = "\\[ \r \\]"
hi Conceal NONE
set relativenumber

nmap <space> 8<c-e>
nmap <c-space> 8<c-y>
nmap <c-j> o<Esc>k
nmap <c-k> O<Esc>j

set ignorecase
set smartcase
let g:surround_108 = "\\begin{\1environment: \1}\r\\end{\1\1}"
set cursorline
set cursorcolumn
let g:surround_99 = "\\\1command: \1{\r}"

nmap <c-s> :w<CR>:G add -A<CR>
nmap π :G push origin master<CR> 
nmap <c-n> :!now=$(date) ; git commit -m ${now}<CR>
nmap <c-x> :VimtexCountWords<CR>
let g:gruvbox_italic=1
colorscheme gruvbox

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g "" /Users/justindealy/'

set noswapfile
imap <c-del> <esc>dei
let g:snips_author = "Justin Dealy"
let g:vimtex_indent_enabled = 0
let g:vimtex_compiler_latexmk = {'build_dir': {-> join(["/Users/justindealy/Desktop/", expand("%:t:r")], "")}} 

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <c-d> 8j
noremap <c-u> 8k
set spell
<<<<<<< HEAD

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
=======
#testing git
>>>>>>> 78a5f1596d1f8eecf374f50cd5bee02072a26fd3
