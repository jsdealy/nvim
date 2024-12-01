set nocompatible              " be iMproved, required
filetype off                  " required

" " Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" " - https://github.com/Valloric/YouCompleteMe
" " - https://github.com/nvim-lua/completion-nvim
" let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""
"  Ultisnips Setup  "
"""""""""""""""""""""
let g:UltiSnipsExpandTrigger = "<C-CR>"
let g:UltiSnipsJumpForwardTrigger = '<C-S-Space>'
" let g:UltiSnipsJumpBackwardTrigger = '<C-BS>'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
imap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "<CR>"



""""""""""""""""""
"  vimtex setup  "
""""""""""""""""""
let g:vimtex_syntax_conceal_disable = 1
let g:vimtex_quickfix_enabled = 0
" let g:tex_flavor='latex' " Default tex file format
" let g:vimtex_view_method = 'general' " Choose which program to use to view PDF file 
" let g:vimtex_view_okular_sync = 1 " Value 1 allows forward search after every successful compilation
" let g:vimtex_view_okular_activate = 1 " Value 1 allows change focus to skim after command `:VimtexView`
let g:vimtex_toc_todo_labels = {'TODO' : 'TODO'}
" let g:tex_conceal='abdmg'
" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'
" Or with a generic interface:
let g:vimtex_view_general_viewer = 'zathura'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on
" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = "\\" 
" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
" syntax enable
" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
" let g:vimtex_compiler_method = 'latexrun'
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




""""""""""""""
"  Settings  "
""""""""""""""
let g:ctrlp_cmd = 'CtrlPBuffer'

let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.6 * &columns)),
            \ 'height': float2nr(round(0.6 * &lines)),
            \ 'col': float2nr(round(0.15 * &columns)),
            \ 'row': float2nr(round(0.15 * &lines)),
            \ }
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" This is necessary for luaSeek() and luaRevSeek() handling of brackets on
" line endings
set virtualedit=onemore

let $papers = '/home/justin/Insync/dealyjustins@gmail.com/Google Drive/papers/'
" autocmd FileType c colorscheme torte
set signcolumn=yes
set incsearch
set nohlsearch
set nu
set relativenumber
" autocmd FileType markdown colorscheme kanagawa-wave
" autocmd FileType c highlight Comment gui=bolditalic
" autocmd FileType tex set tw=47
" autocmd FileType markdown set tw=47
set ignorecase
set smartcase
set cursorline
" set cursorcolumn
let g:surround_99 = "\\\1command: \1{\r}"
" let g:surround_96 = "`\r'"
let g:surround_108 = "\\begin{\1environment: \1}\r\\end{\1\1}"
" nmap <c-n><c-n><c-n> :G add -A<CR>
" nmap <c-n><c-n> :G push origin master<CR> 
" nmap <c-n> :!now=$(date) ; git commit -m ${now}<CR>
" nmap <c-x> :VimtexCountWords<CR>
let g:auto_save=1
set updatetime=3000
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g "" /home/justin/'
set nrformats+=alpha
set noswapfile
let g:snips_author = "Justin Dealy"
let g:vimtex_indent_enabled = 0
" let g:vimtex_compiler_latexmk = {'build_dir': {-> join(["/home/justin/Documents/", expand("%:t:r")], "")}} 
let g:vimspector_base_dir='/home/justin/.vim/bundle/vimspector'
" vmap ( <esc>o)<esc>kO(<esc>jI<tab><tab><esc>A
" vmap { <esc>o}<esc>kO{<esc>jI<tab><tab><esc>A
" let g:gruvbox_italic=1
" colorscheme tender
colorscheme torte
" colorscheme elflord
" highlight Comment ctermfg=209
" set fillchars+=vert:*
set fillchars=stlnc:―
hi VertSplit guibg=#000000
highlight markdownBold gui=bold
highlight markdownItalic gui=italic
highlight markdownH1 gui=bolditalic
hi Function gui=bold
highlight htmlH1 gui=bolditalic
set statusline=%F%r%h%w%=\ %y\ %04l\ %04v\ %p%%\ %L

" hi Comment gui=italic 
hi Visual guibg=#008565
hi StatusLine ctermbg=236
hi StatusLine ctermfg=218
hi StatusLine gui=italic
hi StatusLineNC ctermbg=darkgrey
hi StatusLineNC ctermfg=173
hi StatusLineNC gui=italic
" hi Normal ctermbg=234
hi CursorLine guibg=#111111
hi CursorLineNR guibg=#111111
hi ModeMsg ctermbg=yellow
hi ModeMsg ctermfg=red
hi MoreMsg ctermbg=yellow
hi MoreMsg ctermfg=red
" set guicursor=i:block-Cursor
hi Conceal NONE

"""""""""""""""""""
"  Main Mappings  "
"""""""""""""""""""
nmap <s-m> :ccl<cr>
nmap <c-s-m> :cope<cr>
nmap <leader>m :cfile errors.txt<cr>
autocmd User targets#mappings#user call targets#mappings#extend({'?': {'pair': [{'o': '?', 'c': '?'}]}})
nmap <leader><leader>= :res +10<cr>
nmap <leader><leader>- :res -10<cr>
inoremap <c-e> <esc>Ea
imap <tab> <tab>
vmap <c-i> :!pipeToInvert.sh<cr>
imap <c-f> <esc>la
imap <c-b> <esc>i
" imap <c-c> <esc>la
" imap <c-y> <c-o>diw
nmap <c-s-j> vipJ
vnoremap d "ad
nmap <leader>p "ap
nmap <leader><s-p> "aP
nmap <leader><leader><leader> gw
vmap <leader><leader><leader> gwzz
nmap <c-n> A
imap <c-n> <esc>A
imap <c-i> <esc>I
nmap <c-s-y> :%y *<cr>
imap <c-s-y> <esc>:%y *<cr>
vmap <c-s-y> :y *<cr>
map <leader><leader>F <esc>:FZF<cr>
" nmap <s-tab> @
vmap <leader>y "*y
set shiftwidth=4
nmap gf yy:!rifle "<c-r>""<cr><cr>
inoremap <c-l> <Esc>
" nnoremap <PageUp> <s-m><c-u>
" nnoremap <PageDown> <s-m><c-d>
nmap <c-m-j> 3j
nmap <c-m-k> 3k

" TROUBLE
nnoremap <leader><leader>t <cmd>Trouble diagnostics toggle focus=true<cr>
nnoremap <leader>xw <cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>
nnoremap gR <cmd>Trouble lsp toggle focus=true<cr>
nmap <leader><leader>z zz
nmap <leader><tab> zz
nnoremap <c-d> 5<c-d>
nnoremap <c-u> 5<c-u>
vnoremap <c-d> 2<c-d>
vnoremap <c-u> 2<c-u>
nmap <space> 5<c-e>
nnoremap <c-space> 5<c-y>
nmap <c-j> o<Esc>k
nmap <c-k> O<Esc>j
nmap <c-l> <c-j><c-k>
" nmap  i<cr>
nmap <leader>e :e!<cr>
imap <leader><cr> <esc><leader><cr>
imap <leader><leader><cr> <esc><leader><leader><cr>
imap <c-h> %
nmap <c-h> %
vmap <c-h> %
nmap <c-F> $
nmap <c-B> 0
vmap <c-F> $
vmap <c-B> 0
inoremap <c-space> <space><space>
nmap <c-s> :w<cr>
nnoremap <c-o> <c-o>zz
nnoremap <c-i> <c-i>zz
nmap <PageDown> :cnext<cr>zz
nmap <PageUp> :cprev<cr>zz
nnoremap n nzz
nnoremap N Nzz
nmap <leader><leader>s :browse old<cr>
nmap <c-'> i<space><Esc>la<space><Esc>h
nmap <c-,> A,<esc>
imap <c-,> <esc><c-,>
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv
imap <C-S-Space> <c-o>x
nnoremap S ciw
nnoremap X diw
nmap <leader><leader>c Onewcomment <esc>:call UltiSnips#ListSnippets()<cr>1<cr>
imap <leader><leader>c <esc><leader><leader>c
autocmd FileType text nnoremap <leader><leader>c Onewtextcomment <esc>:call UltiSnips#ListSnippets()<cr>1<cr>
autocmd FileType text imap <leader><leader>c <esc><leader><leader>c
autocmd FileType markdown lua require('pandocomatic')
autocmd FileType markdown imap <leader><leader>p :lua Pandocomatic()<cr>
autocmd FileType markdown nmap <leader><leader>p :lua Pandocomatic()<cr>
autocmd FileType markdown nmap <leader><leader><leader>p :lua Pandocomatic{justopensioyek=true}<cr>
autocmd FileType markdown imap <leader><leader>P :lua Pandocomatic{push=true}<cr>
autocmd FileType markdown nmap <leader><leader>P :lua Pandocomatic{push=true}<cr>
autocmd FileType tex lua require('pandocomatic')
autocmd FileType tex imap <C-S-k> <esc>:lua Pandocomatic{latex=true}<cr>
autocmd FileType tex nmap <C-S-k> :lua Pandocomatic{latex=true}<cr>
autocmd FileType tex nmap <leader><leader><leader>p :lua Pandocomatic{latex=true, justopensioyek=true}<cr>
autocmd FileType tex let b:surround_45 = "\\[ \r \\]"
autocmd FileType cpp nmap <C-S-k> :!make<cr>
lua require('quickgit')
lua require('lightmode')
lua require('darkmode')
lua require('fixOutlineTrigger')
command LightMode lua Lightmode()
command DarkMode lua Darkmode()
command ToggleOutlineHotkey lua ToggleOutlineHotkey()




""""""""""""""""""""""""""""""""
"  Filetype-Specific Mappings  "
""""""""""""""""""""""""""""""""
autocmd FileType c nmap <c-;> <c-n>;<esc>
autocmd FileType c imap <c-;> <esc><c-;>
autocmd FileType lua nmap <c-;> <c-n>;<esc>
autocmd FileType lua imap <c-;> <esc><c-;>
autocmd FileType html nmap <c-;> <c-n>;<esc>
autocmd FileType javascript nmap <c-;> <c-n>;<esc>
autocmd FileType typescript nmap <c-;> <c-n>;<esc>
autocmd FileType php nmap <c-;> <c-n>;<esc>
autocmd FileType php imap <c-;> <esc><c-;>
autocmd FileType html imap <c-;> <esc><c-;>
autocmd FileType typescript imap <c-;> <esc><c-;>
autocmd FileType javascript imap <c-;> <esc><c-;>
autocmd FileType c nmap <c-h> %
autocmd FileType cpp nmap <c-;> <c-n>;<esc>
autocmd FileType php nmap <c-;> <c-n>;<esc>
autocmd FileType cpp imap <c-;> <esc><c-;>
autocmd FileType cpp imap <C-S-;> ::

autocmd FileType cpp nmap <C-0> :!geeks.py "<cword> c++ cpp"<cr><cr>
autocmd FileType cpp nmap <C-9> :!FL.py "<cword> site:cppreference.com"<cr><cr>
autocmd FileType c imap <c-z> '\0'
autocmd FileType python nmap <c-;> <c-n>:<esc>
autocmd FileType python nmap <s-k> :!searchPythonDocs.sh "<cword>"<cr><cr>
autocmd FileType javascript nmap <s-k><s-k> :!searchMDNjavascript "<cword>"<cr><cr>
autocmd FileType javascript vmap <s-k><s-k> :!searchMDNjavascript "<cword>"<cr><cr>
autocmd FileType javascript vmap <s-k> :!FL.py "<cword> site:api.jquery.com"<cr><cr>
autocmd FileType javascript nmap <s-k> :!FL.py "<cword> site:api.jquery.com"<cr><cr>
autocmd FileType javascript nmap <s-k><s-k><s-k> :!FL.py "<cword> site:https://nodejs.org/en/docs"<cr><cr>
autocmd FileType javascript vmap <s-k><s-k><s-k> :!FL.py "<cword> site:https://nodejs.org/en/docs"<cr><cr>
autocmd FileType javascript nmap <s-k><s-k><s-k><s-k> :!FL.py "<cword> https://expressjs.com/en/4x/api.html"<cr><cr>
autocmd FileType javascript vmap <s-k><s-k><s-k><s-k> :!FL.py "<cword> https://expressjs.com/en/4x/api.html"<cr><cr>
autocmd FileType php nmap <s-k> :!searchPHPdocs "<cword>"<cr><cr>
autocmd FileType php vmap <s-k> :!searchPHPdocs "<cword>"<cr><cr>
autocmd FileType python imap <c-;> <esc><c-;>
autocmd FileType php imap <c-;> <esc><c-;>
" autocmd FileType python nmap <leader><leader>c O# 
" autocmd FileType php nmap <leader><leader>c O//    
" " autocmd FileType python nmap <leader>td O# TODO<esc>:put =strftime('%D %T')<cr>kJA => 
" autocmd FileType cpp nmap <leader><leader>c O/*  */<Esc>hhi
" autocmd FileType c nmap <leader><leader>c O/*  */<Esc>hhi
autocmd FileType c nmap <leader><leader>p Oprintf("At position %i", debugPos++);<Esc>ml
autocmd FileType c nmap <leader>p Oint debugPos = 0;
autocmd FileType markdown nmap <leader><cr> }<c-j>k/^\s*$<cr>i<cr>- 
autocmd FileType markdown nmap <leader><leader><cr> }<c-j>k/^\s*$<cr>i<c-space>> 
" autocmd FileType tex nmap <leader><cr> oitm
" autocmd FileType tex nmap <leader><leader><cr> o<tab>sitm
" autocmd FileType tex nmap <leader>s o<tab>ssitm
autocmd FileType tex vmap <leader>gc c%<c-r>"<cr><esc>
autocmd FileType tex nmap <leader><leader><leader>d :!openInDictionary.sh "<cword>"<cr><cr>
autocmd FileType tex nmap <leader><leader><leader>s :!openInSEP.sh "<cword>"<cr><cr>
autocmd FileType tex nmap <leader><leader><leader>t :!openInThesaurus.sh "<cword>"<cr><cr>
autocmd FileType tex nmap <c-.> <c-n>.<esc>
autocmd FileType tex imap <c-.> <esc><c-.>
autocmd FileType tex nmap <c-,> <c-n>,<esc>
autocmd FileType tex imap <c-,> <esc><c-,>
" autocmd FileType tex vmap <leader>c di<cr>% <esc>pa<cr><esc>k
autocmd FileType c nmap <leader>co :copen<cr>zz
autocmd FileType c nmap <leader>cc :cclose<cr>zz
autocmd FileType c nmap <leader>cn :cnext<cr>zz
autocmd FileType c nmap <leader>cp :cprev<cr>zz
autocmd FileType markdown nmap <F3> /^## <cr>
autocmd FileType markdown nmap <F4> :MarkdownPreview<cr>
" autocmd FileType tex nmap <F4> :VimtexTocToggle<cr>
autocmd FileType c nmap <F2> :Goyo<cr>:hi CursorLine ctermbg=235<cr>:hi CursorLineNR ctermbg=235<cr>:hi Normal ctermbg=234<cr>
autocmd FileType markdown nmap <F5> :!pandoc -f markdown -t pdf -i % -o %.pdf<cr>


function! PMarkdown()
    if &filetype ==# 'markdown'
	!pandoc -f markdown -t pdf -i "%" -o "%.pdf"
    endif 
endfunction


"""""""""""""""""""""""""""""
"  Function Keys Mappings   "
"""""""""""""""""""""""""""""
nmap <F1> :UndotreeToggle<cr>
" nmap <F2> :vimgrep /#\{1,}\s/ %<cr>:cope<cr>
" nmap <F3> :cclo<cr>
nnoremap <F7> :set hlsearch!<cr>
" highlight category checker VVV
" nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
" \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
imap <F11> <esc>:bp<cr>
imap <F12> <esc>:bn<cr>
imap <leader>` <esc>:bn<cr>
nmap <F11> :bp<cr>
nmap <F12> :bn<cr>
nmap <leader>` :bn<cr>
nmap <F9> <Plug>(Marks-prev)
nmap <F10> <Plug>(Marks-next)

""""""""""""""""""""""""""""
"  Needs to be Organized  "
"""""""""""""""""""""""""""
" nmap - @

" let g:highlightedyank_highlight_duration = 50



" harpoon keybinds
nmap <leader>a :lua require("harpoon.mark").add_file()<cr>
nmap <leader><leader>a :lua require("harpoon.ui").toggle_quick_menu()<cr>

nmap <leader>1 :lua require("harpoon.ui").nav_file(1)<cr>
nmap <leader>2 :lua require("harpoon.ui").nav_file(2)<cr>
nmap <leader>3 :lua require("harpoon.ui").nav_file(3)<cr>
nmap <leader>4 :lua require("harpoon.ui").nav_file(4)<cr>
nmap <leader>5 :lua require("harpoon.ui").nav_file(5)<cr>
nmap <leader>6 :lua require("harpoon.ui").nav_file(6)<cr>
nmap <leader>7 :lua require("harpoon.ui").nav_file(7)<cr>

" imap <leader>a <esc>:lua require("harpoon.mark").add_file()<cr>
" imap <leader><leader>a <esc>:lua require("harpoon.ui").toggle_quick_menu()<cr>
" imap <leader>1 <esc>:lua require("harpoon.ui").nav_file(1)<cr>
" map <leader>2 <esc>:lua require("harpoon.ui").nav_file(2)<cr>
" imap <leader>3 <esc>:lua require("harpoon.ui").nav_file(3)<cr>
" imap <leader>4 <esc>:lua require("harpoon.ui").nav_file(4)<cr>
" imap <leader>5 <esc>:lua require("harpoon.ui").nav_file(5)<cr>
" imap <leader>6 <esc>:lua require("harpoon.ui").nav_file(6)<cr>
" imap <leader>7 <esc>:lua require("harpoon.ui").nav_file(7)<cr>

" 
" """"""""""""""""""""
" "  Marks Mappings  "
" """"""""""""""""""""
" 
" nmap <leader><leader>1 <Plug>(Marks-next-bookmark1)zz
" nmap <leader><leader>2 <Plug>(Marks-next-bookmark2)zz
" nmap <leader><leader>3 <Plug>(Marks-next-bookmark3)zz
" nmap <leader><leader>4 <Plug>(Marks-next-bookmark4)zz
" nmap <leader><leader>5 <Plug>(Marks-next-bookmark5)zz
" nmap <leader><leader>6 <Plug>(Marks-next-bookmark6)zz
" nmap <leader><leader>7 <Plug>(Marks-next-bookmark7)zz
" nmap <leader><leader>8 <Plug>(Marks-next-bookmark8)zz
" nmap <leader><leader>9 <Plug>(Marks-next-bookmark9)zz
" nmap <leader><leader>0 <Plug>(Marks-next-bookmark0)zz
" 
" nmap <leader>]1 <Plug>(Marks-prev-bookmark1)zz
" nmap <leader>]2 <Plug>(Marks-prev-bookmark2)zz
" nmap <leader>]3 <Plug>(Marks-prev-bookmark3)zz
" nmap <leader>]4 <Plug>(Marks-prev-bookmark4)zz
" nmap <leader>]5 <Plug>(Marks-prev-bookmark5)zz
" nmap <leader>]6 <Plug>(Marks-prev-bookmark6)zz
" nmap <leader>]7 <Plug>(Marks-prev-bookmark7)zz
" nmap <leader>]8 <Plug>(Marks-prev-bookmark8)zz
" nmap <leader>]9 <Plug>(Marks-prev-bookmark9)zz
" nmap <leader>]0 <Plug>(Marks-prev-bookmark0)zz
" 
" nmap <leader><leader>e <Plug>(Marks-next)zz
" nmap <leader><leader>w <Plug>(Marks-prev)zz
" 
" nmap ml <Plug>(Marks-setnext)
" nmap mm :MarksQFListBuf<cr>
" nmap dmm <Plug>(Marks-deleteline):wshada!<cr>
" nmap dm- <Plug>(Marks-deletebuf):wshada!<cr>

au TextYankPost * silent! lua vim.highlight.on_yank { timeout=50 }
set formatoptions-=cro

" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-B>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ '<C-o>': 'NvimEdit drop',
            \ '<CR>': 'NvimEdit drop',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    LUA                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set runtimepath^=/home/justin/.config/nvim/nvim-treesitter-parsers

lua <<EOF

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
-- vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	{"hrsh7th/cmp-nvim-lsp-signature-help"},
	{"latex-lsp/texlab"},
	{
	  "hedyhli/outline.nvim",
	  config = function()
	    -- Example mapping to toggle outline
	    outline_keyword = "y",
	    vim.keymap.set("n", "<leader>y", "<cmd>Outline<CR>",
	      { desc = "Toggle Outline" }),
	    require("outline").setup {
		outline_window = {
		    width = 50,
		}
	      -- Your setup opts here (leave empty to use defaults)
	    }
	  end,
	},
	{ "folke/neodev.nvim", opts = {} },
	{'junegunn/fzf'},
	-- {"glepnir/lspsaga.nvim",
	    -- event = "LspAttach",
	    -- config = function()
	    -- require("lspsaga").setup({})
	    -- end,
	    -- dependencies = {
		-- {"nvim-tree/nvim-web-devicons"},
		-- --Please make sure you install markdown and markdown_inline parser
		-- {"nvim-treesitter/nvim-treesitter"}
	    -- }
	    -- },
	{ "folke/which-key.nvim" },
	-- {"folke/neoconf.nvim", cmd = "Neoconf" },
	{'kevinhwang91/rnvimr'},
	{'jc-doyle/cmp-pandoc-references'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'pocco81/true-zen.nvim'},
	{'hrsh7th/cmp-buffer'},
	{'hrsh7th/cmp-omni'},
	{'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-cmdline'},
	{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-calc'},
	{'hrsh7th/cmp-nvim-lua'},
	{'windwp/nvim-autopairs'},
	{'tom-anders/telescope-vim-bookmarks.nvim'},
	{'AndrewRadev/splitjoin.vim'},
	{'nvim-lualine/lualine.nvim'},
	{'nvim-telescope/telescope.nvim'},
	-- {'qpkorr/vim-renamer'},
	{'nvim-tree/nvim-web-devicons'},
	{'folke/trouble.nvim',   
	    opts = {}, -- for default options, refer to the configuration section for custom setup.
	    cmd = "Trouble", },
	{'junegunn/vim-easy-align'},
	{'mbbill/undotree'},
	{'sainnhe/everforest'},
	{'sainnhe/edge'},
	{'rebelot/kanagawa.nvim'},
	{'EdenEast/nightfox.nvim'},
	{'catppuccin/nvim'},
	-- {'chentoast/marks.nvim'},
	{'bluz71/vim-moonfly-colors'},
	'nvim-treesitter/nvim-treesitter', build = ":TSUpdate",
	-- {'nvim-treesitter/nvim-treesitter-context'},
	{'tpope/vim-markdown'},
	{'rose-pine/neovim'},
	-- to use titlecase, highlight and hit gz <= 02/17/24 14:22:34 " 
	{'christoomey/vim-titlecase'},
	{'triglav/vim-visual-increment'},
	{'nvim-lua/plenary.nvim'},
	{'ThePrimeagen/harpoon'},
	{'ajorgensen/vim-markdown-toc'},
	{'907th/vim-auto-save'},
	{'jacoborus/tender.vim'},
	{'iamcco/markdown-preview.nvim'},
	{'tpope/vim-repeat'},
	{'wellle/targets.vim'},
	{'ctrlpvim/ctrlp.vim'},
	{'tpope/vim-fugitive'},
	{'tpope/vim-commentary'},
	{'gruvbox-community/gruvbox'},
	{'junegunn/goyo.vim'},
	{'SirVer/ultisnips'},
	{'lervag/vimtex'},
	{'honza/vim-snippets'},
	{'tpope/vim-surround'},
	{'neovim/nvim-lspconfig'},
})



vim.g.mapleader = '\\'

require'nvim-treesitter.configs'.setup {
  vim.opt.runtimepath:append("/home/justin/.config/nvim/nvim-treesitter-parsers"),
  parser_install_dir = "/home/justin/.config/nvim/nvim-treesitter-parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
  -- A list of parser names, or "allg
  ensure_installed = { "php", "http", "python", "c", "cpp", "vimdoc", "markdown", "markdown_inline", "vim", "lua", "css", "html", "rust", "javascript", "java" },
  vim.treesitter.language.register('html', 'hb'),
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,
  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },
  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  indent = {
      enable = true,
  },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be  in grand world situations are probabilitieedisabled
    disable = { "markdown", "vimdoc", "markdown-inline", "latex", "tex", "cpp" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
        -- local max_filesize = 100 * 1024 -- 100 KB
        -- local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        -- if ok and stats and stats.size > max_filesize then
          --   return true
        -- end
    -- end,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
 
-- require'marks'.setup {
--    -- whether to map keybinds or not. default true
--    default_mappings = true,
--    -- which builtin marks to show. default {}
--    builtin_marks = { ".", "<", ">", "^" },
--    -- whether movements cycle back to the beginning/end of buffer. default true
-- 
--    cyclic = true,
--    -- whether the shada file is updated after modifying uppercase marks. default false
--    force_write_shada = false,
--    -- how often (in ms) to redraw signs/recompute mark positions. 
--    -- higher values will have better performance but may cause visual lag, 
--    -- while lower values may cause performance penalties. default 150.
--    refresh_interval = 250,
--    -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
--    -- marks, and bookmarks.
--    -- can be either a table with all/none of the keys, or a single number, in which case
--    -- the priority applies to all marks.
--    -- default 10.
--    sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
--    -- disables mark tracking for specific filetypes. default {}
--    excluded_filetypes = {},
--    -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
--    -- sign/virttext. Bookmarks can be used to group together positions and quickly move
--    -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
--    -- default virt_text is "".
--    bookmark_0 = {
--      -- sign = "⚑",
--      -- virt_text = "TODO",
--      -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
--      -- defaults to false.
--      annotate = true,
--    },
--    bookmark_1 = {
--        sign = "⚑",
--        virt_text = "TODO",
--        -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
--        -- defaults to false.
--        annotate = false,
--    },
--    bookmark_2 = {
--      -- sign = "⚑",
--      -- virt_text = "TODO",
--      -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
--      -- defaults to false.
--      annotate = true,
--    },
--    bookmark_3 = {
--      -- sign = "⚑",
--      -- virt_text = "TODO",
--      -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
--      -- defaults to false.
--      annotate = true,
--      },
--    bookmark_4 = {
--      -- sign = "⚑",
--      -- virt_text = "TODO",
--      -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
--      -- defaults to false.
--      annotate = true,
--    },
--    bookmark_5 = {
--      -- sign = "⚑",
--      -- virt_text = "TODO",
--      -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
--      -- defaults to false.
--      annotate = true,
--    },
--    bookmark_6 = {
--      -- sign = "⚑",
--      -- virt_text = "TODO",
--      -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
--      -- defaults to false.
--      annotate = true,
--    },
--    bookmark_7 = {
--      -- sign = "⚑",
--      -- virt_text = "TODO",
--      -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
--      -- defaults to false.
--      annotate = true,
--    },
--    bookmark_8 = {
--      -- sign = "⚑",
--      -- virt_text = "TODO",
--      -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
--      -- defaults to false.
--      annotate = true,
--    },
--    bookmark_9 = {
--      -- sign = "⚑",
--      -- virt_text = "TODO",
--      -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
--      -- defaults to false.
--      annotate = true,
--    },
--    mappings = {
--        annotate = "\\z",
--        delete_line = false,
--        delete_buf = false
--    }
--  }

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
function compose (tab1, key, val) temp = tab1; temp[key] = val; return temp end
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, compose(opts, "desc", "lsp diagnostic open float"))
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, compose(opts, "desc", "lsp diagnostic go to prev"))
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, compose(opts, "desc", "lsp diagnostic go to next"))
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, compose(opts, "desc", "set loc list"))
vim.keymap.set('n', '<C-S-I>', function() vim.lsp.buf.hover(); vim.lsp.buf.hover(); end, compose(opts, "desc", "lsp hover"))
vim.keymap.set("n", "<C-S-;>", "<cmd>Outline<CR>")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- -- Mappings.
  -- -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end


local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require'lspconfig'.pyright.setup{}
require('lspconfig')['clangd'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities, 
    cmd = { "clangd", '--background-index', '--clang-tidy' }
}

require('lspconfig')['intelephense'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities, 
    cmd = { "intelephense", '--stdio' },
    filetypes = { "php" }
}

require'lspconfig'.texlab.setup{}

require('lspconfig')['ts_ls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.lua_ls.setup{}

require'lspconfig'.html.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities, 
    cmd = { "html-languageserver", '--stdio' },
    filetypes = { 'html', 'php', 'hb' },
}



require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
local configs = require('lspconfig.configs')
local lspconfig = require('lspconfig')
if not configs.awklsp then
  configs.awklsp = {
    default_config = {
      cmd = { 'awk-language-server' },
      filetypes = { 'awk' },
      single_file_support = true,
      handlers = {
        ['workspace/workspaceFolders'] = function()
          return {{
            uri = 'file://' .. vim.fn.getcwd(),
            name = 'current_dir',
          }}
        end
      }
    },
  }
end
lspconfig.awklsp.setup{}

require'lspconfig'.bashls.setup{
    filetypes = { 'bash', 'zsh', 'sh' },
}

---@class trouble.Mode: trouble.Config,trouble.Section.spec
---@field desc? string
---@field sections? string[]

---@class trouble.Config
---@field mode? string
---@field config? fun(opts:trouble.Config)
---@field formatters? table<string,trouble.Formatter> custom formatters
---@field filters? table<string, trouble.FilterFn> custom filters
---@field sorters? table<string, trouble.SorterFn> custom sorters
local defaults = {
  auto_close = false, -- auto close when there are no items
  auto_open = false, -- auto open when there are items
  auto_preview = true, -- automatically open preview when on an item
  auto_refresh = true, -- auto refresh when open
  auto_jump = false, -- auto jump to the item when there's only one
  focus = false, -- Focus the window when opened
  restore = true, -- restores the last location in the list when opening
  follow = true, -- Follow the current item
  indent_guides = true, -- show indent guides
  max_items = 200, -- limit number of items that can be displayed per section
  multiline = true, -- render multi-line messages
  pinned = false, -- When pinned, the opened trouble window will be bound to the current buffer
  warn_no_results = true, -- show a warning when there are no results
  open_no_results = false, -- open the trouble window when there are no results
  ---@type trouble.Window.opts
  win = {}, -- window options for the results window. Can be a split or a floating window.
  -- Window options for the preview window. Can be a split, floating window,
  -- or `main` to show the preview in the main editor window.
  ---@type trouble.Window.opts
  preview = {
    type = "main",
    -- when a buffer is not yet loaded, the preview window will be created
    -- in a scratch buffer with only syntax highlighting enabled.
    -- Set to false, if you want the preview to always be a real loaded buffer.
    scratch = true,
  },
  -- Throttle/Debounce settings. Should usually not be changed.
  ---@type table<string, number|{ms:number, debounce?:boolean}>
  throttle = {
    refresh = 20, -- fetches new data when needed
    update = 10, -- updates the window
    render = 10, -- renders the window
    follow = 100, -- follows the current item
    preview = { ms = 100, debounce = true }, -- shows the preview for the current item
  },
  -- Key mappings can be set to the name of a builtin action,
  -- or you can define your own custom action.
  ---@type table<string, trouble.Action.spec>
  keys = {
    ["?"] = "help",
    r = "refresh",
    R = "toggle_refresh",
    q = "close",
    o = "jump_close",
    ["<esc>"] = "cancel",
    ["<cr>"] = "jump",
    ["<2-leftmouse>"] = "jump",
    ["<c-s>"] = "jump_split",
    ["<c-v>"] = "jump_vsplit",
    -- go down to next item (accepts count)
    -- j = "next",
    ["}"] = "next",
    ["]]"] = "next",
    -- go up to prev item (accepts count)
    -- k = "prev",
    ["{"] = "prev",
    ["[["] = "prev",
    dd = "delete",
    d = { action = "delete", mode = "v" },
    i = "inspect",
    p = "preview",
    P = "toggle_preview",
    zo = "fold_open",
    zO = "fold_open_recursive",
    zc = "fold_close",
    zC = "fold_close_recursive",
    za = "fold_toggle",
    zA = "fold_toggle_recursive",
    zm = "fold_more",
    zM = "fold_close_all",
    zr = "fold_reduce",
    zR = "fold_open_all",
    zx = "fold_update",
    zX = "fold_update_all",
    zn = "fold_disable",
    zN = "fold_enable",
    zi = "fold_toggle_enable",
    gb = { -- example of a custom action that toggles the active view filter
      action = function(view)
        view:filter({ buf = 0 }, { toggle = true })
      end,
      desc = "Toggle Current Buffer Filter",
    },
    s = { -- example of a custom action that toggles the severity
      action = function(view)
        local f = view:get_filter("severity")
        local severity = ((f and f.filter.severity or 0) + 1) % 5
        view:filter({ severity = severity }, {
          id = "severity",
          template = "{hl:Title}Filter:{hl} {severity}",
          del = severity == 0,
        })
      end,
      desc = "Toggle Severity Filter",
    },
  },
  ---@type table<string, trouble.Mode>
  modes = {
    -- sources define their own modes, which you can use directly,
    -- or override like in the example below
    lsp_references = {
      -- some modes are configurable, see the source code for more details
      params = {
        include_declaration = true,
      },
    },
    -- The LSP base mode for:
    -- * lsp_definitions, lsp_references, lsp_implementations
    -- * lsp_type_definitions, lsp_declarations, lsp_command
    lsp_base = {
      params = {
        -- don't include the current location in the results
        include_current = false,
      },
    },
    -- more advanced example that extends the lsp_document_symbols
    symbols = {
      desc = "document symbols",
      mode = "lsp_document_symbols",
      focus = false,
      win = { position = "right" },
      filter = {
        -- remove Package since luals uses it for control flow structures
        ["not"] = { ft = "lua", kind = "Package" },
        any = {
          -- all symbol kinds for help / markdown files
          ft = { "help", "markdown" },
          -- default set of symbol kinds
          kind = {
            "Class",
            "Constructor",
            "Enum",
            "Field",
            "Function",
            "Interface",
            "Method",
            "Module",
            "Namespace",
            "Package",
            "Property",
            "Struct",
            "Trait",
          },
        },
      },
    },
  },
  -- stylua: ignore
  icons = {
    ---@type trouble.Indent.symbols
    indent = {
      top           = "│ ",
      middle        = "├╴",
      last          = "└╴",
      -- last          = "-╴",
      -- last       = "╰╴", -- rounded
      fold_open     = " ",
      fold_closed   = " ",
      ws            = "  ",
    },
    folder_closed   = " ",
    folder_open     = " ",
    kinds = {
      Array         = " ",
      Boolean       = "󰨙 ",
      Class         = " ",
      Constant      = "󰏿 ",
      Constructor   = " ",
      Enum          = " ",
      EnumMember    = " ",
      Event         = " ",
      Field         = " ",
      File          = " ",
      Function      = "󰊕 ",
      Interface     = " ",
      Key           = " ",
      Method        = "󰊕 ",
      Module        = " ",
      Namespace     = "󰦮 ",
      Null          = " ",
      Number        = "󰎠 ",
      Object        = " ",
      Operator      = " ",
      Package       = " ",
      Property      = " ",
      String        = " ",
      Struct        = "󰆼 ",
      TypeParameter = " ",
      Variable      = "󰀫 ",
    },
  },
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'iceberg_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode', 
    },
    lualine_b = {'branch', 'diff', 
    {
	    'diagnostics',

	    -- Table of diagnostic sources, available sources are:
	    --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
	    -- or a function that returns a table as such:
	    --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
	    sources = { 'nvim_lsp' },

	    -- Displays diagnostics for the defined severity types
	    sections = { 'error', 'warn', 'info', 'hint' },

	    -- diagnostics_color = {
		-- -- Same values as the general color option can be used here.
		-- error = 'DiagnosticError', -- Changes diagnostics' error color.
		-- warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
		-- info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
		-- hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
	    -- },
	    symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
	    colored = false,	   -- Displays diagnostics status in color if set to true.
	    update_in_insert = false, -- Update diagnostics in insert mode.
	    always_visible = false,   -- Show diagnostics even if there are none.
    }
    },
    lualine_c = {'filename', {separator = '----'}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

local telesc = require('telescope.builtin')
-- local pando = require('pandocomatic')
require('telescope').setup{
defaults = {
    border = true,
    -- layout_strategy = "vertical",
    layout_config = { width = 130, preview_width = 80 },
    mappings = {
	i = { ["<C-l>"] = { "<esc>", type="command" }, }
    }
    },
--    extensions = {
--	file_browser = {
--	    theme = "ivy",
--	    -- disables netrw and use telescope-file-browser in its place
--	    hijack_netrw = true,
--	    initial_mode = "normal",
--	    mappings = {
--		["i"] = {
--		    -- your custom insert mode mappings
--		    },
--		    ["n"] = {
--			-- your custom normal mode mappings
--			},
--		    },
--	    },
--	},
    pickers ={
	jumplist = {
	    initial_mode = "normal"
	}
	},
}
local colors = require("catppuccin.palettes").get_palette()
local TelescopeColor = {
	TelescopeMatching = { fg = colors.flamingo },
	TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },

	TelescopePromptPrefix = { bg = colors.surface0 },
	TelescopePromptNormal = { bg = colors.surface0 },
	TelescopeResultsNormal = { bg = colors.mantle },
	TelescopePreviewNormal = { bg = colors.mantle },
	TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
	TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
	TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
	TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
	TelescopeResultsTitle = { fg = colors.mantle },
	TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
}
for hl, col in pairs(TelescopeColor) do
	vim.api.nvim_set_hl(0, hl, col)
end

-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
-- require("telescope").load_extension "file_browser"

vim.keymap.set('n', '<leader><leader>T', telesc.find_files, {desc = "telescope file finder"})
vim.keymap.set('n', '<leader><leader>g', telesc.live_grep, {desc = "telescope live grep the current directory"})
vim.keymap.set('n', '<leader>td', 'Otodo <esc>:call UltiSnips#ListSnippets()<cr>1<cr>', {desc = "create new todo with ultisnips"})
vim.keymap.set('n', '<leader><leader>G', 
    ':lua require("telescope.builtin").live_grep({search_dirs={vim.fn.expand("%:p")}})<cr>', 
    {desc = "telescope grep the current file"})
vim.keymap.set('n', '<leader><leader>f', ':FZF<cr>', {desc = "FZF"})
vim.keymap.set('n', '<C-S-j>', ':lua require("telescope.builtin").jumplist({})<cr>', {desc = "telescope jumplist"})
vim.keymap.set('n', '<leader><leader>S', ':lua require("telescope.builtin").tags({})<cr>', {desc = "telescope tags"})
-- vim.keymap.set('n', '<leader><leader>B', ':Telescope file_browser path=/home/justin/Insync/dealyjustins@gmail.com/Google\\ Drive/prog<cr>')
-- vim.keymap.set('n', '<leader><leader>b', ':Telescope file_browser path=%:p:h select_buffer=true<cr>')
vim.keymap.set('n', '<leader><leader>b', ':RnvimrToggle<cr>')
-- vim.keymap.set('n', '<leader><leader>b', ':Telescope file_browser path=%:p:h select_buffer=true<cr>')
vim.keymap.set('n', '<leader><leader>k', telesc.keymaps, {desc = "search vim help"})
-- vim.keymap.set('n', '<C-S-k>', ':lua Pandocomatic{latex=true}<cr>', {desc = "run pandocomatic"})
vim.keymap.set('n', '<C-0>', telesc.live_grep, {desc = "telescope live grep the current directory"})
vim.keymap.set('n', '<leader><leader>h', telesc.help_tags, {desc = "search vim help"})
vim.keymap.set('n', '<leader><leader>H', ':lua if origfiletype == nil then origfiletype = vim.bo.filetype end; if vim.bo.filetype ~= "html" then vim.bo.filetype = "html"; else vim.bo.filetype = origfiletype; end<cr>')
vim.keymap.set('n', '<leader><leader>v', ':lua require("telescope.builtin").live_grep({search_dirs={"/home/justin/Insync/dealyjustins@gmail.com/Google Drive/prog/learning/notes"}})<cr>')
vim.keymap.set('n', '<leader><leader>V', ':lua require("telescope.builtin").live_grep({search_dirs={"/home/justin/Insync/dealyjustins@gmail.com/Google Drive/prog"}})<cr>')
vim.keymap.set('n', '<C-Left>', ':res +1<cr>')
vim.keymap.set('n', '<C-Right>', ':res -1<cr>')
vim.keymap.set('n', '<C-Down>', ':vert res +1<cr>')
vim.keymap.set('n', '<C-Up>', ':vert res -1<cr>')
vim.keymap.set('n', '<C-PageDown>', ':res +15<cr>')
vim.keymap.set('n', '<C-PageUp>', ':res -15<cr>')
vim.keymap.set('n', '<C-S-Down>', ':vert res +15<cr>')
vim.keymap.set('n', '<C-S-Up>', ':vert res -15<cr>')
vim.keymap.set('n', '<leader>v', 'gv')
vim.keymap.set('v', '<c-l>', '<esc>')
vim.keymap.set('n', '<C-BS>', ':lua Quickgit{push=true}<cr>')
--vim.keymap.set('n', '<S-Down>', '<esc>')
--vim.keymap.set('n', '<S-Up>',   '<esc>')
--vim.keymap.set('i', '<S-Down>', '.<bs>')
--vim.keymap.set('i', '<S-Up>',   '.<bs>')
--vim.keymap.set('n', '<C-Down>', '<esc>')
--vim.keymap.set('n', '<C-Up>',   '<esc>')
--vim.keymap.set('i', '<C-Down>', '.<bs>')
--vim.keymap.set('i', '<C-Up>',   '.<bs>')
--vim.keymap.set('i', '<c-s>', '$')
vim.keymap.set('n', '<leader><leader>i', ':lua vim.lsp.buf.hover() vim.lsp.buf.hover()<cr>')

local keymap = vim.keymap.set

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
-- keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
-- keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
-- keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
-- keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
-- keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
-- 
-- -- Go to definition
-- keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")
-- 
-- -- Peek type definition
-- -- You can edit the file containing the type definition in the floating window
-- -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- -- It also supports tagstack
-- -- Use <C-t> to jump back
-- keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
-- 
-- -- Go to type definition
-- keymap("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")
-- 
-- 
-- -- Show line diagnostics
-- -- You can pass argument ++unfocus to
-- -- unfocus the show_line_diagnostics floating window
-- keymap("n", "<leader><leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
-- 
-- -- Show buffer diagnostics
-- keymap("n", "<leader><leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
-- 
-- -- Show workspace diagnostics
-- keymap("n", "<leader><leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
-- 
-- -- Show cursor diagnostics
-- keymap("n", "<leader><leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
-- 
-- -- Diagnostic jump
-- -- You can use <C-o> to jump back to your previous location
-- keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
-- keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
-- 
-- Diagnostic jump with filters such as only jumping to an error
-- keymap("n", "[E", function()
  -- require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end)
-- keymap("n", "]E", function()
  -- require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end)

-- Toggle outline
-- keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
-- keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
-- keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- Call hierarchy
-- keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
-- keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
-- keymap({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
keymap("n","<leader>kc", "inewkeyclaim <esc>:call UltiSnips#ListSnippets()<cr>1<cr>")

require('nvim-autopairs').setup({
    map_cr = true, 
    enable_check_bracket_line = true,                   -- Don't add pairs if it already have a close pairs in same line
    disable_filetype = { "TelescopePrompt" , "vim" },   --
    enable_afterquote = false,                           -- add bracket pairs after quote
    enable_moveright = true
})

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = 'single'
  opts.max_width= opts.max_width or 200
  opts.height = 10
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require'cmp'
cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  end,
},
window = {
    completion = cmp.config.window.bordered({
	winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
    }),
  documentation = cmp.config.window.bordered({
	winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
    }),
},
mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  ['<C-j>'] = cmp.mapping.select_next_item(),
  ['<C-k>'] = cmp.mapping.select_prev_item(),
  ['<C-Space>'] = cmp.mapping.complete(),
  -- ['<C-e>'] = cmp.mapping.abort(),
  ['<C-e>'] = cmp.mapping.close(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
{ name = 'nvim_lsp' },
{ name = 'nvim_lua' },
{ name = 'calc' },
-- { name = 'ultisnips' }, -- For ultisnips users.
{ name = 'nvim_lsp_signature_help' },
{ name = 'pandoc_references' },
{ name = 'path' },
{ name = 'omni' },
})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
}, {
  { name = 'buffer' },
})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
mapping = cmp.mapping.preset.cmdline(),
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
local cond = require('nvim-autopairs.conds')
-- add option map_cr
npairs.add_rules { 
  Rule('\\{', '\\}', {"tex", "latex"}),
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      local quad = opts.line:sub(opts.col - 2, opts.col + 1)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair) or vim.tbl_contains({ '\\{\\}' }, quad)
    end),
  Rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
  Rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
  Rule('[ ', ' ]')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(']'),
  --[===[
  arrow key on javascript
      Before 	Insert    After
      (item)= 	> 	    (item)=> { }
  --]===]
  Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript' })
    :use_regex(true)
    :set_end_pair_length(2),
}

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())



-- Associating TS emphasis groups with markdown groups 
vim.api.nvim_set_hl(0, "@text.strong", { link = "markdownBold" })
vim.api.nvim_set_hl(0, "@text.emphasis", { link = "markdownItalic" })

vim.api.nvim_command("hi Function guifg=#FFAAFF")
vim.api.nvim_command("hi Type guifg=#CCFFAA")
vim.api.nvim_command("hi Normal guifg=#A0F0FF")
vim.api.nvim_command("hi DiagnosticError guifg=red")


EOF
" Customize the initial layout
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.8 * &columns)),
            \ 'height': float2nr(round(0.8 * &lines)),
            \ 'col': float2nr(round(0.15 * &columns)),
            \ 'row': float2nr(round(0.15 * &lines)),
            \ 'style': 'minimal'
            \ }
hi lualine_c_inactive guibg=#000000 guifg=#EE6C05 gui=italic
