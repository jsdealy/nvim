set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" Plugin 'mzlogin/vim-markdown-toc'
Plugin 'mfussenegger/nvim-dap'	
Plugin 'neoclide/coc.nvim'
Plugin 'machakann/vim-highlightedyank'
Plugin 'ajorgensen/vim-markdown-toc'
Plugin '907th/vim-auto-save'  
Plugin 'jacoborus/tender.vim'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'tpope/vim-repeat'
Plugin 'wellle/targets.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'itchyny/lightline.vim'
" Plugin 'nvim-lualine/lualine.nvim'
Plugin 'tpope/vim-fugitive'
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
let g:vimtex_quickfix_enabled = 0
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
"
let g:vim_markdown_auto_insert_bullets = 0 
" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<c-c>'
let g:UltiSnipsJumpForwardTrigger = '<c-f>'
let g:UltiSnipsJumpBackwardTrigger = '<c-m-f>'

imap <HOME> <Esc>Ea
inoremap <c-e> <Esc>Ea
imap <c-a> <Esc>A


set shiftwidth=4

source $HOME/.config/nvim/plug-config/coc.vim

set incsearch
set nohlsearch


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" let g:tex_flavor='latex' " Default tex file format
"
"
" Vimtex setup
let g:vimtex_view_method = 'zathura' " Choose which program to use to view PDF file 
" let g:vimtex_view_okular_sync = 1 " Value 1 allows forward search after every successful compilation
" let g:vimtex_view_okular_activate = 1 " Value 1 allows change focus to skim after command `:VimtexView`
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
let g:vimtex_view_general_viewer = 'zathura'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
" let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = "\\" 


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
inoremap <c-l> <Esc>
autocmd FileType tex let b:surround_45 = "\\[ \r \\]"
hi Conceal NONE
set relativenumber

nnoremap <PageUp> <s-m><c-u>
nnoremap <PageDown> <s-m><c-d>
nmap <c-m-j> 3j
nmap <c-m-k> 3k
nnoremap <c-d> 4<c-d>
nnoremap <c-u> 4<c-u>
nmap <space> 5<c-e>
nmap <c-space> 5<c-y>
nmap <c-j> o<Esc>k
nmap <c-k> O<Esc>j
nmap <c-l> <c-j><c-k>
nmap  i<cr>
nmap <leader><cr> }<c-j>k/^\s*$<cr>i<cr>- 
nmap <leader><leader><cr> }<c-j>k/^\s*$<cr>i<c-space>> 
imap <leader><cr> <esc><leader><cr>
imap <leader><leader><cr> <esc><leader><leader><cr>
imap <c-space> <space><space>
nmap <c-h> %
imap <c-h> %
vmap <c-h> %

nmap <F2> :vimgrep /#\{1,}\s/ %<cr>:cope<cr>
nmap <F3> :cclo<cr>
nmap <F4> :MarkdownPreview<cr>
nmap <F5> :CocDisable<cr>
nmap <F6> :CocEnable<cr>
nnoremap <F7> :set hlsearch!<cr>
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
nmap <F11> :bp<cr>
nmap <F12> :bn<cr>
imap <F11> <esc>:bp<cr>
imap <F12> <esc>:bn<cr>

set ignorecase
set smartcase
let g:surround_108 = "\\begin{\1environment: \1}\r\\end{\1\1}"
set cursorline
set cursorcolumn
let g:surround_99 = "\\\1command: \1{\r}"
" let g:surround_96 = "`\r'"



nmap <c-s> :w<CR>
nmap <c-n><c-n><c-n> :G add -A<CR>
nmap <c-n><c-n> :G push origin master<CR> 
nmap <c-n> :!now=$(date) ; git commit -m ${now}<CR>
nmap <c-x> :VimtexCountWords<CR>

let g:gruvbox_italic=1
colorscheme tender
highlight Comment ctermfg=green
set fillchars+=vert:*
hi VertSplit ctermbg=darkgrey
hi VertSplit ctermfg=black
highlight markdownItalic cterm=italic
highlight Comment cterm=bolditalic
highlight markdownH1 cterm=bolditalic
highlight htmlH1 cterm=bolditalic
let g:auto_save=1
set updatetime=3000

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g "" /home/justin/'

set noswapfile
let g:snips_author = "Justin Dealy"
let g:vimtex_indent_enabled = 0
let g:vimtex_compiler_latexmk = {'build_dir': {-> join(["/home/justin/Documents/", expand("%:t:r")], "")}} 

<<<<<<< HEAD
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <c-d> 8j
noremap <c-u> 8k
set spell

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
let g:vimspector_base_dir='/home/justin/.vim/bundle/vimspector'
vmap ( <esc>o)<esc>kO(<esc>jI<tab><tab><esc>A
vmap { <esc>o}<esc>kO{<esc>jI<tab><tab><esc>A
" noremap <c-e> 3j
" noremap <c-y> 3k
" set spell

set statusline=%F%r%h%w%=\ %y\ %04l,%04v\ %p%%\ %L
hi StatusLine ctermbg=darkblue
hi StatusLine ctermfg=yellow
hi StatusLine cterm=italic
hi StatusLineNC ctermbg=darkgrey
hi StatusLineNC ctermfg=173
hi StatusLineNC cterm=italic
set signcolumn=no
hi Normal ctermbg=234
hi ModeMsg ctermbg=yellow
hi ModeMsg ctermfg=red
hi MoreMsg ctermbg=yellow
hi MoreMsg ctermfg=red
set guicursor=i:block-Cursor
let g:highlightedyank_highlight_duration = 50
match todo /FUNCTION/
>>>>>>> thinkpad
