
"#########################################################################
"######### Vundle Plugins #########
set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Tame the quickfix window
Plugin 'romainl/vim-qf'

" Solarized vim
"Plugin 'altercation/vim-colors-solarized'

" FZF
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" NerdTree
Plugin 'preservim/nerdtree'

" TagBar
Plugin 'majutsushi/tagbar'

" Clang_complete
"Plugin 'xavierd/clang_complete'

" taglist
Plugin 'yegappan/taglist'

" DirDiff
Plugin 'will133/vim-dirdiff'

" Pathogen
Plugin 'tpope/vim-pathogen'

Plugin 'mileszs/ack.vim'

" vim plugin for git
Plugin 'tpope/vim-fugitive'

" for advanced search
Plugin 'haya14busa/incsearch.vim'

Plugin 'jisaacks/GitGutter'

Plugin 'Raimondi/delimitMate'

" Auto completion
Plugin 'codota/tabnine-vim'

" Plugin for commenting multiple lines
Plugin 'preservim/nerdcommenter'

" Syntax checking for C/C++
"Plugin 'vim-syntastic/syntastic'

"Plugin 'bling/vim-airline'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
" All of your Plugins must be added before the following line
call vundle#end()            " required

" Vim plug package manager
call plug#begin('~/.vim/plugged')
" to show current function name using ctags
Plug 'wellle/context.vim'

call plug#end()

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"#########################################################################

set nocompatible  " Use vim settings rather vi
set nowrap        " don't wrap lines
set tabstop=8     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set smartindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
"set number        " always show line numbers
set mouse=a       " enable all mouse access
set ttymouse=xterm2 " this needs to be set to make mouse functional in screen sessions
set shiftwidth=8  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set nofoldenable  " disable folding
set expandtab     " Converts tabs to spaces. If you want to enter a real tab character use Ctrl-V<Tab> key sequence
set smarttab
set wildmenu      " list directories/files on tab
set splitright    " new vertically split window opens to the right of the current window
set splitbelow    " new horizontally split window opens below the current window
set relativenumber
set number
set ruler
set rulerformat=%l,%v
set laststatus=2
"set statusline+=%F
set statusline=%F[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

syntax enable
set background=dark
colorscheme monokai
"let g:solarized_termcolors=256

"vimdiff colorscheme
if &diff
    "colorscheme dk_diff_color
    windo set nofoldenable
    set diffopt=filler,context:1000000
endif
highlight DiffAdd cterm=none ctermfg=white ctermbg=Blue
highlight DiffDelete cterm=none ctermfg=white ctermbg=Blue
highlight DiffChange cterm=none ctermfg=white ctermbg=Blue
highlight DiffText cterm=none ctermfg=white ctermbg=Red

set filetype=c
set nocp
filetype plugin on
set omnifunc=ccomplete

"set omnifunc=syntaxcomplete#Complete
"
"set omnifunc=ClangComplete#Complete
"set completefunc=ClangComplete
"let g:clang_library_path='/usr/lib/x86_64-linux-gnu/libclang-6.0.so.1'
"let g:clang_user_options='|| exit 0'
"let g:clang_complete_auto = 1
"let g:clang_complete_copen = 1
"let g:clang_debug = 1

" Tlist - http://vim-taglist.sourceforge.net/manual.html
let g:Tlist_WinWidth=60
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Right_Window = 1

" Moved to cscope F12 key -- map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"to close automatically the preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Get cscope related mappings
" Enabling cscope output on quickfix window
set cscopequickfix=s-,c-,d-,i-,t-,e-,f-,a-
" Vim Quick Fix movement
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>
" Set the quickfix load on last accessed window
"autocmd FileType qf wincmd p

"Key bindings of jump to tag and return from a tag
nmap <bs> <C-t>
nmap <CR> <c-]>

" Search and replace
nnoremap gr :%s///gc<Left><Left><Left><Left>
nnoremap grw :%s/<C-r><C-w>//gc<Left><Left><Left>

" Get cscope related mappings
source ~/cscope_maps.vim

" Keep binding for Goto reference
"map <C-[> <C-\>c

" Autoloading ctags
"set tags=tags;
set tags=./tags;,tags;,.git/hooks/tags;

" Autoloading Cscope Database
function! LoadCscope()
	"let db = findfile("cscope.out", ".;")
	let db = findfile("cscope.out", ".git/hooks/;")
if (!empty(db))
	let path = strpart(db, 0, match(db, "/cscope.out$"))
	set nocscopeverbose " suppress duplicate connection error
	exe "cs add " . db . " " . path
	set cscopeverbose
	set autowrite
	endif
endfunction

"au BufEnter /* call LoadCscope()
call LoadCscope()

"let $GIT_SSL_NO_VERIFY = 'true'

"Keyboard shortcuts
nmap <F8> :TlistToggle<CR>
nmap <F9> :NERDTreeToggle<CR>

" FZF key bindings
source ~/fzf_maps.vim

"Pathogen package installer
execute pathogen#infect()

"Vim session auto save
"autocmd VimEnter * Obsession .

" Vim auto load external project's tags and cscope
if filereadable(".git/hooks/ext_proj.vim") 
    source .git/hooks/ext_proj.vim 
endif

" Auto tags updation on file save
"autocmd BufWritePost *.c,*.h,*.cpp 
"\   silent !source ./.git/hooks/ide
"\   silent cscope add ./.git/hooks/cscope.out
"\   silent cscope reset

nmap <F10> :!source ./.git/hooks/ide<CR>:silent cscope add ./.git/hooks/cscope.out<CR><CR>:silent cscope reset<CR><CR>

" Default to not read-only in vimdiff
set noro

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Keyboard mappings for multiple tabs in Vim
"map <C-t><up> :tabr<cr>
"map <C-t><down> :tabl<cr>
"map <C-t><left> :tabp<cr>
"map <C-t><right> :tabn<cr>

" To retain the code fold on reopening Vim
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Snippets config
"let g:UltiSnipsExpandTrigger="<c-i>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"Git airline config
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#whitespace#enabled = 0 
" Enable terminal colours
set t_Co=256
" To enable powerline fonts for airline status
"let g:airline_powerline_fonts = 1
" Configure sections
"let g:airline_section_b = '%-0.10{getcwd()}'
"let g:airline_section_c = '%t'
"let g:airline_section_b = ''

" GitGutter related settings
let g:gitgutter_enabled = 1
set updatetime=100
" To show GitGutterHunkSummary
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
    return printf(' +%d ~%d -%d', a, m, r)
endfunction
"set statusline+=%{GitStatus()}
